#!/bin/bash
set -ex

root_dir=$(cd "$(dirname "$0")/.." && pwd -P)

docker run -d --rm \
    --network host \
    -e HOST_UID=$(id -u) \
    -e HOST_GID=$(id -g) \
    -v "/dev/shm:/dev/shm" \
    -v "$root_dir:$root_dir:ro" \
    -v "$HOME/.config/wechat-devtools:$HOME/.config/wechat-devtools:ro" \
    --name wechat_devtools_server \
    ghcr.io/msojocs/skyline-client-server:master