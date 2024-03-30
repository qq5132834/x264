#!/bin/bash

NDK=/home/ubuntu/Desktop/ndk/android-ndk-r22b

echo "android-ndk-r22b install path:  $DNK"

HOST_TAG=linux-x86_64
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG

ANDROID_LIB_PATH="$(pwd)/android"

API=21

function build_android_arm
{
 echo "build for android $CPU"
 ./configure \
 --host=$HOST \
 --disable-shared \
 --enable-static \
 --prefix="$ANDROID_LIB_PATH/$CPU" \
 --enable-pic \
 --enable-strip \
 --extra-cflags="-fPIC"

 make clean
 make -j8
 make install
 echo "building for android $CPU completed"
}

CPU=armv8-a
HOST=aarch64-linux-android
#export AR=$TOOLCHAIN/bin/aarch64-linux-android-ar
#export AS=$TOOLCHAIN/bin/aarch64-linux-android-as
#export LD=$TOOLCHAIN/bin/aarch64-linux-android-ld
#export RANLIB=$TOOLCHAIN/bin/aarch64-linux-android-ranlib
#export STRIP=$TOOLCHAIN/bin/aarch64-linux-android-strip
export CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
build_android_arm




