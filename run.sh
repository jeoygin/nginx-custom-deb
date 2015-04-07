#!/bin/bash

set -eo pipefail

WORKDIR=$(cd `dirname $0`; pwd)
OWNER=$(ls -l "$0" | awk '{print $3}')
GROUP=$(ls -l "$0" | awk '{print $4}')
TMPDIR=/tmp/nginx-custom
NGINX_VERSION=1.6.2-1

mkdir $TMPDIR
cp nginx_signing.key $TMPDIR
cp nginx.list /etc/apt/sources.list.d/

cd $TMPDIR
apt-key add nginx_signing.key
apt-get update && apt-get build-dep -y nginx=${NGINX_VERSION} && apt-get source -y nginx=${NGINX_VERSION}
cp "$WORKDIR/rules" nginx-1.6.2/debian/

cd nginx-1.6.2
dpkg-buildpackage -uc -b -j2

cp "$TMPDIR/nginx_1.6.2-1~trusty_amd64.deb" "$WORKDIR"
chown $OWNER:$GROUP "$WORKDIR/nginx_1.6.2-1~trusty_amd64.deb"

