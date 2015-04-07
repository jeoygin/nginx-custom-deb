#!/bin/bash

set -eo pipefail

export WORKDIR=$(cd `dirname $0`; pwd)
export NAME="nginx-custom-deb"

UBUNTU_IMAGE="ubuntu:14.04" && sudo docker history $UBUNTU_IMAGE > /dev/null || sudo docker pull $UBUNTU_IMAGE
sudo docker run -it --rm -v "$WORKDIR":/data -w /data $UBUNTU_IMAGE ./run.sh
