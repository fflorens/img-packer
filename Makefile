# UBUNTU_FLAVOR can be bionic or xenial for now
PROJECT_NAME = scw-ubuntu
UBUNTU_FLAVOR ?= bionic
SCW_REGION ?= par1
# VARIANT is either mini or classic (25GB or 50GB os drive)
VARIANT ?= classic
export

all: build-ubuntu

build-ubuntu:
	@echo "Building Ubuntu $(UBUNTU_FLAVOR) $(VARIANT)"
	packer build -var region=$(SCW_REGION) -var-file=packer/start1-$(VARIANT).json -var-file=packer/$(UBUNTU_FLAVOR).json -var-file=packer/secret.json packer/ubuntu.json

.PHONY:  build-ubuntu
