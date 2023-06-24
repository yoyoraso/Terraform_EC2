# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type                = "t2.micro"
  key_name                     = "yaya"
  monitoring                   = true
  ami                          = data.aws_ami.amzlinux2.id
  vpc_security_group_ids       = [aws_security_group.web_sg.id]
  subnet_id                    = module.vpc.public_subnets[0]


  tags = {
    Terraform   = "true"
    Environment = "dev"
    creator = "yaya"
  }
}

resource "aws_eip" "ec2_eip" {
  depends_on = [module.ec2_instance, module.vpc ]
  instance = module.ec2_instance.id
  vpc      = true
}

output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_instance.id
}