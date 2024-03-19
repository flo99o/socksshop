module "servers" {
  source        = "../../modules/ec2"
  sg            = ["${module.security.sg_id}"]
  instance_type = var.instance_type
  tag           = var.tag
}

module "ip" {
  source = "../../modules/eip"
}

module "security" {
  source = "../../modules/sg"
}

module "volume" {
  source = "../../modules/ebs"
}

module "load_balancer" {
  source = "../../modules/elb"
}

module "backup" {
  source = "../../modules/backup"
}

module "cloudfront" {
  source = "../../modules/cloudfront"
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"
}

module "nat" {
  source = "../../modules/nat"
}

module "route53" {
  source = "../../modules/r53"
}

module "database" {
  source = "../../modules/rds"
}

module "vpc" {
  source = "../../modules/vpc"
}

#Création de la relation entre l'instance et l'eip
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.servers.instance_id
  allocation_id = module.ip.eip_id
}

#Création de la relation entre l'instance et l'ebs
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.volume.ebs_id
  instance_id = module.servers.instance_id
}

#Création de la relation entre l'instance et l'ebs
resource "aws_elb_attachment" "elb_assoc" {
  elb = module.load_balancer.elb_id
  instance = module.servers.instance_id
}