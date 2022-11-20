
import sys
import os
sys.path.append(r'C:\Users\PJ\Documents\GitHub\bazelrio_bzlmod\bazelrio_bzlmod_gentool')
sys.path.append(r"C:\Users\PJ\Documents\GitHub\bazelrio_bzlmod\bazelrio_bzlmod-opencv\generate")

from generate_opencv import get_opencv_dependencies
from bazelrio_gentool.deps.dependency_container import DependencyContainer
from bazelrio_gentool.deps.cc_dependency import CcDependency
from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_json import generate_json
from bazelrio_gentool.generate_maven_cpp_deps import generate_maven_cpp_deps
from platforms import default_all_platforms, default_native_shared_platforms
from utils import TEMPLATE_BASE_DIR, write_file, render_template


def _cc_dependency(group, parent_folder, resources=None, **kwargs):
    if resources == None:
        resources = default_all_platforms()
    group.create_cc_dependency(f"{parent_folder}-cpp", group_id=f"edu.wpi.first.{parent_folder}", parent_folder=parent_folder, headers="headers", resources=resources, **kwargs)
    
def _java_dependency(group, parent_folder, has_jni=False, **kwargs):
    group.create_java_dependency(f"{parent_folder}-java", group_id=f"edu.wpi.first.{parent_folder}", parent_folder=parent_folder, **kwargs)

def _halsim_dependency(group, parent_folder, resources=None, **kwargs):
    if resources == None:
        resources = default_native_shared_platforms()
    group.create_cc_dependency(f"{parent_folder}", group_id=f"edu.wpi.first.halsim", has_jni=False, parent_folder=parent_folder, headers=None, resources=resources, **kwargs)
    
def _java_tool(maven_dep, artifact_name, group_id="edu.wpi.first.tools", native_platforms=["linuxx64", "macx64", "winx64"]):
    if native_platforms:
        maven_dep.create_java_native_tool(artifact_name=artifact_name, group_id=group_id, resources=native_platforms)

def _executable_tool(maven_dep, artifact_name, group_id="edu.wpi.first.tools", native_platforms = None):
    native_platforms = native_platforms or default_native_shared_platforms()

    maven_dep.create_executable_tool(
        artifact_name=artifact_name,
        group_id=group_id,
        resources=native_platforms,
    )

def get_allwpilib_dependencies():

    opencv_group = get_opencv_dependencies()

    group = DependencyContainer("allwpilib", "2023.1.1-beta-3", "https://frcmaven.wpi.edu/release")
    group.dep_lookup.update(opencv_group.dep_lookup)


    _cc_dependency(group, "wpiutil", has_jni=True)
    _cc_dependency(group, "wpinet", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "wpimath", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "hal", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "ntcore", has_jni=True, dependencies=["wpiutil-cpp", "wpinet-cpp"])
    _cc_dependency(group, "cscore", has_jni=True, dependencies=["wpiutil-cpp", "wpinet-cpp", "opencv-cpp"])
    _cc_dependency(group, "cameraserver", has_jni=False, dependencies=["wpiutil-cpp", "cscore-cpp", "ntcore-cpp", "wpinet-cpp", "opencv-cpp"])
    _cc_dependency(group, "wpilibc", has_jni=False, dependencies=["wpiutil-cpp", "wpimath-cpp", "wpinet-cpp", "cscore-cpp", "ntcore-cpp", "hal-cpp", "cameraserver-cpp", "opencv-cpp"])
    _cc_dependency(group, "wpilibNewCommands", has_jni=False, dependencies=["wpiutil-cpp", "wpimath-cpp", "wpinet-cpp", "cscore-cpp", "ntcore-cpp", "hal-cpp", "cameraserver-cpp", "opencv-cpp", "wpilibc-cpp"])
    
    _java_dependency(group, "wpiutil", dependencies=["wpiutil-cpp"], maven_deps=[
        ("com.fasterxml.jackson.core:jackson-annotations", "2.12.4"),
        ("com.fasterxml.jackson.core:jackson-core", "2.12.4"),
        ("com.fasterxml.jackson.core:jackson-databind", "2.12.4")])
    _java_dependency(group, "wpinet", dependencies=["wpiutil-java", "wpiutil-cpp", "wpinet-cpp"])
    _java_dependency(group, "wpimath", dependencies=["wpiutil-java", "wpiutil-cpp", "wpimath-cpp"], maven_deps=[("org.ejml:ejml-simple", "0.41")])
    _java_dependency(group, "hal", dependencies=["wpiutil-java", "wpiutil-cpp", "hal-cpp"])
    _java_dependency(group, "ntcore", dependencies=["wpiutil-java", "wpiutil-cpp", "wpinet-java", "wpinet-cpp", "ntcore-cpp"])
    _java_dependency(group, "cscore", dependencies=["wpiutil-java", "wpiutil-cpp", "wpinet-java", "wpinet-cpp", "cscore-cpp", "opencv-cpp", "opencv-java"])
    _java_dependency(group, "cameraserver", dependencies=["wpiutil-java", "wpiutil-cpp", "cscore-cpp", "cscore-java", "ntcore-java", "ntcore-cpp", "wpinet-java", "wpinet-cpp", "opencv-cpp"])
    _java_dependency(group, "wpilibj", dependencies=["wpiutil-cpp", "wpiutil-java", "wpimath-cpp", "wpimath-java", "wpinet-cpp", "wpinet-java", "cscore-cpp", "cscore-java", "ntcore-cpp", "ntcore-java", "hal-cpp", "hal-java", "cameraserver-cpp", "cameraserver-java", "opencv-cpp"])
    _java_dependency(group, "wpilibNewCommands", dependencies=["wpiutil-cpp", "wpiutil-java", "wpimath-cpp", "wpimath-java", "wpinet-cpp", "wpinet-java", "cscore-cpp", "cscore-java", "ntcore-cpp", "ntcore-java", "hal-cpp", "hal-java", "cameraserver-cpp", "cameraserver-java", "opencv-cpp", "wpilibj-java"])

    _halsim_dependency(group, "halsim_ds_socket", dependencies=["hal-cpp", "wpiutil-cpp", "wpinet-cpp"])
    _halsim_dependency(group, "halsim_gui", dependencies=["hal-cpp", "wpiutil-cpp", "wpinet-cpp", "ntcore-cpp"])
    _halsim_dependency(group, "halsim_ws_client", dependencies=["hal-cpp", "wpiutil-cpp", "wpinet-cpp"])
    _halsim_dependency(group, "halsim_ws_server", dependencies=["hal-cpp", "wpiutil-cpp", "wpinet-cpp"])

    _executable_tool(group, "Glass")
    _executable_tool(group, "OutlineViewer")
    _java_tool(group, "SmartDashboard")
    _java_tool(group, "PathWeaver")
    _java_tool(group, "RobotBuilder", native_platforms=[""])
    _java_tool(group, "Shuffleboard")

    return group

def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    output_dir = os.path.join(SCRIPT_DIR, "..", "dependencies")
    registry_location = os.path.join(SCRIPT_DIR, "..", '..', "bazel-central-registry")

    group = get_allwpilib_dependencies()
    group.repository_url = "https://github.com/pjreiniger/bzlmodRio-allwpilib/archive/refs/heads/2023_beta.zip"
    group.strip_prefix = "bzlmodRio-allwpilib-2023_beta/dependencies"

    # generate_group(output_dir, group)
    # generate_maven_cpp_deps(output_dir, group)

    
    output_file = os.path.join(output_dir, "..", "MODULE.bazel")
    template_file = os.path.join(TEMPLATE_BASE_DIR, "top_module.jinja2")
    render_template(template_file, output_file, group=group)

    # generate_toplevel_module_deps(, group)
    # generate_json(registry_location, group)
    
if __name__ == "__main__":
    main()
