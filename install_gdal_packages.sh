

# In environment:
sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
sudo apt-get -y install gdal-bin libgdal-dev
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
ogrinfo --version # get version - in this case 2.4.2
sudo -Ei pip install numpy pandas sklearn spacy matplotlib seaborn GDAL==2.4.2 osrm

# replace broken import in old version with current import
sudo sed -i 's/\bfrom matplotlib.mlab import griddata\b/from scipy.interpolate import griddata/g' /opt/tljh/user/lib/python3.7/site-packages/osrm/extra.py