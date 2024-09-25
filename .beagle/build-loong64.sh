#!/bin/bash

set -ex

git config --global --add safe.directory $PWD

export CGO_ENABLED=0
export GO_STRIP=1
export DISABLE_WARN_OUTSIDE_CONTAINER=1

export GOARCH=loong64
make binary
