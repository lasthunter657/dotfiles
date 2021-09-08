#!/bin/bash

sudo apt update -y && sudo apt install -y jq

TAG=$(jq -r "map(select(.prerelease)) | first | .tag_name" <<<$(curl --silent https://api.github.com/repos/docker/compose/releases))
ARCH=$(dpkg --print-architecture)

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/$TAG/docker-compose-linux-$ARCH -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

sudo apt purge -y jq && sudo apt autoremove -y
