load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

cc_library(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
    deps = [
        ":static_libs",
    ]
)

cc_library(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_allwpilib_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "e6433808040c8691d1c602f19bf253beb7a06818f7437b5e5334b4c0b4bc0476",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "9783cb114f4c911f76a7f68611a635eaee04e5e5e434fd28c598a22ad8a6a966",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "dc8343fc13ca7cb5cb0cdd4bc0b6664b71315aed7fb58fcf127245970fb017bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "b6ad400c9ac76a96db26b87372f0057bf84d472a890164faa045b374b73673be",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "6fb4e8463d041663960093963abe6accb34479695be14eba8642937171d8858a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "9580f286615e5be94d194132e61271d12f52ef19e43ae8f5db61d486d3c1b76f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "fb39171fedcbca0727d85ebba2c18a19d99741b4c3108223b6408d27ab2f5245",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "1df661fc6b605a4db332931b8e615b6b153ab131800c0fdee74da7129cc8f8bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1-beta-3/wpiutil-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "bd9e92dcc53c0822ac0be48094ba5f73e23fc38b95f42c6baacd8b5c386cbd54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "22a0d46bd3d604de8e705748998e482fa675a4edf81f11ed2d2d676fe7c0d269",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "53bf1105fbd58d2a3135abf71a8a9608af2f7e69745b865ecbed6be451410989",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "6473c924511616343d8e7abbcb027430425cc39060e6db5d2003ee003787e4fa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "f28e61cc968974f00ddfe2e94605e2c7ebd64021e328c8dfad271114f2a305d1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "e8d26c984f3597512bf73eb6d86f056edff3f92f2f24f17bb3a008f42b62c99c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "e4b31aea6a6bccbe9297020fade45576b078d4f1273cbba963e5344324b98ca6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "d2a83ea2b21f7da562c16ab2e6982c7d68b1c3664d3e31d523b3c5174a49af5a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "3350c94b662c8afaf948c87312375c8621429eeff562c984f75c344b8b56e023",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1-beta-3/wpinet-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "6486ab3b9ac568a043ba4522b7bbb3e909a7e83121b166a7a9ffb299f0c796d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "3536c2d5f9b1c3b8cb8b4029dad6405e31bbf33ca5e2247b75e68b0a5c4f4016",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "3e92ca08d399aef060289155d06fa25e5cb4ccc8fe535c60fa5b06886b91ece1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "12d4772ea4c47bd7d3360f1e14911527136bbd0b8fbb3a9b8d8a83da77ebf6f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "f15b73965d64cc8c6f1e78db68d4310217d823294ec48e467fca5061a3797c80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "5d4da843136ecb1e0393bacb4eedec375403d2db6fa64a06afc0232b31dec1b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "7ea275c87f8e30f71843a0c6b84f06e26ca8581234e7497a93e2150742d8b681",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "8433a38cfe3bf1688c6c476b850099161496fd1d277e1c6f98ca119f8b75a728",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "19ee39cce5a6ba4b94e452b0063273b06ff340c07ba1bf8cc8a5cea0d612d417",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1-beta-3/wpimath-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "32c17e27b15629781b84b0bd497df279891d11bc3b5b294dfbb0f45c950e2087",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "342a5ab6224acc2c26136965696783836cb8e590560eb80c6380385e878b926a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "5290ad4ff84b12cb689b7b54c3ed79093d2d948a8bcac87ec286cc76a85628bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "e24d902a852dabc6372bd3073d296b0ba2363d241f9e50f3de270a06d723d764",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "1fbd94f1178d18a9bd8c2fce6fc85fd3a495dcfe076accdad752ede88c56c266",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "ca2212035b885c8da03ef844a4b2f6d3d0679dc3046fdd8e674452f5f4ed1c8b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "4ab1e1c1b347776ac73151a2461424d784b2f53a2e1bd533d5a8ed4d9afee41e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "008c6c6089e70ca9d60714fd1dbef91408a24e2c30aa25c3da4b820b29bf7ef9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "0f7386622a2aa1606c47adb27dc26438ccf761af972b48c5815b382f059bcdfb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1-beta-3/hal-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "6b574ed12e4e090c27fddde09b35475bb80cc338525704e7a784ec572f861caf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "555780ad6ad918fde8daf6466a37b7c81ae7d2028d6dcda6c883344eee7bd5d7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "cb5f1d498d432ec22f3386d5047157f4b6401160a511e8f1256151584a26ac11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "99970737f3264acabd19c895d53dd8e33bf82c5a506675a7766dc06b831280e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "f080f770de4e89f8a0674a896e20bf8122f1d601bd76c8f837a57259c6bc38c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "c869273b4d985613fa057a2d4414080728fab2d6b7f71e81a3a927a01d23a400",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "b052a9ac5122b82457ad0d34be1fbc5c0f392c077af47e094c1e1732131b536f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "aef2ac739d15a05a960b53334c9ade2dba16d52cd2f121ca25757a10e23067c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "5d112ed6cc10ba2fac226cd613298771ee90907c5ec64e5f9983b161a51a6f6d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1-beta-3/ntcore-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "2fb02ea989629626d302283a7af2fdd9f822d00de5549292d884faadb27a2093",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "740c51dfcacdbfd3d040be65735d67efc6c5f662b58802d26bbf5f30fe8861a3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "0b84a2eb1f1f1bff79ca0a140baec82b0b57d10c896e0e66e98cc852915d6387",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "707f100900620e231e4431b1d05fb92c22aad9c6b70d31ddab21b15b10dc595e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "ae3b87cbc1811f3f1fdc47161e4b79993ac60b2729e7b32a4ae94b787fa98b5b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "2114d7b8fe30dee2204c582ed183cb311a0a8c16740390ba4726dcd8e4f626a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "21ac7e6a31bf78ce861f2c574a0bc07b53c5350c69480fdc73e20a4a9d2319d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "4028fcbb4e87c110c6f62e72a98b6aa0c64c28965085e7748ae0d679c1a31703",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "b6ebafbf038299630803d8e3378434924918d125e2785259b418354d954b7262",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1-beta-3/cscore-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "a84f827208c68d809be57786dfb84d4196a291c3be8f9c91020b80c4e7ee1093",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "3689d4fe410b9547d184e46bc978258a65add8c837f1bd68bb51502a104a25a8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "244ab341954caea4fe374a68120c2af4215392e450afe1740e5971f1bb87cebe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "85991256e552e5d42b7c4d458a76df0062886d79ad3db1e521741c62401aa45c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "f1d3e11840dde412acd32569f3616891718cf8765f5e538c1dfb9bb325c17144",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "78db547faf187169edc74ddc2c69dc9ddc42e59e1c652774e048afd0a6308e07",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "a69e0652f227e2a2e6a7d65479b110e80e761ccbbd6372429dae24dcad1fa18c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "a68b70c46e2d8a5dd581e9c88539323933438bdf6cbbc846ad93b5c967ca1b1b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "b3510e43a259f19cdf924071152e7a3dae1e5d09f24a0296424ba09c2154b130",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1-beta-3/cameraserver-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "238003204e7d0ce6687c315a3620556356ea699a60066d965ba788a39370b9ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "0d4ff0c1eb75010d6bf7fa1c0c11e19e2fdd4d1ffa82fb157715cc86ff20f3ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "700d4cddfe4c43bcbb013e67fd71dd16e16192875a65d05911b3a8d79c78636b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "87aef14a39b68daa764bb482acd6ef5904421be84cfbdf29f70c743bf272bca5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "1ce9930e0555c47432b3f58d9b8e57719e4d67234afe57db93f3aab1308ee280",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "aa272951be70dce9933bf97c3f87f57c4a2c05ae93937ccfe63a647bc2607b72",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "b43779256ee580975e2368d5e5ce7509b4cf0c9f0fbd232284b663090e8d4f1b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "6eb2881789c5a407a759c84b91ad9dad64f6b21419a6d574a752a9cc114f9de5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "914d23b7aae474f19009bdb236f1ba83ea77b6b8bbcac34184c49cb4ef345e89",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1-beta-3/wpilibc-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "40fd0b5e9c1df14372037fb9a76063408b4c2c3cb8ededd47d12944416d2a2b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-headers.zip",
        sha256 = "5a04fddf34545518f995a59a5641577b1d9dec7de6238edb4df14cec242be7ee",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-linuxathena.zip",
        sha256 = "6e6f1b6e44710a2bb8b23e13304b43b6fe409f35b30e9baebf73dc9c4c3adf3e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "04587fbb404043eab6cedc74bb8a4d622936fa42174651b6354ef0bae3f4c2a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "6a2f2e8306d61fbf62f6f7b5c51b1d1001e2b20f665a34cfd2eb844947186c0d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "f6a450c6c7d410ea4fbf85ecdc898a5033461d48820dbd3ece58c98ad635c1b3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "44bf83b3b50357cad0026729ffc52da2984044fb118f476bc7a4973af06c8dd2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "38162d9b818a3eadb1178df2bb8ac3f54f2ccc89c43723e30357746cc2f211cb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "13591ea07d2495ece9c633d8cf2331a156262332762d52a7bee06fadb346ded0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1-beta-3/wpilibNewCommands-cpp-2023.1.1-beta-3-osxx86-64static.zip",
        sha256 = "f0640661d4cdfd23766767dcaecf87d6acce01127f456eb7a844760e5fa8df7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1-beta-3/halsim_ds_socket-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "147075e20e8a8225b1c86c9e630407b55bf849dc3b8bdf6201eb76dd9b9f3c8d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1-beta-3/halsim_ds_socket-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "71b68047d0a30ea76ebf1c05dd62b03519f1534de63844168365154a9cea9d42",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1-beta-3/halsim_ds_socket-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "2a3fc7a260a5a5a6f7e5817f4c74b6c9335b380fe627da6381af51ef3b516cc4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1-beta-3/halsim_gui-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "962ec2ea2d1ac6e0d3a75c1ce9f8394db05c12eb79d41c9d74e6c6604e8d4a7a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1-beta-3/halsim_gui-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "842e4d1d10a6cc00d7e03c2803424767acb7ec7ae947f87cf4acd896b157db80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1-beta-3/halsim_gui-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "7495af405cb10b904363b8b5592f1c24f694a6ebc6777414320a7f7e83ef8e67",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1-beta-3/halsim_ws_client-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "9a282d2b11c2234b704a526a5e6de404c0a65d9c70cb01c75923bbf6d551ef3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1-beta-3/halsim_ws_client-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "89df6a4b6ac80d20497a4bce42ce52ff8e0469d93fbe7f9cf6c66dd482db4dcf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1-beta-3/halsim_ws_client-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "1aa8acc6299ea7617e84a3fd87a13a08c0e7a9faff51592a43413cd368901e37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1-beta-3/halsim_ws_server-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "d609e77e9e6bfa9104f6cf8247640163499df7af34ac754e80ef8f663e659575",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1-beta-3/halsim_ws_server-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "f934679bcf53d0a82f6c714539dc0ef88e8e14879eebbb8c27bc503e32bc1e26",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1-beta-3/halsim_ws_server-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "9a0ade924feff988160abcd3e04b6b59ea6de5a99819748e173183894247db72",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.1.1-beta-3/SmartDashboard-2023.1.1-beta-3-linuxx64.jar",
        sha256 = "7242a8fe5bad15bd16868548aef913d01e5d536c10f83a8843278238c91f8ea9",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.1.1-beta-3/SmartDashboard-2023.1.1-beta-3-macx64.jar",
        sha256 = "d02838f13422b00dbc13f69af349147e989de042a63a446f004634e3af339286",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.1.1-beta-3/SmartDashboard-2023.1.1-beta-3-winx64.jar",
        sha256 = "eb0d49f664853435b85800f1cb528ff6782d96fdc26c527d4fc0b460bfe86676",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1-beta-3/PathWeaver-2023.1.1-beta-3-linuxx64.jar",
        sha256 = "b8ebfb5ed206779cc7d3389bcdf5e3b432c2ba436cd6015bd977096320b4c6a7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1-beta-3/PathWeaver-2023.1.1-beta-3-macx64.jar",
        sha256 = "c1e264cf14baedc989d77e093b40dd33434d8f6293be4185dd89245cfab3b925",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1-beta-3/PathWeaver-2023.1.1-beta-3-winx64.jar",
        sha256 = "6a536ec53b8cc963eeef288abb987ae935e640847d7bd2fcd7af5b4dbf5a23d5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.1.1-beta-3/RobotBuilder-2023.1.1-beta-3.jar",
        sha256 = "53bc2fef1f1c06950fba00b5837da44474a64eb24152a34fc1fb9d5967e2b0ee",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1-beta-3/Shuffleboard-2023.1.1-beta-3-linuxx64.jar",
        sha256 = "2720ff19912f9b7d0b288bbbcd848a021562f9b9ba2170fe198a8ba735d28dfb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1-beta-3/Shuffleboard-2023.1.1-beta-3-macx64.jar",
        sha256 = "7a68ccf328180735727c6a119ec642d84748b91605635c645a3779f9457c66c4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1-beta-3/Shuffleboard-2023.1.1-beta-3-winx64.jar",
        sha256 = "820064a6c33af7e17c25a7da452ce0e6efd8a7d9b669eea9ee1ab9dba46cac89",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1-beta-3/Glass-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "b70aec5911de16b6c09acf402c27a87170112fa38cf20e69aca3e7f15e493e9f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1-beta-3/Glass-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "ef8efe632d3d316ac6b17e0a361977cba9b00cb3476ee8b6ae161bfbbeb6e413",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1-beta-3/Glass-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "fa7be47169f80f0bfc4362d3d27f307565be6fcc34b5b791c9e5d0e888a3c96d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1-beta-3/OutlineViewer-2023.1.1-beta-3-windowsx86-64.zip",
        sha256 = "d5ac92eb13dfb846ac27c1c3618af5cce8286707e494cddef2b555fbd3811cee",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1-beta-3/OutlineViewer-2023.1.1-beta-3-linuxx86-64.zip",
        sha256 = "e51bfd4d8182919dfe215cc47dbf49a382fcb07f67c84bea9a374eda3c31291e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1-beta-3/OutlineViewer-2023.1.1-beta-3-osxx86-64.zip",
        sha256 = "aae5cad60e5d7028359cfdef17fa865244a127ae9c4da2a34b6dc9f2b6dea01f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

setup_allwpilib_dependencies = module_extension(
    __setup_allwpilib_dependencies,
)
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
# "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
# "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
# "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
# "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
# "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
# "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
# "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
# "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
# "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
# "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
# "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
# "bazelrio_edu_wpi_first_tools_robotbuilder",
# "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
# "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
# "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
# "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
# "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
# "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
# "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
# "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
# "bazelrio_edu_wpi_first_tools_outlineviewer_osxx86-64",
