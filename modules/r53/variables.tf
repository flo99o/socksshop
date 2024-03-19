variable "tag" {
  type        = string
  description = "Cette variable me permet de définir un tag à utiliser pour mon instance"
  default     = "matthieu"
}

variable "availability_zone" {
  type        = list(string)
  description = "Définit l'availability zone de l'ebs"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "database_name" {
  type        = string
  description = "Définit l'availability zone de l'ebs"
  default     = "mydb"
}

variable "master_username" {
  type        = string
  description = "Définit l'availability zone de l'ebs"
  default     = "foo"
}

variable "master_password" {
  type        = string
  description = "Définit l'availability zone de l'ebs"
  default     = "bar"
}