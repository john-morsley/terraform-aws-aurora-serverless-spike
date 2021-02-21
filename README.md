# An Aurora Cluster in AWS via Terraform

This is an attempt to create a serverless Aurora cluster in AWS via Terraform. 
The Aurora cluster is placed in a private subnet and accessed via a Bastion in a public subnet.

Steps:

- Create a VPC, with 1 public subnet and 2 private subnets
- Create bastion
- Create a security group for SSH access for the bastion
- Create a security group for PostgeSQL access for the bastion?  
- Create Aurora cluster
- Create a security group for PostgreSQL access to Aurora that the bastion will use   
- Connect via pgAdmin

To connect with pgAdmin:

 1 - Open pgAdmin
 2 - Log in
 3 - Hit 'Add New Server'
 4 - Give it 'Name', i.e. 'aurora-spike'
 5 - Hit the 'Connection' tab
 6 - For 'Host name/address' use the output 'aurora_server_endpoint'
 7 - For 'Username' use the output 'master_username'
 8 - For 'Password' use the output 'mater_password'
 9 - Click 'Save password?'
10 - Hit the 'SSH Tunnel' tab
11 - Toggle 'Use SSH tunneling' to 'Yes'
12 - For 'Tunnel host' use the output 'bastion_public_ip'
13 - Leave 'Tunnel port' as '22'
14 - For 'Username' use 'ec2-user'
15 - Toggle 'Authentication' to 'Identity file'
16 - For 'Identity file' browse to the location of the 'pem' file
17 - Hit the 'Advanced' tab
18 - Increase 'Connection timeout', i.e. 90
19 - Hit 'Save'

You should be connected to your Aurora cluster! :)
