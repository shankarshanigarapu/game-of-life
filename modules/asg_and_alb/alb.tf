


data "aws_vpc" "vpc" {

}


resource "aws_alb" "test" {
  name               = "testlb"
  internal           = false
  load_balancer_type = "application"
  subnets            = "${var.subnets}"
  security_groups    = ["${aws_security_group.ALLPORTS_ASG_DEV.id}"]
  depends_on =["aws_launch_configuration.launch_conf"]
 
}


resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.test.arn}"
  port              = "443"
  ssl_policy        = "${var.ssl_policy}"
  protocol          = "HTTPS"
  certificate_arn   = "${var.certificate_arn}"
  depends_on = ["aws_alb.test","aws_alb_target_group.albtarget"]
   default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.albtarget.arn}"
  }

  }



resource "aws_alb_target_group" "albtarget" {
  name     = "albtarget"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${data.aws_vpc.vpc.id}"
  depends_on = ["aws_alb.test"]
  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}