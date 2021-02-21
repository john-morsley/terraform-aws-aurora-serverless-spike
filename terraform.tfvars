/*
__      __        _       _     _           
\ \    / /       (_)     | |   | |          
 \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
  \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
   \  / (_| | |  | | (_| | |_) | |  __/\__ \
    \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/ 
    
*/

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24"]
private_subnet_cidrs = ["10.0.2.0/24","10.0.3.0/24"]

cluster_name            = "aurora-cluster"
database_instance_class = "db.t2.micro"

bastion_name          = "bastion-to-aurora"
bastion_user          = "ec2-user"
bastion_instance_type = "t2.nano"