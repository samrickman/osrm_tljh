

# In environment:
sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
sudo apt-get -y install gdal-bin libgdal-dev
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
ogrinfo --version # get version - in this case 2.4.2
sudo -Ei pip install numpy pandas sklearn spacy matplotlib seaborn GDAL==2.4.2 osrm-py

