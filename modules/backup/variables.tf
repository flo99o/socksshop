variable "key-name" {
  type        = string
  description = "Cette variable permet de passer le nom de la keypair pour l'instance"
  default     = "devops-matthieu"
}

variable "instance_type" {
  type        = string
  description = "Cette variable permet de définir le type de l'instance"
  default     = null

}

variable "tag" {
  type        = string
  description = "Cette variable me permet de définir un tag à utiliser pour mon instance"
  default     = null
}

variable "sg" {
  type        = list(any)
  description = "value"
  default     = null
}

variable "availability_zone" {
  type        = list(string)
  description = "Définit l'availability zone de l'instance"
  default     = ["us-east-1a"]
}
