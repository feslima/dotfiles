import re
from pathlib import Path

from pyinfra import logger
from pyinfra.api.facts import FactBase
from pyinfra.context import host
from pyinfra.facts.files import File
from pyinfra.facts.server import Command
from pyinfra.operations import server

HOME_DIR = Path(host.get_fact(Command, "echo $HOME"))
CARGO_DIR = HOME_DIR / ".cargo"
BIN_DIR = CARGO_DIR / "bin"
BIN_PATH = BIN_DIR / "cargo"
CARGO_VERSION_MATCHER = re.compile(r"cargo (1\.\d+\.\d+)")


class CargoVersion(FactBase[str | None]):

    def command(self):
        return f"{BIN_PATH} version"

    def process(self, output):
        result = list(output)
        if len(result) != 1:
            return None

        match = CARGO_VERSION_MATCHER.match(result[0])
        return (match and match.group(1)) or None


cargo_location = host.get_fact(File, path=str(BIN_PATH))
if not cargo_location:
    logger.info("cargo not found.")

    cargo_install_url = "curl https://sh.rustup.rs -sSf"
    cargo_install = server.shell(
        name="Install cargo",
        commands=[f"curl {cargo_install_url} | sh -s -- -y"],
        _shell_executable="sh",
    )
else:
    cargo_version = host.get_fact(CargoVersion)
    logger.info(f"cargo {cargo_version} is installed!")
