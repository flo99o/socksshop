output "instance_id" {
  value       = aws_instance.ec2.id
  description = "Cette output vous renvoie l'ID de l'instance ec2"
}
