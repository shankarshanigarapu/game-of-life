#GLOBAL PARAMETERS
region             = "us-east-1"
availability_zones = "us-east-1a"


#EC2 PARAMETERS
ami                = "ami-07d0cf3af28718ef8"
key_name           = "ansible_dynamic"
instance_type      = "t2.micro"
#DATABASE PARAMETERS
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
name                 = "practicedb"
username             = "root"
password             = "password"
parameter_group_name = "default.mysql5.7"
#AUTOSCALING GROUP PARAMETERS
name_prefix      =  "terraform_asg_launch"
image_id         =  "ami-07d0cf3af28718ef8"
