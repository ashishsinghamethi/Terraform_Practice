

resource "aws_security_group" "sg1" {
    name = "first_sg1"

ingress{
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
}
}

resource "aws_lb" "application-lb" {
    name = "application-lb"
    subnets = [ "subnet-001ff6af5e284bef7","subnet-024740b1e200b05dc" ]
    internal = false
    load_balancer_type = "application"
    enable_deletion_protection = false
    enable_http2 = true
    security_groups = [ aws_security_group.sg1.id ]
}

resource "aws_lb_target_group" "tg2" {
    name = "tg2"
    port = "80"
    protocol = "HTTP"
    vpc_id = "vpc-029380364762c6f5b" 
}

resource "aws_lb_target_group_attachment" "tg2-attach-1" {
    target_group_arn = aws_lb_target_group.tg2.arn
    target_id = "i-0c1e37f34898d5bee"
}

resource "aws_lb_target_group_attachment" "tg2-attach-2" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id = "i-0ea67388a565c549c"
}
