#!/bin/bash 

set -ex

export GO_LINKMODE=static
# export GO_STRIP=1
export GO111MODULE=off
export DISABLE_WARN_OUTSIDE_CONTAINER=1

export GOARCH=amd64
make binary

export GOARCH=arm64
export CC=aarch64-linux-gnu-gcc
make binary

export GOARCH=ppc64le
export CC=powerpc64le-linux-gnu-gcc
make binary

export GOARCH=mips64le
export CC=mips64el-linux-gnuabi64-gcc
make binary