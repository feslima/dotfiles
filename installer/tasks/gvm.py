import re
from pathlib import Path

from pyinfra import logger
from pyinfra.api.exceptions import OperationError
from pyinfra.api.facts import FactBase
from pyinfra.context import host
from pyinfra.facts.files import File
from pyinfra.facts.server import Command
from pyinfra.operations import apt, python, server

VERSION_MATCHER = re.compile(r"v\d+\.\d+\.\d+")
GO_VERSION_MATCHER = re.compile(r"go1\.\d*(\.\d\d*)*$")


HOME_DIR = Path(host.get_fact(Command, "echo $HOME"))
GVM_SCRIPT = HOME_DIR / ".gvm" / "scripts" / "gvm"


def get_script_file_info():
    return host.get_fact(File, path=str(GVM_SCRIPT))


gvm_script_file_info = host.get_fact(File, path=str(GVM_SCRIPT))


class GvmVersion(FactBase[str | None]):
    def command(self):
        return f"source {GVM_SCRIPT} && gvm version"

    def process(self, output):
        result = list(output)
        if len(result) < 1:
            return None

        match: list[str] = VERSION_MATCHER.findall(result[0])
        return (len(match) > 0 and match[0]) or None


class GvmListGoInstalled(FactBase[list[str]]):
    def command(self):
        return f"source {GVM_SCRIPT} && gvm list"

    def process(self, output):
        result: list[str] = []
        for entry in output:
            match = GO_VERSION_MATCHER.search(entry)
            if match is not None:
                result.append(match.group(0))
        return result


class GvmListAllAvailable(FactBase[list[str]]):
    def command(self):
        return f"source {GVM_SCRIPT} && gvm listall"

    def process(self, output):
        result: list[str] = []
        for entry in output:
            match = GO_VERSION_MATCHER.search(entry)
            if match is not None:
                result.append(match.group(0))
        return result


def install_latest_go_version():
    available_versions = host.get_fact(GvmListAllAvailable)
    if not available_versions:
        raise OperationError("gvm returned no available go versions to install.")

    latest_version = available_versions[-1]

    server.shell(
        name=f"Install latest go version found: {latest_version}",
        commands=[
            f"source {GVM_SCRIPT} && gvm install go1.21.0 -B",
            f"source {GVM_SCRIPT} && gvm use go1.21.0 --default",
            f"source {GVM_SCRIPT} && GOROOT_BOOTSTRAP=$GOROOT && gvm install {latest_version}",
            f"source {GVM_SCRIPT} && gvm use {latest_version}",
        ],
    )


if gvm_script_file_info is None:
    logger.info("gvm not found.")
    install_packages = apt.packages(
        name="Install gvm pre-requisites",
        packages=["bison"],
        present=True,
        _sudo=True,
    )

    gvm_script_url = (
        "https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer"
    )
    gvm_install = server.shell(
        name="Run gvm install script",
        commands=[f"curl -sSL {gvm_script_url} | bash"],
    )

    python.call(
        name="Install go latest version.",
        function=install_latest_go_version,
        _if=[gvm_install.did_succeed],
    )

else:
    gvm_version = host.get_fact(GvmVersion)
    logger.info(f"gvm version {gvm_version} already installed.")
