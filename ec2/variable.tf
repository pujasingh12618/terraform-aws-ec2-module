variable "ec2_name" {
  description = "Name of the ec2 instance."
  default     = null
  type        = string
}

variable "ami" {
  description = "ami used for the creation of the EC2 instance."
  default     = null
  type        = string
}

variable "instance_type" {
  description = "Instance type used for the creation of ec2."
  default     = null
  type        = string
}

variable "version_ec2" {
  description = "EC2 version"
  default     = null
  type        = string
}

variable "key_name" {
  description = "Key name of the instance."
  default     = null
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet used for the instance."
  default     = null
  type        = string
}

variable "vpc_id" {
  description = "Id of the VPC where the ec2 lives"
  default     = null
  type        = string
}

variable "program_tag" {
  description = ""
  default     = null
  type        = string
}

variable "cidr_blocks" {
  description = "Cidr blocks used for the security group rule."
  default     = null
  type        = list(string)
}

variable "resource_name_prefix" {
  description = ""
  type        = string
}

variable "prefix_list_ids" {
  description = "List of prefix ids"
  default     = null
  type        = list(string)
}

variable "ipv6_cidr_blocks" {
  description = "List of ipv6 cidr blocks."
  default     = null
  type        = list(string)
}

variable "sg_rules" {
  description = ""
  type        = list(any)
}

variable "user_data_path" {
  description = "The path of user data script provided when launching the instance."
  type        = string
  default     = null
}

variable "ebs_size" {
  type        = number
  description = "The value in Gib for the EBS volume in the instance"
  default     = null
}

variable "root_volume_size" {
  type        = number
  description = "The value in Gib for the EBS volume in the instance"
  default     = null
}