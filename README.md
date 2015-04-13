# orthanc-vagrant
Vagrant VM configuration for the Orthanc DICOM server

---

This is a sample **[vagrant](https://www.vagrantup.com/)** project that builds and configures a minimal **[Orthanc](http://www.orthanc-server.com/)** DICOM server


## Features

- **Ubuntu 14.04** (Trusty) Server
- Builds Orthanc **0.8.6** (dynamically linked)
- Sets a fixed host-only IP at **192.168.33.10**
- Forwards Orthanc ports **4242** (DICOM) and **8042** (HTTP)
- Sets up the Orthanc storage directory

## Installation

- Download and install **[VirtualBox](https://www.virtualbox.org/wiki/Downloads)**
- Download and install **[Vagrant](http://www.vagrantup.com/downloads.html)**

- Clone this project and cd into the directory
- Build and run the Vagrant VM with `vagrant up`
- Wait a few minutes while vagrant:
	- Downloads the Ubuntu server image
	- Prepares the system
	- Builds Orthanc


## Running Orthanc

Once the vagrant VM is built and running, ssh into it with:

	vagrant ssh
	
(no password required)
	
Once inside the VM, start the Orthanc server with the provided configuration file:

	./OrthancBuild/Orthanc ~/Configuration.json


## Contributors


## License

MIT License
