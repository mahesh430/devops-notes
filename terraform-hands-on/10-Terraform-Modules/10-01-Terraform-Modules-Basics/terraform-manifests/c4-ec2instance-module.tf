# AWS EC2 Instance Module
module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-modules-demo"
  instance_count         = 2

  ami                    = data.aws_ami.amzlinux.id 
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-03cdfe11893861f14"] # Get Default VPC Security Group ID and replace
  subnet_id              = "subnet-0016e1df81ca37e4b" # Get one public subnet id from default vpc and replace
  user_data              = file("apache-install.sh") 
  
  tags = {
    Name        = "Modules-Demo"
    Terraform   = "true"
    Environment = "dev"
  }
}

