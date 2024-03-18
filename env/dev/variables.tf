variable "instance_type" {
  type        = string
  description = "Cette variable permet de définir le type de l'instance"
  default     = "t2.nano"

}

variable "tag" {
  type        = string
  description = "Cette variable me permet de définir un tag à utiliser pour mon instance"
  default     = "dev-matthieu"
}