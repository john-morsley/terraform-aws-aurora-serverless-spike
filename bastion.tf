/*
 ____            _   _             
|  _ \          | | (_)            
| |_) | __ _ ___| |_ _  ___  _ __  
|  _ < / _` / __| __| |/ _ \| '_ \ 
| |_) | (_| \__ \ |_| | (_) | | | |
|____/ \__,_|___/\__|_|\___/|_| |_|

*/

module "bastion-ec2" {

  source = "./../terraform-aws-ec2-module"
  //source = "john-morsley/ec2/aws"

  name = var.bastion_name

  associate_public_ip_address = true

  ami           = data.aws_ami.amazon-linux-2.id
  user          = var.bastion_user
  instance_type = var.bastion_instance_type

  vpc_id = module.aurora-vpc.id

  subnet_id = module.aurora-vpc.public_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]

  enable_ssh = true
  
}
