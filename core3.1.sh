#!/bin/bash -e
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
apt-get install apt-transport-https
apt-get update
apt-get install aspnetcore-runtime-3.1
