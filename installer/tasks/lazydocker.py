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
LAZYDOCKER_VERSION_MATCHER = re.compile(r"Version: (\d+\.\d+\.\d+)")
LAZYDOCKER_RELEASE_VERSION_MATCHER = re.compile(r"v(\d+\.\d+\.\d+)")
BIN_PATH = Path("/usr/local/bin") / "lazydocker"


class LazydockerVersion(FactBase[str | None]):
    def command(self):
        return f"{BIN_PATH} --version"

    def process(self, output):
        result = list(output)
        if len(result) < 1:
            return None

        match = LAZYDOCKER_VERSION_MATCHER.match(result[0])
        return (match and match.group(1)) or None


class LazydockerLatestVersion(FactBase[str | None]):
    def command(self):
        return 'curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest"'

    def process(self, output):
        parsed = json.loads("".join(output))
        match = LAZYDOCKER_RELEASE_VERSION_MATCHER.match(parsed["tag_name"])
        return (match and match.group(1)) or None


lazydocker_bin = host.get_fact(File, path=str(BIN_PATH))
if not lazydocker_bin:
    logger.info("lazydocker binary not found")

    host_arch = host.get_fact(Arch)
    latest_lazydocker_version = host.get_fact(LazydockerLatestVersion)

    LAZYDOCKER_FILE_NAME = {
        "aarch64": "lazydocker_{version}_Linux_arm64.tar.gz",
        "X86_64": "lazydocker_{version}_Linux_x86_64.tar.gz",
    }

    tar_url = f"https://github.com/jesseduffield/lazydocker/releases/latest/download/{LAZYDOCKER_FILE_NAME[host_arch].format(version=latest_lazydocker_version)}"
    tar_destination = "/tmp/lazydocker.tar.gz"
    tar_download = files.download(
        name="Download the lazydocker binary",
        src=tar_url,
        dest=tar_destination,
        cache_time=3600,
    )

    server.shell(
        name="Unpack tar and install",
        commands=[
            f"tar xf {tar_destination} lazydocker",
            "sudo install lazydocker /usr/local/bin",
        ],
        _chdir="/tmp",
        _if=[tar_download.did_succeed],
    )
else:
    lazydocker_version = host.get_fact(LazydockerVersion)
    logger.info(f"lazydocker {lazydocker_version} installed.")
