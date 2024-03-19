resource "aws_route53_record" "web_domain" {
  zone_id = "votre_zone_id_route53"
  name    = "votre_domaine"
  type    = "A"
  alias {
    name                   = aws_elb.web_elb.dns_name
    zone_id                = aws_elb.web_elb.zone_id
    evaluate_target_health = true
  }
}