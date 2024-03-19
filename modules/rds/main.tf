resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = "aurora-cluster-sockshop"
  engine                  = "aurora-postgresql"
  availability_zones      = var.availability_zone
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"    
}
