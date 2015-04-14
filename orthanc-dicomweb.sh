#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y build-essential unzip cmake mercurial \
        libgdcm2-dev libpugixml-dev

wget  https://bitbucket.org/sjodogne/orthanc-dicomweb/get/default.zip -O orthanc-dicomweb.zip
rm -rf /home/vagrant/OrthancDICOMWeb
unzip orthanc-dicomweb.zip -d /home/vagrant/OrthancDICOMWeb
rm orthanc-dicomweb.zip
rm -rf /home/vagrant/OrthancDICOMWebBuild
mkdir /home/vagrant/OrthancDICOMWebBuild
cd /home/vagrant/OrthancDICOMWebBuild
export CXXFLAGS=-isystem\ /home/vagrant/OrthancBuild/include
cmake "-DUSE_GTEST_DEBIAN_SOURCE_PACKAGE=ON" \
      -DCMAKE_REQUIRED_INCLUDES= /home/vagrant/OrthancBuild/include \
      /home/vagrant/OrthancDICOMWeb/sjodogne-orthanc-dicomweb-db07057d77ad
make
cd /home/vagrant
