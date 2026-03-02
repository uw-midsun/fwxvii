module(
    name = "fwxvii",
    version = "0.0.1",
)

bazel_dep(name ="rules_cc", version - "0.2.14")
bazel_dep(name = "bazel_skylib", version = "1.8.2")

# x86 Build toolchain

bazel_dep(name = "toolchains_llvm", version = "1.6.0")

llvm = use_extension("@toolchains_llvm//toolchain/extensions:llvm.bzl", "llvm")

llvm.toolchain(
    llvm_version = "17.0.6",
)
  
use_repo(llvm, "llvm_toolchain")

register_toolchains("@llvm_toolchain//:all")

# ARM Build toolchain

bazel_dep(name = "toolchains_arm_gnu", version = "1.1.0")

arm_toolchain = use_extension("@toolchains_arm_gnu//:extensions.bzl", "arm_toolchain")

arm_toolchain.arm_none_eabi()

use_repo(arm_toolchain, "arm_none_eabi")

register_toolchains("@arm_none_eabi//toolchain:all")
