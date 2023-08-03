resource "aws_key_pair" "ec2-key-pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "ec2-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.key_name
}

resource "aws_instance" "main" {

  lifecycle {
    create_before_destroy = true
  }

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = var.subnet_id
  user_data              = var.user_data_path != null ? data.template_file.user_data[0].rendered : null

  root_block_device {
    volume_size = var.root_volume_size == null ? null : var.root_volume_size
  }
  tags = {
    Name        = "${var.resource_name_prefix}-ec2-${var.ec2_name}"
    Description = "${var.resource_name_prefix}-ec2-${var.ec2_name} Instance created by Terraform"
  }

}

resource "aws_ebs_volume" "main" {

  lifecycle {
    create_before_destroy = true
  }

  count = var.ebs_size == null ? 0 : 1

  availability_zone = aws_instance.main.availability_zone
  type              = "gp3"
  size              = var.ebs_size // Size in GiB

  tags = {
    Name = "${var.resource_name_prefix}-ebs-${var.ec2_name}"
  }

}

resource "aws_volume_attachment" "main" {

  lifecycle {
    create_before_destroy = true
  }

  count = var.ebs_size == null ? 0 : 1

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.main[count.index].id
  instance_id = aws_instance.main.id

}