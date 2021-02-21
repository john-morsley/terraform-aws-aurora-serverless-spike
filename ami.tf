/*        __  __ _____     
    /\   |  \/  |_   _|    
   /  \  | \  / | | |  
  / /\ \ | |\/| | | | 
 / ____ \| |  | |_| |_
/_/    \_\_|  |_|_____|

*/

# Amazon Machine Image

# Amazon Linux 2...
data "aws_ami" "amazon-linux-2" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}