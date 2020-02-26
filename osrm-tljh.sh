#!/bin/sh  

# Install jupyter
curl https://raw.githubusercontent.com/jupyterhub/the-littlest-jupyterhub/master/bootstrap/bootstrap.py \
  | sudo python3 - \
    --admin sam
		
# Create shared data folder

cd /etc/skel
sudo mkdir -p /srv/data/shared
sudo ln -s /srv/data/shared shared
sudo chmod -R go+rwx /srv/data/shared

# Uncomment to enable idle culler:
# The idle check interval represents how frequent (in seconds) the Hub will check if there are any idle servers to cull. Set to 2 hours.
# sudo tljh-config set services.cull.every 7200
sudo tljh-config set services.cull.enabled False
sudo tljh-config reload

###
# OSRM install
###

# Script to install OSRM on fresh Ubuntu 18.04 installation

# Make sure AWS Ubuntu packages up to date
sudo apt-get update
sudo apt-get install -y git cmake build-essential jq unzip liblua5.2-dev libboost-all-dev libprotobuf-dev libtbb-dev libstxxl-dev libbz2-dev

# Clone most recent osrm version
git clone https://github.com/Project-OSRM/osrm-backend.git
cd osrm-backend/
git checkout 5.22.0 # update if necessary

# Create build directory and install
mkdir build
cd build
cmake ..
make
sudo make install

# Download map, get it in the correct directory with correct name
cd ..
wget -O gb.xml.bz2 https://download.geofabrik.de/europe/great-britain-latest.osm.bz2
bzip2 -d gb.xml.bz2
osrm-extract gb.xml -p profiles/car.lua
osrm-contract gb.xml.osrm
