#!/bin/bash -e
apt-get update \

        && apt-get -y install wget  sqlite fontconfig xfonts-utils ca-certificates procps \

        && cd /usr \

        && wget https://linuxdot.net/down/jexus-6.2.x-x64.tar.gz \

        && tar -zxvf jexus-6.2.x-x64.tar.gz \

        && apt-get -y autoremove --purge wget \

        && rm -rf /var/lib/apt/lists/*
mv jexus /usr/ && cd /usr/jexus && /usr/jexus/jws regsvr



