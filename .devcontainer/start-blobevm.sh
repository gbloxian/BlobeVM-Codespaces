#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

mkdir -p Save
if [[ -z "$(find Save -mindepth 1 -maxdepth 1 -print -quit)" ]]; then
  cp -a root/config/. Save/
fi

if docker container inspect BlobeVM >/dev/null 2>&1; then
  docker start BlobeVM
else
  if ! docker image inspect blobevm >/dev/null 2>&1; then
    docker build -t blobevm .
  fi

  docker run -d \
    --name=BlobeVM \
    --security-opt seccomp=unconfined \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Etc/UTC \
    -e SUBFOLDER=/ \
    -e TITLE=BlobeVM \
    -p 3000:3000 \
    --shm-size=2gb \
    -v "$PWD/Save:/config" \
    --restart unless-stopped \
    blobevm
fi