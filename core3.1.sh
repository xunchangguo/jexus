#!/bin/bash -e
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/10/prod.list
mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
chown root:root /etc/apt/sources.list.d/microsoft-prod.list
curl --location --output aspnetcore-runtime-3.1.2-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/2d72ee67-ac4d-42c6-97d9-a26a28201fc8/977ad14b99b6ed03dcefd6655789e43a/aspnetcore-runtime-3.1.2-linux-x64.tar.gz

mkdir -p $HOME/dotnet && tar zxf aspnetcore-runtime-3.1.2-linux-x64.tar.gz -C $HOME/dotnet

export DOTNET_ROOT=$HOME/dotnet

export PATH=$PATH:$HOME/dotnet
