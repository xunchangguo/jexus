#!/bin/bash -e
curl --location --output aspnetcore-runtime-3.1.2-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/2d72ee67-ac4d-42c6-97d9-a26a28201fc8/977ad14b99b6ed03dcefd6655789e43a/aspnetcore-runtime-3.1.2-linux-x64.tar.gz

mkdir -p $HOME/dotnet && tar zxf aspnetcore-runtime-3.1.2-linux-x64.tar.gz -C $HOME/dotnet

export DOTNET_ROOT=$HOME/dotnet

export PATH=$PATH:$HOME/dotnet
