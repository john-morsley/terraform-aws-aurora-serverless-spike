/*
  _____                      _ _         
 / ____|                    (_) |        
| (___   ___  ___ _   _ _ __ _| |_ _   _ 
 \___ \ / _ \/ __| | | | '__| | __| | | |
 ____) |  __/ (__| |_| | |  | | |_| |_| |
|_____/ \___|\___|\__,_|_|  |_|\__|\__, |
                                    __/ |
                                   |___/  
*/

resource "aws_security_group" "aurora-application-access" {

  name        = "aurora-application-access-sg"
  description = "For Aurora application access."
  vpc_id      = module.aurora-vpc.id

  tags = {
    Name = "aurora-application-access-sg"
  }

}

resource "aws_security_group_rule" "aurora-allow_access" {

  security_group_id = aws_security_group.aurora-application-access.id

  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = module.bastion-ec2.ssh_security_group_id

}