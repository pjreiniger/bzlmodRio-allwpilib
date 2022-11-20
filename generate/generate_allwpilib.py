
import os
from get_allwpilib_dependencies import get_allwpilib_dependencies

from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_maven_cpp_deps import generate_maven_cpp_deps
from bazelrio_gentool.generate_module_project_files import generate_module_project_files
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template

def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(SCRIPT_DIR, "..", "dependencies")

    group = get_allwpilib_dependencies()

    generate_module_project_files(REPO_DIR, group)
    generate_group(output_dir, group)

    # generate_maven_cpp_deps(output_dir, group)

    # output_file = os.path.join(output_dir, "..", "MODULE.bazel")
    # template_file = os.path.join(TEMPLATE_BASE_DIR, "top_module.jinja2")
    # render_template(template_file, output_file, group=group)

    # generate_toplevel_module_deps(, group)
    
if __name__ == "__main__":
    main()
