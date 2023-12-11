region = "us-east-1"
}

# This will create a ec2 instance 
resource "aws_instance" "myec2" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  tags = {
    Name = "test-instance"
  }
}
