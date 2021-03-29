
from ruamel.yaml import YAML
from jinja2 import Environment, FileSystemLoader
import os

# Capture our current directory
THIS_DIR = os.path.dirname(os.path.abspath(__file__))


def main():
    env = Environment(loader=FileSystemLoader(THIS_DIR), trim_blocks=True)
    yaml = YAML()
    with open("resume.yml", "r") as read_file:
        data = yaml.load(read_file)
    with open("resume.html", "w+") as write_file:
        write_file.write(env.get_template("resume_template.html").render(**data))


if __name__ == "__main__":
    main()
