output "elb_id" {
  value       = aws_elb.web_elb.id
  description = "Cette output vous renvoie l'ID du load balancer"
}
