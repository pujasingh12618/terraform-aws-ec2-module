locals {
  // Environment where the resources will be deployed
  environment = "sbox"

  stack_level = "tb"

  // The deployment version included as part of the resource name prefixes
  // Deployment version can be used to provision multiple versions of the infrastructure at the same time
  deployment_version = "1x0"

  resource_name_prefix = "ec2-${local.environment}-${local.deployment_version}"

  // Region where the resources will be deployed
  region = "us-east-2"

  // Program tag
  evtech_program = "terraform-testing"

  // Owner tag
  evtech_owner = "cloudops@example.com"

  // Account id
  account_id = "595919132538"
  
  // EC2 Parameters
  subnet_id              = "subnet-02e35bf7b8c8444f8"
  vpc_id                 = "vpc-07dea4f2eee228c99"
  instance_type          = "t2.xlarge"
  
  // EC2 TC without userdata
  ami            = "ami-091dbe769bf1d5d72"
  ec2_name       = "linux-poc"
  key_name       = "${local.ec2_name}-keyname"
  sg_rules       = [
    {
      description                 = "Ingress SSH port for EC2"
      cidr_blocks                 = ["172.31.0.0/16"]
      from_port                   = "22"
      protocol                    = "tcp"
      self                        = null
      source_security_group_id    = null
      to_port                     = "22"
      type                        = "ingress"
      prefix_list_ids             = null
      ipv6_cidr_blocks            = null
    }
  ]
  # windows_ec2_name_with_ebs   = "windows-test-with-ebs"
  user_data_path        = "userdata/bash.sh"

# If increasing this, it has be to greater than previous
# the increased amount will be added as unallocated space and a volume need to created out of it 
  ebs_size                    = 80
  root_volume_size            = 50
}

locals {
  default_provider_tags = {
    "evtech:environment"    = local.environment
    "evtech:owner"          = local.evtech_owner
    "evtech:program"        = local.evtech_program
    "evtech:provisioned-by" = local.evtech_program
    "evtech:longterm"       = "forever"
    "evtech:commit-hash"    = var.commit_hash
  }
}