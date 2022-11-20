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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-headers.zip",
        sha256 = "39ef1ad694fa06c1420dd2bb689f9767bb7d9df95d38f619dfd32f33bc7e4a54",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-linuxathena.zip",
        sha256 = "843684ac513badedf43d28d8e8d72a0480111d39a4f29738e001f705ecf47bda",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "6c61bdae241c8fcba54b23af24ce08ee2840b42efc566ac9cbaf8b369805576c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "bb3bd59f499dd64b46b87410a42f44857a5b424cffc804b6f852166c2fbb109f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "5b3f1c60624082ee21380dbe27f322a7cde93a181c10595ac87af23d00a65ef0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "468b15499bc014a0d5dfcbcefa556b2e6ad30e73bf42c7ac8b9d67c742f48209",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "fb2dd8b0f51a28cddbf55faac9afebdd530bd47cd6f0efcec34b6ca5a51d72ef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "abe40cc8c3597f412650beec7f616ad23d26b36e2932f3ee8c0c4ebeefbf3431",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.2/wpiutil-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "de01c2a45bafc66c8d8b59738c8da47813c7ec0fd47ef7456cc9e44ab20b1f48",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-headers.zip",
        sha256 = "33c3ada9a9a144552c5a7d5803619867cdc7bd1dce03bcc2b45748f322ce0d41",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-linuxathena.zip",
        sha256 = "8bca119e2737402b51b467f922e8a16af9823b9cd6efc0855f260172c16c186e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "9484f9f7f50c6a58b222b08683a4bc12ef30a07e45903871b42d0c794612a07f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "4c759d76c51ddeee8b0adb6fd73e0bcc4ad0a1aeed52fee03be87bb4ee2d4366",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "e03adca48331881419a5c55784cebd12a56c52c451e749d673a342dd76c70f8d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "3aa899c14f30952312dcee170f20545507312c3e513097f232f647937e34ccba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "dd4377911b1293870e4231f130a529524f346262662ee50409eb5d1bed5b0a40",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "3c109178434d505dd472204a03acc14d9acad62117e8bbac74ea3628b088aec5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.2/wpimath-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "6548cde8eb5e06eafbb842fe1dc955542eb075dbcac11e95c6dcbdcde9eca0dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-headers.zip",
        sha256 = "da72a7410e70e4c3fc562020a37256b1a213b27f5defba82e659799c6bba61d5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-linuxathena.zip",
        sha256 = "af797537b1d78a22babd0c0dd46d08b5b1ea6778463f72a317fbf7f48fd96f17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "e7adad8b55470eace3cd980bd27d2c24732afc71eca7f03ebcfbe7f95dc31632",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "03786e0363d7be0e984a37c904202a44f6d524a10960250a9dccce591afc1dd6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "0cf4ef61f04b175cdbb2e948f751fd8a105148f954e83f1cf63275bfd4796715",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "c5949eb494102532e84d7bc1adaf6e04c3e5a01caf00ca6ea5f06f004f50551f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "3c1c947d12e70707adbd62bd389ceecfbd8702ef1a6c473b56aab0f6f0fcede4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "63fd1f5e66516409c83bec08118802593ac911ffce46819ea02d40beed5fedb6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.2/hal-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "f8239ecaebb55199391f658d9bc859cba485ecebbb2495ecbe5538c3f34ecd1d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-headers.zip",
        sha256 = "ac2dafa2de8d9f60abcdfb03302e256eba25c1f7a89ed44126daec54d4b7c14c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-linuxathena.zip",
        sha256 = "3a938df44569760636e1733eab3894dc0890541a7e47bde09d972acc43a94405",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "01bd4bba214cc6e3e804a7aec7ffea1bb181f64dc4b8baa224e8a09185ea7250",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "4f343f834e410babc4355627a845f84363003e95f648b32caee5a786cc228b51",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "9166c44ca722bf5e765252c1c82185c2933457ec0bdc1e92fa207e5dde38ec17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "4443bfd79ab7c5f48d01ec00d053c157a8cebb049d56cf155c9a2271a1e72716",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "aa4506090e1873760c0fa525e352ed7d8febc87dd62596fb216df6ccb685b5e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "de183de99cd1911cfd90ab673fc84e2561f40354e6581deb8018329d1ad27523",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.2/ntcore-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "248943db47f425a6beb97584d35aab0ada0677d3a8f662b443a810c333359684",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-headers.zip",
        sha256 = "5d4d2464989dd7a41cd3bad1d9676e74a33046ccb0b427ba32cb28b9a0e2dc37",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-linuxathena.zip",
        sha256 = "09d3a2fa081af8499f65c0db000a96c303bac03e1cfd83dcffe7803850e948a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "76e58af2e5771871dfcd621fc0f0ee20221193ad659977e65116f460ed962490",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "58d935b008b89a2c4ded0f9ebd0ef21c48d888917d64298d92d636435e523f5a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "367519cbcdcffbff38e4c63788419c74fb29fb65d2e59d6fc15d858f130caa9e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "387fc0b48b8c8077901b466e1d8425b33613aca3d42ae387bc7a98b2afaee8c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "0ee62128a2aa1450403cfc1e6a201d5c9c2feb9e8171439e6e2151d79ec2ff2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "24739f624256817e09bb2ae4245e4d94bbad4dd05fbda618511b0c89a8f836bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.2/cscore-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "9385f4b1c110dd281ad2ff516331c975fbcf75598a082665f8d32db79cf5cc3e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-headers.zip",
        sha256 = "a8c79adc3f81db0c7cbcfc6fd1e18502081d486f65c42c2bbe0fadd73ff7b9f8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-linuxathena.zip",
        sha256 = "17275e6c36927befc6aafe79166cf47c67173503d5cead9a7e3410d9459bff7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "f5a4cb0148ecb11aeaff5abe0884ea77b419142940e1ef1b08b13ea370f3527f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "5d065d7de4088ac14efbc6b0721b49ee74e77f662ef2d4b56cd7a924448a6620",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "8f2f324f22be19e4d96aae2288f86071938201ebc7ccad37b3f7be384dbaed21",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "11d070f66694931eceb28594c77b2e17ca586760e09532f9e7700edfc244df12",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "6f70f3087493da9ff952a1c1529f852f8c14eaecdb907531d24686369b0ee668",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "a385fa20547e5fe797e416e53828e93cb1ba62ac9748bd55ee507584c217a018",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.2/cameraserver-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "8c4fb200d0c0b4d47b970348de1388f6f43e506c2b83d62ff6ddb3e9906caaee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-headers.zip",
        sha256 = "1461e86103fa7c85da930420a37ef8a51865c7da6437a865da6f6d5f73f119d6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-linuxathena.zip",
        sha256 = "eaca33e5d0487d5f3b247a895e09b34ae56c3bcf7076bc357c38bdc65f49c96c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "6f51050585fbf25032aee66d038fdc66c52c55e4a79677c3216eabd5633d5dd5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "5a6be4d946254c2ea0a7a85ede62b00c87ad88ee5b9cc040364e7f6bcceda264",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "6f752a86477b24e74eaebd4957f60ebd1fddd9d2a3771374d94bdc5626855a17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "27b4d61ec6b37d957ea908a30e5a4005dba952b742e536a60c68622fdee9fbef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "9bfe4a0f4f7fde37fcb7fd8c32a20282b5571511b51145c753e687436f39d127",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "07895719308da1cd8381dea3aae56a1820c326aa469ecb049112bf4ec2aae012",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.2/wpilibc-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "6c7c96bf583068d63205d55fb6fed2d39e955676533b7b50d5a4a0e04270a04b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-headers.zip",
        sha256 = "bc5a053a744c12f159d439e3240e28b592b1202420527267a70c462f1053e4dd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-linuxathena.zip",
        sha256 = "2289a41ef335835c9089924fc6245bcb74d76c3e680b9b1d6476933b4b6e0e30",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "99f9ec82d7d27c3895059be14b9af2253744a65769b8193a1dff4bc4c843a2e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "2d6f55fc9755200c36730a84918ba351fb71f9a8a635aa99dfcf7763dc30ce74",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "b63f8a9dd75c24fd666bd40e3eee222ea7eea91c4f98e708bdfa8d490bb1c7b2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "71eefd477eaf905b9d88d1543a7a58c450ef325ef25b4caeb766d55da01f66f1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "6fdad6243ec4e5963c8e462202fd1184371219efc3f28714da1a48cdc69c695c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "48c24878608c9bca7382d204c9e22afe7d6246530e8f33ce7ed5abac03969026",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.2/wpilibNewCommands-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "f771f01cdfd083002bf37c08d3c02425efbc8f7cd8e5c9967c42a3326064be05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-headers.zip",
        sha256 = "597f34852baa6a5263f060bc77f1a2927fc8fd93da47a692a402ed6472d1332f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-linuxathena.zip",
        sha256 = "ec428e3da62a2c01cd186bdbd979a3caec1a9baa9b56ebf070d3c135c6d4ecdb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-linuxathenastatic.zip",
        sha256 = "feb6aeb912ed43ff01e1834262962a6bdf03ae710faf07e2f2c0ebf82b0a413b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-windowsx86-64.zip",
        sha256 = "6eb28f234068d78c890db991c7b99c6a7112e6107087a4e1d92bd74ee1dcfb0e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-linuxx86-64.zip",
        sha256 = "5e6983b7763fb4f8dc30aaaffa91ecf6c2b6aa01824bc3071a1e1ea39352223e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-osxx86-64.zip",
        sha256 = "619067c695aef95446f211c67b5e86ef9e7ac04907d97e8189b646be7a384317",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-windowsx86-64static.zip",
        sha256 = "d686fd052174fa11012c7b3d3d4c693c3b4d50223bef838aea39197ac3590fbf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-linuxx86-64static.zip",
        sha256 = "f6e9995625b64b3f8a2f2de83e63c3a99da00c3f3a7b5ec49064bff68601c518",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.2/wpilibOldCommands-cpp-2021.1.2-osxx86-64static.zip",
        sha256 = "03c24a1f34ace35286f57a653592c5199a5f8b6523a9b03f8397a33c38567bec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.1.2/halsim_ds_socket-2021.1.2-windowsx86-64.zip",
        sha256 = "b347242caafcb8b6953c81bcd4ef0c714fe4db7edea427741728e61c7bad5efa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.1.2/halsim_ds_socket-2021.1.2-linuxx86-64.zip",
        sha256 = "abd93f21e41c637b1cc8f469d897e4a5400389cc7e19815549f567352e8ad5ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.1.2/halsim_ds_socket-2021.1.2-osxx86-64.zip",
        sha256 = "2b4750383b84d82c4d28880ee4884f86902e0d912ffb7b8c6de1ac9e4ed045fd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.1.2/halsim_gui-2021.1.2-windowsx86-64.zip",
        sha256 = "723edcfe2bf0eaf8cc28e800a00c31ca35365a877256c6e4aebe3f9a00cddece",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.1.2/halsim_gui-2021.1.2-linuxx86-64.zip",
        sha256 = "d0376319d05f0efb0561e5f34d9939646ab6c83bf2b848dff9b98423cae95d52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.1.2/halsim_gui-2021.1.2-osxx86-64.zip",
        sha256 = "df9633b5ba593b07fab943fa8de60cd17be75117600c64e4810a2d93cebcdf2a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.1.2/halsim_ws_client-2021.1.2-windowsx86-64.zip",
        sha256 = "07d6e0ad24d258d95b1a1da2de563c6385f754b31f37da9531c6cd64632f115d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.1.2/halsim_ws_client-2021.1.2-linuxx86-64.zip",
        sha256 = "8799dc5d64d23b74650ec4d54136b5a5dc3803d8c5a65ce5340c9021f035b201",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.1.2/halsim_ws_client-2021.1.2-osxx86-64.zip",
        sha256 = "263bfc2f1facd2c3897495df8fc8845b7c8ada04f352b0a314ab28d1676c606e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.1.2/halsim_ws_server-2021.1.2-windowsx86-64.zip",
        sha256 = "710daec11bd9162ef757e18d3d5b35dda3d775a569cfb8a6097d477fa5479b37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.1.2/halsim_ws_server-2021.1.2-linuxx86-64.zip",
        sha256 = "2f5a3c222362196bc44dbfb7e424440fb70853df5806922eda8db511b239be65",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.1.2/halsim_ws_server-2021.1.2-osxx86-64.zip",
        sha256 = "68ae3daa2b586ccb918ea2b0599d30c875279361a64c5c6af76c1adff0317fab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.1.2/SmartDashboard-2021.1.2-linux64.jar",
        sha256 = "4d98dcc1a5eb8c67cf8f0929df280c66110fdda2abfd0d92b80d8dba7602d428",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.1.2/SmartDashboard-2021.1.2-mac64.jar",
        sha256 = "e4a491b9cb7933b6458bccd11a290ce094c75c4ef7a7b8ef42d1891d2367be85",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.1.2/SmartDashboard-2021.1.2-win64.jar",
        sha256 = "4cfe67a41548a788ee04b8391a7c9c9d5eb8f3407e97ee849b5cf1d06b34c88d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.1.2/PathWeaver-2021.1.2-linux64.jar",
        sha256 = "14c71ef3d56bab2a0d46e8e2cdcc25a5309f85055cd93de6d656bd682e14db16",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.1.2/PathWeaver-2021.1.2-mac64.jar",
        sha256 = "7f89e2bb2167571d193bd08f579a6aa7b3a3d405c22eee6bb7ad55df2684f45e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.1.2/PathWeaver-2021.1.2-win64.jar",
        sha256 = "cc57d87382ea71d1cd1dba58a94cae6efb53877fdf6c09fbb69f399251b90fc7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2021.1.2/RobotBuilder-2021.1.2.jar",
        sha256 = "07d321d0ebcc7dea70dcbc90403aba3d993b03426295d7807306d2c5e062613d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.1.2/shuffleboard-2021.1.2-linux64.jar",
        sha256 = "0a2b58149ed0385372d3d4a199fbefae9469ed651c414fde27dbaacb08b64a27",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.1.2/shuffleboard-2021.1.2-mac64.jar",
        sha256 = "6c6b1ad1d5ed69c6eda5675d8254f251a953d4c2270759615ddd5421a04ec4c7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.1.2/shuffleboard-2021.1.2-win64.jar",
        sha256 = "3f6332e8f605b30494f5e301e790e79a5214e7c804b5a7e1f1ebc89e4e31f144",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.1.2/OutlineViewer-2021.1.2-linux64.jar",
        sha256 = "a3432f582656e7ddb8dd863f6b784378089d0b622f20fdd5d0e5e299939935eb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.1.2/OutlineViewer-2021.1.2-mac64.jar",
        sha256 = "e4e81ea110d5e2c8678cac6127936372f0335523eb02b8891704e4c701d9863a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.1.2/OutlineViewer-2021.1.2-win64.jar",
        sha256 = "4f55e7848b41de4d2088e63dcac158c7670f8a217af5f5e7b6e70e599697fd61",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.1.2/Glass-2021.1.2-windowsx86-64.zip",
        sha256 = "7968561b6ac19cae613d150b9be0fb25e1e0caa2dc4085c2010445aab105078b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.1.2/Glass-2021.1.2-linuxx86-64.zip",
        sha256 = "58734b43e6c424f305ac0e361fc470512a045f5f78fe674c08836fe3e58b2266",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.1.2/Glass-2021.1.2-osxx86-64.zip",
        sha256 = "6c4255fa053e59d23534754c8fb2efbee9a84738c9776b5a5724909d45853533",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

setup_allwpilib_dependencies = module_extension(
    __setup_allwpilib_dependencies,
)
