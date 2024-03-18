output "ebs_id" {
  value       = aws_ebs_volume.ebs.id
  description = "Cette output vous renvoie l'ID de l'EBS"
}
