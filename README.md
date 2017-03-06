# Partially Baking AWS AMI with new Docker CE Using Packer

Files for the post, '[Partially Baking AWS AMI with new Docker CE Using Packer](http://programmaticponderings.com/2017/03/05/partially-baking-aws-ami-with-new-docker-ce-using-packer)'.

In this post, I will demonstrate how to partially bake an existing Amazon Machine Image (Amazon AMI) with Docker CE, preparing it as a base for the creation of Amazon Elastic Compute Cloud (Amazon EC2) instances.

Adding Docker and similar tooling to an AMI is referred to as partially baking an AMI, often referred to as a hybrid AMI. According to AWS, ‘_hybrid AMIs provide a subset of the software needed to produce a fully functional instance, falling in between the fully baked and JeOS (just enough operating system) options on the AMI design spectrum._’

Installing Docker CE on an AWS AMI should not be confused with Docker’s also recently announced Docker Community Edition (CE) for AWS. Docker for AWS offers multiple CloudFormation templates for EE and CE, which according to Docker, ‘_provides a Docker-native solution that avoids operational complexity and adding unneeded additional APIs to the Docker stack._’
