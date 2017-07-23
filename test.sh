#!/bin/bash

set -e

for abi in armeabi-v7a arm64-v8a x86 x86_64; do
    outdir="build_${abi}"

    rm -rf "${outdir}"
    mkdir -p "${outdir}"

    pushd "${outdir}"
    cmake .. \
        -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK}"/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI="${abi}" \
        -DANDROID_STL=gnustl_static \
        -DANDROID_PLATFORM=android-21 \
        -DANDROID_PIE=ON
    make VERBOSE=1
    popd
done
