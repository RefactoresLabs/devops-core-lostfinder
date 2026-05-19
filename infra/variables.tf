variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Nome da chave SSH"
}

variable "ami_id" {
  description = "AMI Ubuntu"
}

variable "project_name" {
  default = "lostfinder"
}