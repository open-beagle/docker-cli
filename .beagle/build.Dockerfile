ARG BASE

FROM $BASE

ARG AUTHOR
ARG VERSION

LABEL maintainer=$AUTHOR version=$VERSION

ARG TARGETOS
ARG TARGETARCH

ADD ./build/docker-$TARGETOS-$TARGETARCH /usr/local/bin/docker
ADD ./build/docker-buildx-$TARGETOS-$TARGETARCH /usr/libexec/docker/cli-plugins/docker-buildx
