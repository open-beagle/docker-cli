# docker-cli

<https://github.com/docker/cli>

```bash
git remote add upstream git@github.com:docker/cli.git

git fetch upstream

git merge v28.3.2
```

## build

```bash
# cross
docker run -it \
--rm \
-v $PWD/:/go/src/github.com/docker/cli \
-w /go/src/github.com/docker/cli \
-e VERSION=28.3.2-beagle \
-e PLATFORM="© 2018 BeagleCloud Team" \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.24-bookworm \
bash .beagle/build.sh
```

## test

```bash
# amd64
docker run -it --rm \
-v $PWD/:/go/src/github.com/docker/cli \
-w /go/src/github.com/docker/cli \
registry.cn-qingdao.aliyuncs.com/wod/alpine:3-amd64 \
sh -c "build/docker-linux-amd64 version"

# arm64
docker run -it --rm \
-v $PWD/:/go/src/github.com/docker/cli \
-w /go/src/github.com/docker/cli \
registry.cn-qingdao.aliyuncs.com/wod/alpine:3-arm64 \
sh -c "build/docker-linux-arm64 version"
```

## cache

```bash
# 构建缓存-->推送缓存至服务器
docker run --rm \
  -e PLUGIN_REBUILD=true \
  -e PLUGIN_ENDPOINT=$S3_ENDPOINT_ALIYUN \
  -e PLUGIN_ACCESS_KEY=$S3_ACCESS_KEY_ALIYUN \
  -e PLUGIN_SECRET_KEY=$S3_SECRET_KEY_ALIYUN \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="docker-cli" \
  -e PLUGIN_MOUNT="./.git" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0

# 读取缓存-->将缓存从服务器拉取到本地
docker run --rm \
  -e PLUGIN_RESTORE=true \
  -e PLUGIN_ENDPOINT=$S3_ENDPOINT_ALIYUN \
  -e PLUGIN_ACCESS_KEY=$S3_ACCESS_KEY_ALIYUN \
  -e PLUGIN_SECRET_KEY=$S3_SECRET_KEY_ALIYUN \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="docker-cli" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0
```
