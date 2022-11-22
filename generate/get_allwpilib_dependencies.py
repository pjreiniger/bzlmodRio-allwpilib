
import sys
sys.path.append(r'C:\Users\PJ\Documents\GitHub\bazelrio_bzlmod\bazelrio_bzlmod_gentool')
sys.path.append(r"C:\Users\PJ\Documents\GitHub\bazelrio_bzlmod\bazelrio_bzlmod-opencv\generate")

from generate_opencv import get_opencv_dependencies
from bazelrio_gentool.deps.dependency_container import DependencyContainer

def _default_native_shared_platforms():
    return ["windowsx86-64", "linuxx86-64", "osxx86-64"]

def _default_native_static_platforms():
    return ["windowsx86-64static", "linuxx86-64static", "osxx86-64static"]


def _default_all_platforms():
    return (
        ["linuxathena", "linuxathenastatic"]
        + _default_native_shared_platforms()
        + _default_native_static_platforms()
    )

def _default_java_tools_platforms():
    return ["linux64", "mac64", "win64"]

def _cc_dependency(group, parent_folder, resources=None, **kwargs):
    if resources == None:
        resources = _default_all_platforms()
    group.create_cc_dependency(f"{parent_folder}-cpp", group_id=f"edu.wpi.first.{parent_folder}", parent_folder=parent_folder, headers="headers", resources=resources, **kwargs)
    
def _java_dependency(group, parent_folder, has_jni=False, **kwargs):
    group.create_java_dependency(f"{parent_folder}-java", group_id=f"edu.wpi.first.{parent_folder}", parent_folder=parent_folder, **kwargs)

def _halsim_dependency(group, parent_folder, resources=None, **kwargs):
    if resources == None:
        resources = _default_native_shared_platforms()
    group.create_cc_dependency(f"{parent_folder}", group_id=f"edu.wpi.first.halsim", has_jni=False, parent_folder=parent_folder, headers=None, resources=resources, **kwargs)

def _java_tool(maven_dep, artifact_name, main_class, group_id="edu.wpi.first.tools", native_platforms=_default_java_tools_platforms()):
    if native_platforms:
        maven_dep.create_java_native_tool(main_class=main_class, artifact_name=artifact_name, group_id=group_id, resources=native_platforms)

def _executable_tool(maven_dep, artifact_name, group_id="edu.wpi.first.tools", native_platforms = None):
    native_platforms = native_platforms or _default_native_shared_platforms()

    maven_dep.create_executable_tool(
        artifact_name=artifact_name,
        group_id=group_id,
        resources=native_platforms,
    )


def get_allwpilib_dependencies():
    year = "2021"
    version = f"{year}.2.1"
    opencv_version = "3.4.7-4"

    opencv_group = get_opencv_dependencies()

    group = DependencyContainer("allwpilib", version, year, "https://frcmaven.wpi.edu/release")
    group.add_module_dependency(get_opencv_dependencies(), override_version=opencv_version)

    _cc_dependency(group, "wpiutil", has_jni=True)
    _cc_dependency(group, "wpimath", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "hal", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "ntcore", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "cscore", has_jni=True, dependencies=["wpiutil-cpp", "opencv-cpp"])
    _cc_dependency(group, "cameraserver", has_jni=False, dependencies=["wpiutil-cpp", "cscore-cpp", "ntcore-cpp", "opencv-cpp"])
    _cc_dependency(group, "wpilibc", has_jni=False, dependencies=["wpiutil-cpp", "wpimath-cpp", "cscore-cpp", "ntcore-cpp", "hal-cpp", "cameraserver-cpp", "opencv-cpp"])
    _cc_dependency(group, "wpilibNewCommands", has_jni=False, dependencies=["wpiutil-cpp", "wpimath-cpp", "cscore-cpp", "ntcore-cpp", "hal-cpp", "cameraserver-cpp", "opencv-cpp", "wpilibc-cpp"])
    _cc_dependency(group, "wpilibOldCommands", has_jni=False, dependencies=["wpiutil-cpp", "wpimath-cpp", "cscore-cpp", "ntcore-cpp", "hal-cpp", "cameraserver-cpp", "opencv-cpp", "wpilibc-cpp"])
    
    _java_dependency(group, "wpiutil", dependencies=["wpiutil-cpp"], maven_deps=[
        ("com.fasterxml.jackson.core:jackson-annotations", "2.12.4"),
        ("com.fasterxml.jackson.core:jackson-core", "2.12.4"),
        ("com.fasterxml.jackson.core:jackson-databind", "2.12.4")])
    _java_dependency(group, "wpimath", dependencies=["wpiutil-java", "wpiutil-cpp", "wpimath-cpp"], maven_deps=[("org.ejml:ejml-simple", "0.41")])
    _java_dependency(group, "hal", dependencies=["wpiutil-java", "wpiutil-cpp", "hal-cpp"])
    _java_dependency(group, "ntcore", dependencies=["wpiutil-java", "wpiutil-cpp", "ntcore-cpp"])
    _java_dependency(group, "cscore", dependencies=["wpiutil-java", "wpiutil-cpp", "cscore-cpp", "opencv-cpp", "opencv-java"])
    _java_dependency(group, "cameraserver", dependencies=["wpiutil-java", "wpiutil-cpp", "cscore-cpp", "cscore-java", "ntcore-java", "ntcore-cpp", "opencv-cpp"])
    _java_dependency(group, "wpilibj", dependencies=["wpiutil-cpp", "wpiutil-java", "wpimath-cpp", "wpimath-java", "cscore-cpp", "cscore-java", "ntcore-cpp", "ntcore-java", "hal-cpp", "hal-java", "cameraserver-java", "opencv-cpp"])
    _java_dependency(group, "wpilibNewCommands", dependencies=["wpiutil-cpp", "wpiutil-java", "wpimath-cpp", "wpimath-java", "cscore-cpp", "cscore-java", "ntcore-cpp", "ntcore-java", "hal-cpp", "hal-java", "cameraserver-java", "opencv-cpp", "wpilibj-java"])
    _java_dependency(group, "wpilibOldCommands", dependencies=["wpiutil-cpp", "wpiutil-java", "wpimath-cpp", "wpimath-java", "cscore-cpp", "cscore-java", "ntcore-cpp", "ntcore-java", "hal-cpp", "hal-java", "cameraserver-java", "opencv-cpp", "wpilibj-java"])

    _halsim_dependency(group, "halsim_ds_socket", dependencies=["hal-cpp", "wpiutil-cpp"])
    _halsim_dependency(group, "halsim_gui", dependencies=["hal-cpp", "wpiutil-cpp", "ntcore-cpp"])
    _halsim_dependency(group, "halsim_ws_client", dependencies=["hal-cpp", "wpiutil-cpp"])
    _halsim_dependency(group, "halsim_ws_server", dependencies=["hal-cpp", "wpiutil-cpp"])

    _executable_tool(group, "Glass")
    _java_tool(group, "SmartDashboard", main_class="edu.wpi.first.smartdashboard.SmartDashboard")
    _java_tool(group, "PathWeaver", main_class="edu.wpi.first.pathweaver.Main")
    _java_tool(group, "RobotBuilder", main_class="robotbuilder.RobotBuilder", native_platforms=[""])
    _java_tool(group, "shuffleboard", main_class="edu.wpi.first.shuffleboard.app.Main", group_id="edu.wpi.first.shuffleboard")
    _java_tool(group, "OutlineViewer", main_class="edu.wpi.first.tools.outlineviewer.Main")
    # _executable_tool(group, "SysId")

    return group


    
if __name__ == "__main__":
    get_allwpilib_dependencies()