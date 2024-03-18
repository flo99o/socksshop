resource "aws_ebs_volume" "ebs" {
  availability_zone = var.availability_zone[0]
  size              = var.taille_ebs

  tags = {
    Name = "ebs-${var.tag}"
  }
}

