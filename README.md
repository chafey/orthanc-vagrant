# orthanc-vagrant
Vagrant VM configuration for the Orthanc DICOM server

---

This is a sample **[vagrant](https://www.vagrantup.com/)** project that builds and configures a minimal **[Orthanc](http://www.orthanc-server.com/)** DICOM server


## Features

- **Ubuntu 14.04** (Trusty) Server
- Builds [Orthanc](http://www.orthanc-server.com/) **0.8.6** (dynamically linked)
- Builds [Orthanc DICOMWeb](https://bitbucket.org/sjodogne/orthanc-dicomweb/overview) **1.0** plugin and loads it (dynamically linked)
- Builds [Orthanc WebViewer](https://code.google.com/p/orthanc-webviewer/) **1.0** plugin and loads it (dynamically linked)
- Sets a fixed host-only IP at **192.168.33.10**
- Forwards Orthanc ports **4242** (DICOM) and **8042** (HTTP)
- Sets up the storage directory in a synced folder that maps to 'OrthancStorage' in the project's path
- Sets up disk compression

## Installation

- Download and install **[VirtualBox](https://www.virtualbox.org/wiki/Downloads)**
- Download and install **[Vagrant](http://www.vagrantup.com/downloads.html)**

- Clone this project and cd into the directory
- Build and run the Vagrant VM with `vagrant up`
- Wait a few minutes while vagrant:
	- Downloads the Ubuntu server image
	- Prepares the system
	- Builds Orthanc
	- Builds Orthanc DICOMWeb Plugin
	- Builds Orthanc WebViewer Plugin


## Running Orthanc

Once the vagrant VM is built and running, ssh into it with:

	vagrant ssh
	
(no password required)
	
Once inside the VM, start the Orthanc server with the provided configuration file:

	./OrthancBuild/Orthanc ~/Configuration.json

Use a web browser to access verify that Orthanc is running:

[http://localhost:8042](http://localhost:8042)

You can upload DICOM P10 to Orthanc using the following web interface:

[http://localhost:8042/app/explorer.html#upload](http://localhost:8042/app/explorer.html#upload)

Or you can push DICOM to it:

- IP Address: 192.168.33.10
- Port: 4242
- Called AE Title: ORTHAC

* Note that the calling AE title does not matter - Orthanc will accept any

You can access DICOMWeb RESTful interfaces here:

- http://localhost:8042/qido-rs
- http://localhost:8042/stow-rs
- http://localhost:8042/wado-rs

## Contributors

- Simon Rascovsky
- Chris Hafey

## License

MIT License
