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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-headers.zip",
        sha256 = "70ba4e5b1c7383b48f1570c9b6772eb56bfe5040120c25698092773372fd9ef8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-linuxathena.zip",
        sha256 = "afdcf22b2da5d219a1d2cab2a07e07fa5a44f4e1e3530822b35fe0c05ae6250f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "0fe411e00eb998eb000eac2e0a0b8b4b65ab9c605332b81df6e873795e125231",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "4184760a2776b0bd1ac216a4c9fa7529d7a733734fc0459ef9df33ccc8a235f9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "86b24373178915a064277e6b7e6b5682bd70a0ba7119c7fbde9a71ff03c92ffd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "3caef2e256fcad4532077e425f856dc78b7a392379e87eab42cfb26d4ebe896e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "27d4a059822a5ebaf674e378ba33cbfec7670025d6d9ea027abfb100859ccd40",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "338533c14c010b5e2e7c4eb85ad829bd3022f6820a61bfefb12535504de6e024",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.2.1/wpiutil-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "e53624f12b3ec3b14aae176317e37abb876b4c6debf6807364d8c81e30590f1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-headers.zip",
        sha256 = "e582a6c312fa2491f72922d04d9f9fb04b7e778b8d6703f22e5cc5d25da05d73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-linuxathena.zip",
        sha256 = "1b085af9ba2d4fba03c7c661b9489e4f110875a521d7a1f0a6f13b2e4e9843d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "7f1b873d7f68aec578e448272e99133755e6bebe1ae91807def972ad3ab294ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "c114ebf65a03604fbb9421fb952c7bd78e1f89fbe88e30053f58c8da68d09e14",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "5b819c74457483e4dd10126f4c19f42bd923cb4f2e0fe056b3d7845507e4632b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "9eb12b0be3745a838f28af9f80a538de3539e9c8d73c534425aa8d2d84f937e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "ff473d724b4530dd1ef2c1cc9674e10381d62ba850b2edd6477ea0a7e46cac6a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "49be665dc4abd345f6e666c6a1e253ac3a110ce0b98e9112713a22df2ee99fda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.2.1/wpimath-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "4d81d8c5d1a0e7ca87c0f1ac93b14cc2f645904cf3bf0cd372670e2b2040ba0c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-headers.zip",
        sha256 = "46339e8902c140992c65fc8fea69c2f6cfd66130d77f59a25bee8b4eb6ab5313",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-linuxathena.zip",
        sha256 = "cfdc2b2f0640b434aaed0ce4a589e6edeb9bba8743c5e7907550b2c6f9fef61c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "395201e36ee1bb85a57eb4ffc1af2a2cb57d6e1318b86c941746779c1863bbb0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "8bfd787e2929a45aa20ee3e30984ab3881178435fa48522247d9c634899e8995",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "a08f97bbf4d29d8df375451f8e63ef3c6e2e44be1e61183ba50e65ae16f5d72e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "ca0b01e9055cfb4caf346f3f3e732b78bcd241312f9873379dc9e928aeb6befd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "d80c57bd328aa614e75468130ed2e45c29afccda0f96de7c332176aedb10c744",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "1c845db934491d4694e0cbc9197a19b56301c2f7221854cffac2dac57466fb41",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.2.1/hal-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "61144bccca2797e24018983a9819fff4603ee7ca36d4684e05c8ab84a579d2db",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-headers.zip",
        sha256 = "e610612c7092fc0e1b2021014a5517b90c274a2eeaed3c578b046875c432eaa2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-linuxathena.zip",
        sha256 = "65f2d300d657d10656e2714d38552e351a27637b0ce981189d60b003effab84b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "9444a0ce5887662567d30d967861377674c36b35193e091799165cef2e0dfc88",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "3dbf9db344455ea990cf1632b295063d3f3b69cd3ba901adc05d8f26eacc753a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "8fc51fa7c6eb6e157b49038608bb50ad61447b0c358c0f2204c0581919593e98",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "cc0c87c152dccbb1901238e011ba711005f0741ef72d3362e5ce39acab8079a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "d573cf21bb79b293077c9ca98c97786a147c61fb160cee3dbdfe0fa3a2c28e44",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "f9fbef0b23e7a8757f33e8465c3da0ad22c7f58c449f528d1d08a4f0a59829c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.2.1/ntcore-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "b56dc7fa68bf61b62731191fb6fbf0eabc63169d9003a58fdcd0387145f27b15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-headers.zip",
        sha256 = "5075b4cc8d70deff682a1f86d96d5294840a1d1c094c8a99f12060bbed2deeb9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-linuxathena.zip",
        sha256 = "1379ada464aead6267b69734d56a1bfdd18a7a549509653bc74a444611e15b43",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "8f333dbefaf1cb38278ec036424ef75dc351f40dbb2602582d5725e548542327",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "fb7b6c0edde29152dbb8c8f6ecee8aa5e356f8a7618f8492ac5331da4f5601d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "b730fc3f230176860edc6813b646fdffebdc2376bac45a99e6296d065fe71843",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "c987483e299739c8ca5f1ed6cbcd0a688f3e429574767a40698d6bc953bc4afb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "6e02b870bf2d563c8f53e596bcf7b936408cb1b3d494b9c525b81c11d9f8cfb5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "9bcacaa16d513e55ca71bf6549f721f97e6ed8a43228f745a6640f9221879eb2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.2.1/cscore-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "0a8fd1aa8b03398761cde5ce6ca00d9f1f852cdfd53ae62089f4de7a745e6f92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-headers.zip",
        sha256 = "5f825826c7be4f42c8642a0a847d778e88ff118da83507fa624f7ecb5993a310",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-linuxathena.zip",
        sha256 = "1bcc059a4a8d53781fd8a4f7ac79e69030c9bafceea85f07f512d8af4e333a55",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "6511ed7c0d6eb3460859436c526d80e8e3886d1c86bfa4cab205e86775a9582a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "0b5265408358ecffee643c023311ec944863ac0fbb4a2746e97809376fb8364b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "b39bf7e7ff6dfea68e430dbc4318e5eaaa1db2f716aec76606897ac9f2ef6d7d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "7bc26c9fbc67b12a49544d1999e31bed020c719a04280b5c9e4f887e4f6f1241",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "a8f696fea9f35efe1e5f30d1acc68d45482d40ce6299ca56a68dbd9f57b3dcc2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "86864f5c65be74bb201a76cf6f95c0bbb5aac8d8be071ca9ee33a967e34aeef8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.2.1/cameraserver-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "4707966068873a60e8d898b4c684cce696a5189f393225fc5af98268df21ffd5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-headers.zip",
        sha256 = "606f6dea6923020ede0d4505e69c0e1009a92f89b05a7befce0da2554b908dd3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-linuxathena.zip",
        sha256 = "d309814c652f80d722c54311670aa9fa52fa0dce0043c8916f100a09b44486d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "d6d27aa52e24c2ab46b8078ad53691e4d97b6a1fd409b0c65c5110df837e2850",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "f165aa536aa81d2c572bdc0b083838e1aa668e22beb6e8d556e7872db7092860",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "a361fa41a0274f00ccaa75676a32045b4c4ffa35dfb4a4802dff56e9f1996a3d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "a102a0a1eab1c301a9a261c093b9d19f3de1e1b7b8ffb414278484057fe7668d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "2657485733d4075aa92e1195782c9b8c48da9d26c943b6f9e5bcf0d61cf692e2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "26a295d93b3c539fd590196d2b529bf87f4bac9b5f5eecaf7e32d0d0fde1fb10",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.2.1/wpilibc-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "d41dc3c2b690ea1f550309ae716a13377e07050515f69e610a176174830efc2d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-headers.zip",
        sha256 = "58ff03859fafdf6221bfc52cdcb7e12ae9cb766637bea9de71857979319ddd5d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-linuxathena.zip",
        sha256 = "196d9926023be564dd492097d762a5f443fbf05ccb0c857eed448556ae664ece",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "b9c14eceed546ab61d538fbb615a635bbc07889df7ad13f2899687481b32854d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "1e9608339f731b41a4b20de2fd1528978e2786baa6ce572103c3826ddbda8040",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "bc5ab6ed10d75f2f1af4246a2b866c76a998d4fff092cc5b5b229422812b1353",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "3e8a92af6271eb75a048fc48ca4a7fa4f5830d8effb82ebc2b25d365a7d34d18",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "bf28bfe6e942f0b38a13bc46a8eb83b1c459ad3245bb3e3fc0805978ec9746d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "e41d529cd45bcd330ebe35e9f045df93cf40a502a75323bf5e90c71efad84d5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.2.1/wpilibNewCommands-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "b5f605f2df1729a6a9b26ccf42ce7ebca3daaaee712a930b7f51cd995cb503d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-headers.zip",
        sha256 = "600243016e5353ba95ca047357b906f23a25d6bf3431c5b9c369de795f1fdbe8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-linuxathena.zip",
        sha256 = "19f06328012271a42eda12a1d4b217967f3560777e454f3e6d9e1106aff3e572",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-linuxathenastatic.zip",
        sha256 = "5f6eea14a97079f42cbf590d85bb7a0d23c976581093fe923ec558cc2f3e1f9c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-windowsx86-64.zip",
        sha256 = "6f1b2ab41cd716e633d41178444fbd1ac85ffa3ba0a49129591e5950a5d103e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-linuxx86-64.zip",
        sha256 = "1306d32ac2f80c612966a77e9b3afaf864e299a19a5237a0b1f3b4331b142790",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-osxx86-64.zip",
        sha256 = "f5e00ab980f8de8f72fa2d5c4312a76d2faf37a5183db4c02beaa74859dfff3b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-windowsx86-64static.zip",
        sha256 = "3cabdc5868f0fd27f22de0924581ae6e4a54c859d04b486966634a621fa5d55e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-linuxx86-64static.zip",
        sha256 = "01f9c4094ac955faf920abc676d97d59c73460543c5b64856f59c8bde602b191",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.2.1/wpilibOldCommands-cpp-2021.2.1-osxx86-64static.zip",
        sha256 = "d26cff30c23eee221d2cadc4b4482e0b8fa59a9281b7d515810466bbd884b5cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.2.1/halsim_ds_socket-2021.2.1-windowsx86-64.zip",
        sha256 = "6e6af45ad0cd977d5a0b5c128529c3b781b28e0bbb4004b7c9caca8728a5868e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.2.1/halsim_ds_socket-2021.2.1-linuxx86-64.zip",
        sha256 = "523c6ce4cf2ce4f7cdbee0080545b5a87ca3aed3edbb9377d8c73a7e4171769c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.2.1/halsim_ds_socket-2021.2.1-osxx86-64.zip",
        sha256 = "d222153d2c5dd17b4fce20232bbd53a4a6420b65a9d0a6a86cb6c4ff38335b35",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.2.1/halsim_gui-2021.2.1-windowsx86-64.zip",
        sha256 = "65c4ac7259046e87c13eb50b9c07efcbe88d909baf62e2923368fabdaa69a0f7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.2.1/halsim_gui-2021.2.1-linuxx86-64.zip",
        sha256 = "be688b428e75ae1e235409e3c0549122b9f5e6601c7ff89a026e4aa7063a320e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.2.1/halsim_gui-2021.2.1-osxx86-64.zip",
        sha256 = "ed4c594b550bdd5b03352cd1babab470829f8f0b617069869afa4cf9e487a855",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.2.1/halsim_ws_client-2021.2.1-windowsx86-64.zip",
        sha256 = "aa58ba0fafd1e6097f67ee43f696bec0d2970c2b116689e7b14fdf5fe1ce807e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.2.1/halsim_ws_client-2021.2.1-linuxx86-64.zip",
        sha256 = "f5c0117766a463ef3b75a92664507d62ece21cec8b0036ef6e7010c4524931ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.2.1/halsim_ws_client-2021.2.1-osxx86-64.zip",
        sha256 = "aaf941711e31f680065af58e1f5117e2e7b268f24cd9b2886e3d2d791f6881d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.2.1/halsim_ws_server-2021.2.1-windowsx86-64.zip",
        sha256 = "d3b49836175e18b700fc3921d745df7e7834f6d48661dfbec2228464e9fb0ba1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.2.1/halsim_ws_server-2021.2.1-linuxx86-64.zip",
        sha256 = "cd4a2d093cf95850b4749d431409510083f414bc7411266f8b475f99c8f48e7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.2.1/halsim_ws_server-2021.2.1-osxx86-64.zip",
        sha256 = "b44166e172f31d0a5eb3bcb50f8288a14a16efb8fc05c3e8bd185c668c8cbb88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.2.1/SmartDashboard-2021.2.1-linux64.jar",
        sha256 = "5ff20240838ddc7923e6a0e00ccd7e4dd33b3ae050ee70edc096214fffdc1c6c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.2.1/SmartDashboard-2021.2.1-mac64.jar",
        sha256 = "77b5efdfcea232475ac26ea902da1c4cd30f1f63ce9f488f880ae71663d3e12c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.2.1/SmartDashboard-2021.2.1-win64.jar",
        sha256 = "c992edadfee8f8451cbd11df15be99a0b35928e1b96cc6d333d83ade37dbeba6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.2.1/PathWeaver-2021.2.1-linux64.jar",
        sha256 = "080c206bbac0627da43b5367959db1812c225dd90495dab503a5c4dfab52c948",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.2.1/PathWeaver-2021.2.1-mac64.jar",
        sha256 = "b5cdc4db0a6e3f39d8b8afec52bfe7ea8066af5776839768fb5a2a94e234e934",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.2.1/PathWeaver-2021.2.1-win64.jar",
        sha256 = "21e1dbc3f020f2da6a10a793ec6618582230dd0afc0f0771ea360bc1c9443945",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2021.2.1/RobotBuilder-2021.2.1.jar",
        sha256 = "4b19c3a75c4bec86dee74971356eb561c8a80cd8f852b25e75971ed5079cd76f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.2.1/shuffleboard-2021.2.1-linux64.jar",
        sha256 = "21b378c84042f2da8c9682e8f689755bc5049ff49de27dffc37cda0fe6bb61c8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.2.1/shuffleboard-2021.2.1-mac64.jar",
        sha256 = "475577e501c14f86b6fe99e4d43896ea72cddc5c92d54341c6d70aa3039595db",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.2.1/shuffleboard-2021.2.1-win64.jar",
        sha256 = "586424c413805d07393d213f258419443d31d98ddc1e9fa708128621c1961b64",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.2.1/OutlineViewer-2021.2.1-linux64.jar",
        sha256 = "c76f8c2cf77accd6871fb05c822f508a2cd09f861b0cc11d9fa7d569b72b92fd",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.2.1/OutlineViewer-2021.2.1-mac64.jar",
        sha256 = "36894fb6cd08164b28a77142649291a7f4f15be56ae2ab8a69c355464d3ec438",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.2.1/OutlineViewer-2021.2.1-win64.jar",
        sha256 = "cf8f63dc8536824942a9d264ab3dc3edc0d17bccb3a135936fc63e1524ef0183",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.2.1/Glass-2021.2.1-windowsx86-64.zip",
        sha256 = "434250b0d27dca2391e1720bfe288ef68e98b8b2996a4edf825e618f841dc6cb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.2.1/Glass-2021.2.1-linuxx86-64.zip",
        sha256 = "c6263eccef6db468b652c6c52230e89443264a5a9c041f18cd9d612ca3921b70",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.2.1/Glass-2021.2.1-osxx86-64.zip",
        sha256 = "7de25c976cb258256960aacca24b332c52f5f3385aa5df4fc7d4f6cf1eee91c4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

setup_allwpilib_dependencies = module_extension(
    __setup_allwpilib_dependencies,
)
