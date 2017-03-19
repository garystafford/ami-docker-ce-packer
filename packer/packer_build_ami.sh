#!/bin/sh

# Builds Ubuntu Docker CE AMI

set -e

echo " "
echo "*** Provisioning Docker CE AMI ***"

packer build -color=false ubuntu_docker_ce_ami.json
