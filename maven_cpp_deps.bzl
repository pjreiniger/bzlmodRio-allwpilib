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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-headers.zip",
        sha256 = "55c26674c7e1bd6bec6d20d20500f90058b30d2bf327cf564afb97f83d00ceba",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-linuxathena.zip",
        sha256 = "932bacfb475939f72df80360b09cc8c1d35d91c43df1150dfaf51866808a3f97",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "f954220c4088f4401b05a72328b8e4273388fb72bf8af4512383335681c55587",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "07c17a1c38b2c4cdc2b68f817c1943462e5078ca5820cee2bb9bd96e7619b88d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "02e4748e763161c3ebfd21ed69ec7105e48ea71d3634761f73e55bc9bd4dab8a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "cabbd8cb118c291e8ae38556bedda15ccdfcecc67b21634420b8df4aa7e8d146",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "5f8afbcdbd97f564bc3cd95f656db68fd6462d227cb91663c7912b46284aa71b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "84b40bdde3a2ad8f9e90b1b16e113c43011e2726c409f8237326b8519aebe814",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2021.1.1/wpiutil-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "e9489c7f8025b012640d50b28ec4552fdc104339787b6fb066fa701b3b6a1bac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-headers.zip",
        sha256 = "477755f85209887dc7659a5e3eecebaeed95df6773b4db89275224a9beccaa2e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-linuxathena.zip",
        sha256 = "7317b42d85edf157dca177cd47ed03ed6d209c8d310f08b28134b02b4d7eb3ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "3a67b944188f2ae440229733f2e2bf1bb09b64222f32130f0c01f95f1b4335b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "0481a32fc082b2d756f619aac0160f8cf6c42606ff6c5ae885719c3197c93218",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "334523e5eb66380afd5e6ea672602a385ed656cb1cd6e2594765b0e51a4baf41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "0b7b69998fb3c6bfafb1402dbaffd50ab1168dc541e9880e72c53a5a8f57f218",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "632b2a95dc8c4513fb5b51c647c84194d31ce5dde1890c82b494859378a57cfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "fd4eb2c60dbf8cd9f43c7b72203739a0f6aee7d081a849d0db9f8e580a3e5f92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2021.1.1/wpimath-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "34cd05e7110acece81520c19caf8fbf7cb2779214476a5a8e91831515fbd348b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-headers.zip",
        sha256 = "792b2ba820be76352ffb9ba88021c8ad7e5c799936577ac38ba3183057f11e87",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-linuxathena.zip",
        sha256 = "e14482ffb83bef6e41763b02a7e5af40701cc4a3212ddecc9a2aa7b997fa72d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "5ef09be7a08511597707b6aeb3c866c348a63f8249727423037d39922ceafd26",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "d4e50932d5330630078020bbc6b52c2bfd03489f8cf8635ab06b18a836d846f9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "2a320f5ac13b66edfe81b0aeb9762cce2a26b55065272c971c2b12ed0fd350fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "4174388570b2d7dbc0d38e899f99dbd8f4c1df494b30720f34665994d997f304",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "ec80eaf82cd8c460647292204937882309df7830a38e76630398acf045526207",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "a9cd88b97ad3a7afa031c8d4c8737d1fa6d9234abf896515f3f85e9e9605520f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2021.1.1/hal-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "22b4f9a27daf9aed654d8948a1b55c67de196056cb80a4576d8b40b1fdd32d77",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-headers.zip",
        sha256 = "280a48453e9fcdc81cadfd351b30d072cd97bdd6956596a3cbe2343550880801",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-linuxathena.zip",
        sha256 = "c73eaaa9eb29861541ce1081f12004d6025da8b727019744879dc67bb9e16ca7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "0f366cf9f0af858c2eb0dfc067470b53007e895b7dd48af8d8d23bb1f64b26ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "65c441d63d911285531f07cf94fca49463efad2ac6d47e15452a5f5fdb7e251b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "486cf8f35607cbd11062001242c63366993c58d9d4625b7cdf4e0f3ab646bccb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "a95d68d27c30df045822f5005bda37452a67a1d08106d0c6dffc4b7069024a61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "a37e90ba75e69b2a6cbc02ea0a3c388a3181ab89c284fba3aa55345113aaf9e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "c368752b503b9636999576015d51229831b31bda7d5d957daf08b9bf0e6db373",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2021.1.1/ntcore-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "889ded6eb79028bf5e3e09ff1cb87fd60f7ee4cecfd46a42d865929f5bf6972a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-headers.zip",
        sha256 = "15faf770494c28fa401f8c4bad3fb636b82d0d9629c3db183506d9d153018bb6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-linuxathena.zip",
        sha256 = "3edd6df1a93dc6d3634abab778a12a44a325cf888412ab923d74b28140834e93",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "3603c22b82d8b9af8e12c6ebc2bade33329cb2a36c8e8a95748f58638a3bc42b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "64dce30b959ad2f16d871c8000b0178e37e2d974ed7fc9648221b4b555a70ad6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "9e1cf7d09041d3640b6b618c47a700903f9f1aa438f69ec34ae41b6dff3145b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "b2084252053cc1f69c65cf55dd64343b85833c60b25ca7bf81e54d496892f91b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "650441b41d9a033b410b7abd1ef3126fe7ac01842896f3c0d6b8f06e778d2c73",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "a54a5a785253d869b733e62538976027728997cd5a31173d9b4ab4e34e5a2d4f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2021.1.1/cscore-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "11ce3ebc6125e45597d2a07a622b7f76e5242b82708ffc4b875c0ec25c0459d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-headers.zip",
        sha256 = "050085c62ea41fd64caa244b5e52bc1c90b7bbb0750071107f6d891fceb6ff8c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-linuxathena.zip",
        sha256 = "c9ee01d3c5c9b23a57087875a380d768edce8bdb9e8c2e31024cacda689fb380",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "a1a19fc270c09c095388b8bd9920a155d77aa784a3fd501055fb14de086465fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "286b33a430984f728c219b91417a471a1ed9e83382e65f1f8a63de2eefacb47e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "f96355f1eb032726c6bdfa7abd00b3d3a97cd99b4603bb60753c4b6533fe93d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "5bae361433a5085f73397b6d05c8d9f2c1fa2d6265c7210258fa0ef0a5729568",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "19523cc9381fbe9c88b41cd30574dfa64191d73e157b96ae3488e315abbc0836",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "7ea6fb3749db7a98b8da3ecffacb6feaa6eea7584e82e64d654db7c3ff493d59",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2021.1.1/cameraserver-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "3992a9a37e362af57fc001e886661fdefafb8d936ac46a405e953dfeadd3a41e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-headers.zip",
        sha256 = "0abe5a6fa1b2dd4a1869eccd440e56a22e70eed30c347742515cfcbb869b73a9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-linuxathena.zip",
        sha256 = "9499e4a698a97e47125d1014e2d4053c81fb0898c13f8ed295f3bf3329eaa901",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "df3c536a726314a44e3992647cd31c8f3af400a771aeadbb2558da4892a8fda3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "56cba6d351d8a0f27ddb3117c2034a61fef09644e763478af8f7a1970261e23b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "10c444a55017b1034d6c17934e4d5818282329492737d7e566b8e0aac33b57a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "964468ce2eb1349e811c8aec8db0c4c50c0b6f9eee53a520c3050f72f1411968",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "3c7625b766cd01572756eb1895156b9ca04f4b8d8da384cd6839e4058b855e6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "84d55d178240ca0a3e92f2b029743931bde0faef328b3b9d7f5f96c807779e80",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2021.1.1/wpilibc-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "0c54eed65e03decb60f7ed9496c3987bf7db663f05f647960d0afc63a52a4e5b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-headers.zip",
        sha256 = "161b10654b09b5ff4c527f69738d201ab7b67a5a2caf4e6c39c3b704e6a8c0e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-linuxathena.zip",
        sha256 = "93d57cefb956e787199a2a4f426cc4c5ba2555bb749314c78962464f333c1530",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "2f67fd70577b23660a9b033fa393e1c0fd1664c6a46011bd60bf4615cb419e84",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "1c61b72e0f56264f1e443505ca5a1df7ad632325e8b27986815b6f2fa36f0525",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "8bd18ad96190c2e9afeb0fc75ef291506d7fa05c9650ea200936c31b45846e2f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "82a78819dbd9bdf1eeb54e89f686c64300acb3690c30b251bcdca9b37a3e4cca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "c4a20ad1b18e13dcc96708515713527386c738684a513cba2c106216f3b3c85d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "b855324c5fcc0f6f030abfb460ff6c4d9056ea2f07f6c81a0705b2205abf4a0e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2021.1.1/wpilibNewCommands-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "2ddb2c2da572c6855699daa72ac77da955dbe0bf70f912f4d5a79029d4118644",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-headers.zip",
        sha256 = "7f3a3ac05cecb0552cbb2dcab06f3123d3a1bec14d1dc012f10e8b54b7174f9a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-linuxathena.zip",
        sha256 = "918553444648b6549127b7bf60bf73f77b2225c866a789b6d67d2728f3e87986",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-linuxathenastatic.zip",
        sha256 = "5079748d50fd4042cf9eac65782dc7301a3498695d80c656d6656781731f9440",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-windowsx86-64.zip",
        sha256 = "931122aad8afb52d212b63cebe0ceb1254ad2d1f1ba2d3ad849e598f11f0d446",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-linuxx86-64.zip",
        sha256 = "2c24cca1974431a270e366711fe2ec64d19145c3321ae1bc42afced587cabd7c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-osxx86-64.zip",
        sha256 = "c29ebad7f17f481792116e7893f25bf371293609adb6dbb79e4efb37c46e0fb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-windowsx86-64static.zip",
        sha256 = "eb1736797aa92d5621acf9ce18d2937ea87f9dbf2f2bd2c3985b839e92f9ab77",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-linuxx86-64static.zip",
        sha256 = "247da99225bdbd9c5c3ee1cf57d197890f5e0eb247861803aa4d9b6c3c6d7c2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2021.1.1/wpilibOldCommands-cpp-2021.1.1-osxx86-64static.zip",
        sha256 = "4f4f0e0c2b9aa5be430eb85d0518c1cd20e7e65409ce98463016136980246caf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.1.1/halsim_ds_socket-2021.1.1-windowsx86-64.zip",
        sha256 = "4457f386a5d1bba1f4cb22eb6b8b5e27286eaa6d1123e78c36dd8ed1603766b2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.1.1/halsim_ds_socket-2021.1.1-linuxx86-64.zip",
        sha256 = "eec596b0b40b8f485b3b1d562947a01be03916ba7fc6c7a164137e52fe3eeea5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2021.1.1/halsim_ds_socket-2021.1.1-osxx86-64.zip",
        sha256 = "2552ba50f163a6b072562d223fbab6dae8b5892326981d20abafdc9c7648a478",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.1.1/halsim_gui-2021.1.1-windowsx86-64.zip",
        sha256 = "63f5e332a46b6c9b3edb1ed7691ca78ce222954a105c836b7f8bce8bb8f7015b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.1.1/halsim_gui-2021.1.1-linuxx86-64.zip",
        sha256 = "46924f428f51afa5c62f60b4fda6857c370840af076b78e0fa7231e90ec1ab02",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2021.1.1/halsim_gui-2021.1.1-osxx86-64.zip",
        sha256 = "c12a5d3dbe9c2e3165444eb7ed521fafd4bcfc255b6a4914d3774207547a1b6f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.1.1/halsim_ws_client-2021.1.1-windowsx86-64.zip",
        sha256 = "a559cd9697b40a11e46748a8cb4cb0955fb6e8d9be725f52700c608952a6f574",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.1.1/halsim_ws_client-2021.1.1-linuxx86-64.zip",
        sha256 = "c4e12286e3f7620b5c3714faed9a3263223499ee0e4186c79d5ac8ca5e6035ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2021.1.1/halsim_ws_client-2021.1.1-osxx86-64.zip",
        sha256 = "f6c0eae746ded759fdc062ce3736748d617be230fd2494605cd7a715f8c3065f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.1.1/halsim_ws_server-2021.1.1-windowsx86-64.zip",
        sha256 = "e9f2d9209129ea9dc715fe1e06d6d0646629b0b9f464c04afc8168ed54a4ee9b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.1.1/halsim_ws_server-2021.1.1-linuxx86-64.zip",
        sha256 = "b9734e79fccf6336e426975059046e9e86336fae5b869c65483908435005dee5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2021.1.1/halsim_ws_server-2021.1.1-osxx86-64.zip",
        sha256 = "e72398d419a686643c2f782a45b3908a4ca95c4e7d8b4e59a4a1b8ffd523e822",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.1.1/SmartDashboard-2021.1.1-linux64.jar",
        sha256 = "423a678612d92614a846b5c55d0f65f0cb6b734241977cb4f2ddf3db28551acd",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.1.1/SmartDashboard-2021.1.1-mac64.jar",
        sha256 = "5d539d7fdd4a2b1f1354baa77f460fd6be163eedc9e0cbaa102b0761c844f9da",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2021.1.1/SmartDashboard-2021.1.1-win64.jar",
        sha256 = "5bf31005bc02403032cf2bf69cce2553f6ee8a2800eebda696180d1756b088db",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.1.1/PathWeaver-2021.1.1-linux64.jar",
        sha256 = "77bc8e5e3b2c7a7eab22400f5de0f34a9e3b4080fd4f6244c18190313d0570bf",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.1.1/PathWeaver-2021.1.1-mac64.jar",
        sha256 = "c8dccf8550d93d1a871b031219a39f9f7ecd248a31a8b331f4abcf2be79f45aa",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2021.1.1/PathWeaver-2021.1.1-win64.jar",
        sha256 = "269c8043def6f449ac05da8f871c77282abb006e5eeb6efd82bdd6b3f87d2a1b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2021.1.1/RobotBuilder-2021.1.1.jar",
        sha256 = "9599a83297a72a5019c9b005aa15a8da20abe21a5b5a47082faee28a1b47b74c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.1.1/shuffleboard-2021.1.1-linux64.jar",
        sha256 = "d07408e1911a13c31efbb2a88bc62c2e569cf378761219eae6031eed565e81ff",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.1.1/shuffleboard-2021.1.1-mac64.jar",
        sha256 = "354ada7d00c0752c5827c44f2aa726b8d07d9439ce2f9f92d35731032a871f33",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2021.1.1/shuffleboard-2021.1.1-win64.jar",
        sha256 = "a711f2ea6243d388b1281f564e44f6fd8b407872cd9ba546e35164d4bb51a86e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.1.1/OutlineViewer-2021.1.1-linux64.jar",
        sha256 = "3392c7048226f60719a30bb97e4aaf17b2bf391792c9314433fbf283679250e9",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.1.1/OutlineViewer-2021.1.1-mac64.jar",
        sha256 = "a3529d86466aee36ac6c315b6c6827ffa4625ea323e5863abc0be7af5f8b11c3",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2021.1.1/OutlineViewer-2021.1.1-win64.jar",
        sha256 = "234eb101d74649c7093edf72e7c0bc54848ce2769f5f2e72d337e61335689450",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.1.1/Glass-2021.1.1-windowsx86-64.zip",
        sha256 = "15fef63da5498e1512ac187ce2d8feb57278513c824047ce7844e202e6bc85ff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.1.1/Glass-2021.1.1-linuxx86-64.zip",
        sha256 = "c56ba67c2cf0f0f4b578a354a4f2c678776e3df427e52e6bc803e71680cd1fdc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2021.1.1/Glass-2021.1.1-osxx86-64.zip",
        sha256 = "8670e69f361b4d0a3cfb7ab8a8ec2fd29b1f83319d6c2ee358aceadf8063a9ab",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

setup_allwpilib_dependencies = module_extension(
    __setup_allwpilib_dependencies,
)
