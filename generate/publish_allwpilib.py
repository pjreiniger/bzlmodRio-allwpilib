
import os
from get_allwpilib_dependencies import get_allwpilib_dependencies
from bazelrio_gentool.generate_json import generate_json

def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    registry_location = os.path.join(SCRIPT_DIR, "..", '..', "bazel-central-registry")

    group = get_allwpilib_dependencies()
    
    module_json_template = os.path.join(SCRIPT_DIR, "module_config.json.jinja2")
    generate_json(registry_location, group, module_json_template)


if __name__ == "__main__":
    main()