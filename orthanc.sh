#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y build-essential unzip cmake mercurial \
        uuid-dev libcurl4-openssl-dev liblua5.1-0-dev \
        libgoogle-glog-dev libgtest-dev libpng-dev \
        libsqlite3-dev libssl-dev zlib1g-dev \
        libdcmtk2-dev libboost-all-dev libwrap0-dev libjsoncpp-dev libcharls-dev \
        libpugixml-dev

wget http://downloads.sourceforge.net/project/orthancserver/Orthanc-0.8.6.tar.gz
rm -rf /home/vagrant/Orthanc-0.8.6
tar -xzf Orthanc-0.8.6.tar.gz
rm Orthanc-0.8.6.tar.gz
rm -rf /home/vagrant/OrthancBuild
mkdir OrthancBuild
cd OrthancBuild
cmake "-DDCMTK_LIBRARIES=CharLS;dcmjpls;wrap;oflog" \
      -DALLOW_DOWNLOADS=ON \
      -DUSE_SYSTEM_MONGOOSE=OFF \
      -DUSE_SYSTEM_JSONCPP=OFF \
      -DUSE_GTEST_DEBIAN_SOURCE_PACKAGE=ON \
      /home/vagrant/Orthanc-0.8.6
make
mkdir /home/vagrant/OrthancBuild/include
mkdir /home/vagrant/OrthancBuild/include/orthanc
cp /home/vagrant/Orthanc-0.8.6/Plugins/Include/* /home/vagrant/OrthancBuild/include/orthanc

cd /home/vagrant