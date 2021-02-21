/*
 __      _______   _____ 
 \ \    / /  __ \ / ____|
  \ \  / /| |__) | |     
   \ \/ / |  ___/| |     
    \  /  | |    | |____ 
     \/   |_|     \_____|
                         
*/

# Virtual Private Cloud

module "aurora-vpc" {

  source = "../terraform-aws-vpc-module"
  //source = "john-morsley/vpc/aws"

  name = var.cluster_name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = data.aws_availability_zones.available.names

}