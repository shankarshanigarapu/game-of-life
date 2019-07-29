module "asg" {
  source = "../../modules/asg"
  name_prefix          = "${var.name_prefix}"
  image_id             = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  key_name             = "${var.key_name}"
  availability_zones   = "${var.availability_zones}"
}

  
module "rds" {
  source = "../../modules/rds"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.name}"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "${var.parameter_group_name}"
  
 
}

module "dynamodb" {
  source = "../../modules/dynamodb"
  
}


module "s3withkms" {
  source = "../../modules/s3withkms"
  
}
