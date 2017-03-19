#!/bin/sh

# Builds Ubuntu Docker CE AMI

set -e

echo " "
echo "*** Provisioning Docker CE AMI ***"

cd packer/

packer build ubuntu_docker_ce_ami.json
