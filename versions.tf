terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = " >=4.60.0"
    }    
    # aws1 = {
    #   source  = "terraform-aws-modules/ec2-instance/aws"
    #   version = ">= 5.1.0"
    # }

    # aws2 = {
    #   source  = "terraform-aws-modules/vpc/aws"
    #   version = "5.0.0"
    # }

    # aws3 = {
    #   source  = "terraform-aws-modules/security-group/aws"
    #   version = "1.19.0"
    # }

    # aws4 = {
    #   source  = "terraform-aws-modules/key-pair/aws"
    #   version = "2.0.2"
    # }
  }

  required_version = ">= 0.14"
}