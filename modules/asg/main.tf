
resource "aws_launch_configuration" "launch_conf" {
  name_prefix   = "${var.name_prefix}"
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  
}

resource "aws_autoscaling_policy" "aws_as_policy" {
  name                   = "scalingpolicy"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
}
resource "aws_autoscaling_group" "asg" {
  name                 = "autoscalinggroup"
  launch_configuration = "${aws_launch_configuration.launch_conf.name}"
  min_size             = 1
  max_size             = 2
  availability_zones   =["${var.availability_zones}"]
  tags = [{
       key                 = "Env"
       value               = "${var.environment_tag}"
       propagate_at_launch = true
    }]

}
