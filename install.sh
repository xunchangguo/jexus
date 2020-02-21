#!/bin/bash -e
apt-get update && apt-get upgrade -y
# install wget to download jexus, curl for healthcheck.
apt-get install -y --no-install-recommends wget sqlite fontconfig xfonts-utils
cd /usr
wget https://linuxdot.net/down/jexus-6.2.x-x64.tar.gz 
tar -zxvf jexus-6.2.x-x64.tar.gz 
apt-get -y autoremove --purge wget 
rm -rf /var/lib/apt/lists/* jexus-6.2.x-x64.tar.gz




