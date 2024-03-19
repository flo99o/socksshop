resource "aws_elb" "web_elb" {
  name               = "web_elb"
  listener {
    instance_port     = var.instance_port
    instance_protocol = "HTTP"
    lb_port           = var.lb_port
    lb_protocol       = "HTTP"
  }

  # Ajoutez d'autres configurations comme le(s) port(s) et le(s) protocole(s) utilisé(s)
}