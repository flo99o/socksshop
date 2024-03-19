data "aws_ami" "data_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.data_ami.id
  key_name               = var.key-name
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone[0]
  vpc_security_group_ids = ["${var.sg[0]}"]
  tags = {
    Name = "ec2-${var.tag}"
  }
  #Connection SSH pour accéder a la VM pour exécuter les commandes remote-exec
  connection {
    type        = "ssh"
    user        = "ec2-user" # Le nom d'utilisateur par défaut pour l'AMI Amazon Linux
    private_key = <<-EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAk3uxn/JH57FkzTJ42w1yNOO5F/EGS8LAvX8AWvbzSlUk4UR2
UlWZepN/kG3C3o+0O9yDlZmnOAu++7eQSKruUX2ap2NSQQXMzolH7uWmFRxGwsMJ
LLpf0qjgrGGYUnjA5nBYJqDIZVDZIk56mcTOKFrYKzWBhP1EYNfDFoiCKKmyrgrT
CygVw2PLR8PxzVgnrFS79XGlkjmXdMhYn2k/Kd3RtSkQ2OLbBatllcwFbV3FkzgG
JD48kiMDxEmatvKHBFDvfbq4mRfYdvyBMCuxvkFxkurdUpXYhFSCpMBrbTP2AHvs
uvKZ79cGQs4aVUEvuH+oKRUEgBroslsDz79g1QIDAQABAoIBAAYox01HwAsEFJKh
RfzX/eoJjKRcU4f8dTI0yJ4D7DsxfR3PTyW3H3bIDC7K9rV2yO8rEW/BAAPOMcav
bt4qDVPn6/qLolbG2DvT7eYjPyFokef2Xz639eKFXQS1+rePBXdaP8Q1OMlKbBcL
sgEUAAwdZyO+007riNyGhkY9oznxdBcgDuSP2NmALV2q83zk/ykka9TZtI+YuaQy
dKFtLOzqYx17xEwqLiOA2zBd1w+BtNw1PI/e9nvMBD/E6Zvp8i4iEoXiYBUtWhOE
1lJuFDFHS6VO8TFbQiNDEsEHSxEOYc0jRmrRi5J59NQsHQBxNimY7lxWd6oxU7lx
A0iRkWECgYEA0ZV1HqwL09CTsyu7TKEPZO7adFe0Zec6oJE/NOaRAytEMO8m3OcQ
9Ful8CwXl7UtuADHmwbm5vSKvkO8hmObIs91U0Ib8DjKef9xShIxArxd3gkx/t8x
lkVem7SnzIIHVIlB0eUAL6mJGuMuMBswvWnAqHeyb7nUUeHNo8siFQkCgYEAtCVi
ilEywrYDjMJ+M6NmZ9AhPR10iPg6PfswxFRQlBga+ztnVSe+avMSNTp3x3qSOnnU
tRbWmYsHSnq8pwBrTiAR5EHlfy6AggWI/EKDXujeuD1wDagyFC3TA0TVLK6d0a4f
rTTLAEy1bpagpZ14TiDQBpbWd+eTA22ebH9ADG0CgYB/sNiXpGjcV3L1sco+yM4x
R5lPUvQ1NekxVO02lNd7H8w/KCX8ZsecqY3zQ1noc1l0hv0WBeF+izVQ8MIW+u7V
CaLI5DlTZbZvF+P1Jho4OX3TPrT4PRHgJUmcAjhN0FcY+Tth32z6nQdMm2dTpe1P
KfRYb/0GNykV7kY06hlMyQKBgAelpp80fzEgxNnOz8ilYQ17Gk4b1/yQfPhwl0te
QOVoeIy9os9Mlpq3osg7qSYAoAB3d34QcB+odTDGMQftzqBMYDYOTg2uDap3Ta9X
q3f17q5nfUA3KZkNsO1smJgC+ZQTDikuGofyuajuH/enzZmTbwE4mfYREH6OwrDc
Xf2pAoGASVcI+VjzFqBBn8UY8T9D7Yg4ZPX3yzrbZWqQ9WLuKywhjKSp10Y9qvwg
XVXCi/d16acSSVX9xjmw9ezD9nsmr/n6A11e9j57v/amTc1lX84329olwKJtF6fs
GDW7WB80BnjH3v9AxfSpGqunVxIR+xjO1hGXSmt7whKM+4xCXb0=
-----END RSA PRIVATE KEY-----
EOF
    host        = self.public_ip
  }
  #Installation de nginx sur la VM
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
  #Execution d'une commande en local
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}, l'ID est ${self.id} et la zone de disponibilité est ${self.availability_zone}  >> info_ec2.txt"
  }

}