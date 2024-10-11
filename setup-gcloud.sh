#!/bin/bash

# Exit the script if any command fails
set -e

# update first
sudo apt update

# make
sudo apt install make -y

# clang
sudo apt install clang -y

# gcc 11.2
sudo apt install libasan6=11.2.0-19ubuntu1 libtsan0=11.2.0-19ubuntu1 gcc-11=11.2.0-19ubuntu1 g++-11=11.2.0-19ubuntu1 gcc-11-base=11.2.0-19ubuntu1 libstdc++-11-dev=11.2.0-19ubuntu1 libgcc-11-dev=11.2.0-19ubuntu1 cpp-11=11.2.0-19ubuntu1 --allow-downgrades -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 100

# install OpenBLAS
sudo apt-get install libopenblas-dev -y

# download armpl, wget takes a while
wget https://developer.arm.com/-/media/Files/downloads/hpc/arm-performance-libraries/24-04/linux/arm-performance-libraries_24.04_deb_gcc.tar
tar -xf arm-performance-libraries_24.04_deb_gcc.tar
cd arm-performance-libraries_24.04_deb/
sudo ./arm-performance-libraries_24.04_deb.sh --accept
cd ..
rm -f arm-performance-libraries_24.04_deb_gcc.tar
rm -rf arm-performance-libraries_24.04_deb
# actually install the module
sudo apt install environment-modules -y
source /usr/share/modules/init/bash
export MODULEPATH=$MODULEPATH:/opt/arm/modulefiles

# gdb
sudo apt install gdb -y

echo "Google Cloud Dev environment setup complete!"
