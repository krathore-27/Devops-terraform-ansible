terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-02b8534ff4b424939"
  instance_type = "t2.micro"
  key_name = "komal_import_pub_ec2"

  tags = {
    Name = "Komal-DevOps-batch-server"
    env = "Production"
    owner = "Komal Rathore"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

