variable "tag" {
  type        = string
  description = "Cette variable me permet de définir un tag à utiliser pour mon instance"
  default     = "matthieu"
}

variable "availability_zone" {
  type        = list(string)
  description = "Définit l'availability zone de l'ebs"
  default     = ["us-east-1a"]
}

variable "taille_ebs" {
  type        = number
  description = "Définit la taille de l'ebs"
  default     = 2
}