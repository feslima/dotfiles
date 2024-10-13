import json
import re
from pathlib import Path

from pyinfra import logger
from pyinfra.api.facts import FactBase
from pyinfra.context import host
from pyinfra.facts.files import File
from pyinfra.facts.server import Arch, Command
from pyinfra.operations import files, server

HOME_DIR = Path(host.get_fact(Command, "echo $HOME"))
CONFIG_DIR = HOME_DIR / ".config" / "nvim"
LAZYGIT_VERSION_MATCHER = re.compile(r", version=(\d+\.\d+\.\d+)")
LAZYGIT_RELEASE_VERSION_MATCHER = re.compile(r"v(\d+\.\d+\.\d+)")
BIN_PATH = Path("/usr/local/bin") / "lazygit"


class LazygitVersion(FactBase[str | None]):
    def command(self):
        return f"{BIN_PATH} --version"

    def process(self, output):
        result = list(output)
        if len(result) < 1:
            return None

        match = LAZYGIT_VERSION_MATCHER.search(result[0])
        return (match and match.group(1)) or None


class LazygitLatestVersion(FactBase[str | None]):
    def command(self):
        return 'curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest"'

    def process(self, output):
        parsed = json.loads("".join(output))
        match = LAZYGIT_RELEASE_VERSION_MATCHER.match(parsed["tag_name"])
        return (match and match.group(1)) or None


lazygit_bin = host.get_fact(File, path=str(BIN_PATH))
if not lazygit_bin:
    logger.info("lazygit binary not found")

    host_arch = host.get_fact(Arch)
    latest_lazygit_version = host.get_fact(LazygitLatestVersion)

    LAZYGIT_FILE_NAME = {
        "aarch64": "lazygit_{version}_Linux_arm64.tar.gz",
        "X86_64": "lazygit_{version}_Linux_x86_64.tar.gz",
    }

    tar_url = f"https://github.com/jesseduffield/lazygit/releases/latest/download/{LAZYGIT_FILE_NAME[host_arch].format(version=latest_lazygit_version)}"
    tar_destination = "/tmp/lazygit.tar.gz"
    tar_download = files.download(
        name="Download the lazygit binary",
        src=tar_url,
        dest=tar_destination,
        cache_time=3600,
    )

    server.shell(
        name="Unpack tar and install",
        commands=[
            f"tar xf {tar_destination} lazygit",
            "sudo install lazygit /usr/local/bin",
        ],
        _chdir="/tmp",
        _if=[tar_download.did_succeed],
    )
else:
    lazygit_version = host.get_fact(LazygitVersion)
    logger.info(f"lazygit {lazygit_version} installed.")
