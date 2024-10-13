import re
from pathlib import Path

from pyinfra import logger
from pyinfra.api.exceptions import OperationError
from pyinfra.api.facts import FactBase
from pyinfra.context import host
from pyinfra.facts.files import File
from pyinfra.facts.server import Command
from pyinfra.operations import python, server

NVM_VERSION = "0.40.1"

HOME_DIR = Path(host.get_fact(Command, "echo $HOME"))
NVM_DIR = HOME_DIR / ".nvm"
NVM_SCRIPT = NVM_DIR / "nvm.sh"

NODE_VERSION_MATCHER = re.compile(r"v(\d+\.\d+\.\d+)")


class NvmListAllAvailable(FactBase[list[str]]):
    def command(self):
        return f"source {NVM_SCRIPT} && nvm ls-remote --lts"

    def process(self, output):
        result: list[str] = []
        for entry in output:
            match = NODE_VERSION_MATCHER.search(entry)
            if match is not None:
                result.append(match.group(1))
        return result


nvm_script_exists = host.get_fact(File, path=str(NVM_SCRIPT))
if not nvm_script_exists:

    def install_latest_node_version():
        available_versions = host.get_fact(NvmListAllAvailable)
        if not available_versions:
            raise OperationError("nvm returned no available node versions to install.")

        latest_version = available_versions[-1]
        server.shell(
            name=f"Install latest node version found: {latest_version}",
            commands=[
                f"source {NVM_SCRIPT} && nvm install {latest_version}",
                f"source {NVM_SCRIPT} && nvm use {latest_version}",
            ],
        )

    logger.info("nvm does not script exist. Downloading and installing it.")
    nvm_install_url = (
        f"https://raw.githubusercontent.com/nvm-sh/nvm/v{NVM_VERSION}/install.sh"
    )
    nvm_install = server.shell(
        name="Install nvm",
        commands=[f"curl {nvm_install_url} | bash"],
    )

    python.call(
        name="Install node latest version.",
        function=install_latest_node_version,
        _if=[nvm_install.did_succeed],
    )

else:
    logger.info("nvm is ready for use!")
