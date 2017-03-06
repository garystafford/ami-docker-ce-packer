# Baking AWS AMI with new Docker CE Using Packer

Files for the post, '[Baking AWS AMI with new Docker CE Using Packer Packer](http://programmaticponderings.com/2017/03/06/baking-aws-ami-with-new-docker-ce-using-packer)'.

In this post, I will demonstrate how to partially bake an existing Amazon Machine Image (Amazon AMI) with the new Docker CE, preparing it as a base for the creation of Amazon Elastic Compute Cloud (Amazon EC2) compute instances.

Adding Docker and similar tooling to an AMI is referred to as partially baking an AMI, often referred to as a hybrid AMI. According to AWS, ‘_hybrid AMIs provide a subset of the software needed to produce a fully functional instance, falling in between the fully baked and JeOS (just enough operating system) options on the AMI design spectrum._’

Installing Docker CE on an AWS AMI should not be confused with Docker’s also recently announced Docker Community Edition (CE) for AWS. Docker for AWS offers multiple CloudFormation templates for Docker EE and CE. According to Docker, Docker for AWS ‘_provides a Docker-native solution that avoids operational complexity and adding unneeded additional APIs to the Docker stack._’

## Helpful Commands

### Packer

```bash
source <your_aws_creds>.env

packer build docker_ami.json
```

### Terraform

```bash
terraform remote config \
  -backend=s3 \
  -backend-config="bucket=<your_bucket_name>" \
  -backend-config="key=terraform-test-docker-ce.tfstate" \
  -backend-config="region=us-east-1"

terraform validate
terraform plan
terraform apply
terraform show
```

### AWS CLI Queries

```bash
# Returns AMI Image ID
aws ec2 describe-images \
  --filters Name=tag-key,Values=ami Name=tag-value,Values=us-east-1-test-docker-ce-base \
  --query 'Images[*].{ID:ImageId}'

# Returns EC2 Image ID
aws ec2 describe-instances \
  --filters Name='tag:Name,Values=tf-instance-test-docker-ce' \
  --output text --query 'Reservations[*].Instances[*].ImageId'

# Returns EC2 Private IP
aws ec2 describe-instances \
  --filters Name='tag:Name,Values=tf-instance-test-docker-ce' \
  --output text --query 'Reservations[*].Instances[*].PrivateIpAddress'

# Returns EC2 Public IP
aws ec2 describe-instances \
  --filters Name='tag:Name,Values=tf-instance-test-docker-ce' \
  --output text --query 'Reservations[*].Instances[*].PublicIpAddress'
```
