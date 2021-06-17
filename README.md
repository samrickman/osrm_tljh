# Pipeline for Open Source Routing Machine (OSRM) and The Littlest Jupyter Hub (TLJH)

This script is to install [OSRM](https://github.com/Project-OSRM/osrm-backend) and [TLJH](http://tljh.jupyter.org/en/latest/install/amazon.html) on a fresh Ubuntu 18.04 AWS instance.

This repo contains two scripts:

1. osrm-tljh.sh. This installs jupyterhub, creates a shared folder for all users, installs OSRM, and finally downloads and builds the latest GB maps. The final step can take a couple of hours and requires at least 32GB RAM. Once you have created the instance, clone this repo and run this script.

3. iinstall_gdal_packages.sh. Once the first script has run, login to the JupyterHub environment (admin name "sam", password will be created the first time you enter it). Oen a terminal and run this script **from within the JupyterHub terminal**. This will ensure that the required (non-Python) libraries are available to the Python packages. It also fixes an outdated dependency if it appears.
