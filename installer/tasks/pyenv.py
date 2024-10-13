import re
from pathlib import Path

from pyinfra import logger
from pyinfra.api.exceptions import OperationError
from pyinfra.api.facts import FactBase
from pyinfra.context import host
from pyinfra.facts.files import Link
from pyinfra.facts.server import Command
from pyinfra.operations import apt, python, server

HOME_DIR = Path(host.get_fact(Command, "echo $HOME"))
PYENV_DIR = HOME_DIR / ".pyenv"
BIN_DIR = PYENV_DIR / "bin"
BIN_PATH = BIN_DIR / "pyenv"
PYTHON_VERSION_MATCHER = re.compile(r" (3\.\d+\.\d+)$")
PYENV_VERSION_MATCHER = re.compile(r"pyenv (\d+\.\d+\.\d+)$")


class PyenvVersion(FactBase[str | None]):

    def command(self):
        return f"{BIN_PATH} --version"

    def process(self, output):
        result = list(output)
        if len(result) != 1:
            return None

        match = PYENV_VERSION_MATCHER.match(result[0])
        return (match and match.group(1)) or None


class PyenvListAllAvailable(FactBase[list[str]]):
    def command(self):
        return f"{BIN_PATH} install --list"

    def process(self, output):
        result: list[str] = []
        for entry in output:
            match = PYTHON_VERSION_MATCHER.search(entry)
            if match is not None:
                result.append(match.group(1))
        return result


pyenv_location = host.get_fact(Link, path=str(BIN_PATH))
if not pyenv_location:
    logger.info("pyenv not found.")
    install_packages = apt.packages(
        name="Install pyenv pre-requisites",
        packages=[
            "build-essential",
            "libssl-dev",
            "zlib1g-dev",
            "libbz2-dev",
            "libreadline-dev",
            "libsqlite3-dev",
            "curl",
            "git",
            "libncursesw5-dev",
            "xz-utils",
            "tk-dev",
            "libxml2-dev",
            "libxmlsec1-dev",
            "libffi-dev",
            "liblzma-dev",
        ],
        present=True,
        _sudo=True,
    )

    pyenv_install_url = "https://pyenv.run"
    pyenv_install = server.shell(
        name="Install pyenv",
        commands=[f"curl {pyenv_install_url} | bash"],
    )

    def install_latest_python_version():
        available_versions = host.get_fact(PyenvListAllAvailable)
        if not available_versions:
            raise OperationError("nvm returned no available node versions to install.")

        latest_version = available_versions[-1]
        server.shell(
            name=f"Install latest python version found: {latest_version}",
            commands=[
                f"{BIN_PATH} install {latest_version}",
            ],
        )

    python.call(
        name="Install python latest version.",
        function=install_latest_python_version,
        _if=[pyenv_install.did_succeed],
    )
else:
    pyenv_version = host.get_fact(PyenvVersion)
    logger.info(f"pyenv {pyenv_version} is installed!")
