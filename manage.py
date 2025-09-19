import argparse
from pathlib import Path
import shutil
import json


def save_config_archlinux(config: dict, environment: str) -> None:
    local_config_path = Path(f"~/.config/{config['name']}").expanduser()
    if "local_config_path" in config.keys():
        local_config_path = config["local_config_path"]
    git_config_path = Path(__file__).resolve().parent / f"archlinux/{environment}/{config['name']}"

    git_config_path.mkdir(parents=True, exist_ok=True)
    local_config_path.mkdir(parents=True, exist_ok=True)

    shutil.rmtree(git_config_path)
    if "ignore" in config.keys():
        shutil.copytree(local_config_path, git_config_path, ignore=shutil.ignore_patterns(*config["ignore"]), dirs_exist_ok=True)
    else:
        shutil.copytree(local_config_path, git_config_path, dirs_exist_ok=True)

def deploy_config_archlinux(config: dict, environment: str) -> None:
    local_config_path = Path(f"~/.config/{config['name']}").expanduser()
    if "local_config_path" in config.keys():
        local_config_path = config["local_config_path"]

    git_config_path.mkdir(parents=True, exist_ok=True)
    local_config_path.mkdir(parents=True, exist_ok=True)

    git_config_path = Path(f"{__file__}").resolve().parent / f"archlinux/{environment}/{config['name']}"
    shutil.copytree(git_config_path, local_config_path, dirs_exist_ok=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
                prog="Config manager",
                description="Python tool to manager my config"   
             )
    parser.add_argument(
        "action",
        choices=["save", "deploy"]
    )
    parser.add_argument(
        "-e",
        "--environment",
        choices=["Desktop", "Laptop"],
        required=True
    )
    parser.add_argument(
        "-p",
        "--config-path",
        type=Path,
        required=True
    )

    args = parser.parse_args()

    action = args.action
    environment = args.environment
    config_path = args.config_path

    if not config_path.is_file():
        raise FileNotFoundError(f"Config file path not found: {config_path}")

    with config_path.open() as file:
        configs = json.load(file)

    if action == "save":
        for config in configs:
            print(f"Saving {config['name']}")
            save_config_archlinux(config, environment)
    elif action == "deploy":
        for config in configs:
            print(f"Deploying {config['name']}")
            deploy_config_archlinux(config, environment)
