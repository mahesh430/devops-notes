provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "latest_ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's owner ID
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"
}
