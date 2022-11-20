
import os
from get_allwpilib_dependencies import get_allwpilib_dependencies

from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_module_project_files import generate_module_project_files
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template

def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "dependencies")

    group = get_allwpilib_dependencies()

    clean_existing_version(REPO_DIR)
    generate_module_project_files(REPO_DIR, group)
    generate_group(output_dir, group)
    
if __name__ == "__main__":
    main()
