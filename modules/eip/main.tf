# Création de l'IP publique
resource "aws_eip" "matthieu_eip" {
  domain = "vpc"
  tags = {
    Name = "eip-${var.tag}"
  }
}