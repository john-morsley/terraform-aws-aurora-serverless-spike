/*
  ____        _               _       
 / __ \      | |             | |      
| |  | |_   _| |_ _ __  _   _| |_ ___ 
| |  | | | | | __| '_ \| | | | __/ __|
| |__| | |_| | |_| |_) | |_| | |_\__ \
 \____/ \__,_|\__| .__/ \__,_|\__|___/
                 | |                  
                 |_|                */

//output "availability_zones" {
//  value = data.aws_availability_zones.available
//}

output "master_password" {
  value = random_password.master_password.result
}

output "master_username" {
  value = var.master_username
}

output "aurora_endpoint" {
  value = aws_rds_cluster.this.endpoint
}

output "aurora_server_port" {
  value = aws_rds_cluster.this.port
}

output "bastion_ssh_command" {
  value = module.bastion-ec2.ssh_command
}

output "bastion_public_ip" {
  value = module.bastion-ec2.public_ip
}

output "bastion_key" {
  value = "${abspath(path.module)}/keys/${module.bastion-ec2.key_name}.pem"
}