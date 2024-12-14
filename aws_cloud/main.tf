terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.80.0"
    }
  }
  required_version = "~> 1.10.0"
}

provider "aws" {
  region     = "ap-southeast-1"
}

# data "aws_ami" "ami_amazon" {
#   most_recent = true
#   owners = ["amazon"]
#   # al2023-ami-2023.6.20241121.0-kernel-6.1-x86_64
#   filter{
#       name   = "name"
#       values = ["al2023-ami-2023.6*kernel-6.1-x86_64"]
#   }
# }

resource "aws_instance" "myec2_tf" {
  ami = var.ami_amazon
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_id]

  user_data = file("./init_script.sh")

  tags = {
    Name = "terraform_ec2"
  }

}

output "instance_public_ip" {

  value = aws_instance.myec2_tf.public_ip
  description = "Public IP address of the EC2 instance"
}