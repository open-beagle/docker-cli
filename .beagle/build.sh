#!/bin/bash 

set -ex

export CGO_ENABLED=0
export GO_STRIP=1
export DISABLE_WARN_OUTSIDE_CONTAINER=1

export GOARCH=amd64
make binary

export GOARCH=arm64
make binary

export GOARCH=ppc64le
make binary

export GOARCH=mips64le
make binary

export GOARCH=loong64
make binary