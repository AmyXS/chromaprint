#!/usr/bin/env bash

: ${OS?}
: ${ARCH?}

set -eux

BASE_DIR=$(cd $(dirname $0)/.. && pwd)

cd $BASE_DIR

TMP_BUILD_DIR=$BASE_DIR/$(mktemp -d build.XXXXXXXX)
trap 'rm -rf $TMP_BUILD_DIR' EXIT

cd $TMP_BUILD_DIR

curl -s -L "https://github.com/acoustid/ffmpeg-build/releases/download/v4.2.2-4/ffmpeg-4.2.2-audio-$OS-$ARCH.tar.gz" | tar xz
export FFMPEG_DIR=$TMP_BUILD_DIR/$(ls -d ffmpeg-* | tail)

CMAKE_ARGS=(
    -DCMAKE_INSTALL_PREFIX=$BASE_DIR/chromaprint-$OS-$ARCH
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_TOOLS=OFF
    -DBUILD_TESTS=OFF
    -DBUILD_SHARED_LIBS=ON
)

STRIP=strip

case $OS in
windows)
    perl -pe "s!{EXTRA_PATHS}!$FFMPEG_DIR!g" $BASE_DIR/package/toolchain-mingw.cmake.in | perl -pe "s!{ARCH}!$ARCH!g" >toolchain.cmake
    CMAKE_ARGS+=(
        -DCMAKE_TOOLCHAIN_FILE=$TMP_BUILD_DIR/toolchain.cmake
    )
    STRIP=$ARCH-w64-mingw32-strip
    ;;
macos)
    CMAKE_ARGS+=(
        -DCMAKE_CXX_FLAGS='-stdlib=libc++'
    )
    ;;
linux)
    case $ARCH in
    i686)
        CMAKE_ARGS+=(
        )
        ;;
    x86_64)
        CMAKE_ARGS+=(
        )
        ;;
    arm*)
        perl -pe "s!{EXTRA_PATHS}!$FFMPEG_DIR!g" $BASE_DIR/package/toolchain-armhf.cmake.in | perl -pe "s!{ARCH}!$ARCH!g" >toolchain.cmake
        CMAKE_ARGS+=(
            -DCMAKE_TOOLCHAIN_FILE=$TMP_BUILD_DIR/toolchain.cmake
        )
        STRIP=arm-linux-gnueabihf-strip
        ;;
    *)
        echo "unsupported architecture ($ARCH)"
        exit 1
    esac
    ;;
*)
    echo "unsupported OS ($OS)"
    exit 1
    ;;
esac

if [ $OS != macos ]
then
	export LDFLAGS=-Wl,-Bsymbolic
fi

cmake "${CMAKE_ARGS[@]}" $BASE_DIR

make VERBOSE=1
make install VERBOSE=1
