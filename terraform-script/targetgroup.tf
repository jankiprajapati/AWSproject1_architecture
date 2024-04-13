resource "aws_lb_target_group" "targetgroup" {
  name        = "${var.name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.main.id
  health_check {
      healthy_threshold   = var.health_check["healthy_threshold"]
      interval            = var.health_check["interval"]
      unhealthy_threshold = var.health_check["unhealthy_threshold"]
      timeout             = var.health_check["timeout"]
      path                = var.health_check["path"]
      port                = var.health_check["port"]
  }
}

resource "aws_lb_target_group_attachment" "tg-attach" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.inst[0].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attach2" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.inst[1].id
  port             = 80
}
