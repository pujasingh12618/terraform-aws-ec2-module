module "ec2" {
    
  source                  = "../ec2"

  ec2_name             = "linux"
  instance_type        = local.instance_type
  ami                  = local.ami
  key_name             = local.key_name
  sg_rules             = local.sg_rules
  user_data_path       = local.user_data_path
  resource_name_prefix = local.resource_name_prefix
  ebs_size             = local.ebs_size
  root_volume_size     = local.root_volume_size
  subnet_id            = local.subnet_id
  vpc_id               = local.vpc_id
}