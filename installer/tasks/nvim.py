import re
from pathlib import Path

from pyinfra import logger
from pyinfra.api.facts import FactBase
from pyinfra.context import host
from pyinfra.facts.server import Command
from pyinfra.operations import apt, files, git, server

HOME_DIR = Path(host.get_fact(Command, "echo $HOME"))
NVIM_DIR = HOME_DIR / "neovim"
BIN_DIR = NVIM_DIR / "bin"
BIN_PATH = BIN_DIR / "nvim"
NVIM_VERSION_MATCHER = re.compile(r"NVIM v(\d+\.\d+\.\d+)$")


class NvimVersion(FactBase[str | None]):

    def command(self):
        return f"{BIN_PATH} --version"

    def process(self, output):
        result = list(output)
        if len(result) < 1:
            return None

        match = NVIM_VERSION_MATCHER.match(result[0])
        return (match and match.group(1)) or None


nvim_version = host.get_fact(NvimVersion)
if nvim_version is None:
    logger.info("nvim not found.")
    install_packages = apt.packages(
        name="Install neovim pre-requisites",
        packages=[
            "curl",
            "cmake",
            "gettext",
            "ninja-build",
            "unzip",
            "build-essential",
        ],
        present=True,
        _sudo=True,
    )

    REPO_DIR = Path("/tmp/neovim")
    clone_repo = git.repo(
        name="Clone repository",
        src="https://github.com/neovim/neovim",
        dest=str(REPO_DIR),
        pull=False,
        _if=[install_packages.did_succeed],
    )

    clean_build_dir = files.directory(
        name="Ensure build subdirectory is clean",
        path=str(REPO_DIR / "build"),
        present=False,
        _if=[clone_repo.did_succeed],
    )

    install_dir = files.directory(
        name="Ensure installation directory exists",
        path=str(NVIM_DIR),
        _if=[clone_repo.did_succeed],
    )

    server.shell(
        name="Build neovim and make it available in path",
        commands=[
            "git checkout stable",
            f'make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX={NVIM_DIR}"',
            "make install",
            f"echo 'export PATH=\"{BIN_DIR}:$PATH\"' >> {HOME_DIR}/.bashrc",
        ],
        _chdir=str(REPO_DIR),
        _if=[lambda: clean_build_dir.did_succeed() and install_dir.did_succeed()],
    )
else:
    logger.info(f"nvim {nvim_version} is installed!")
