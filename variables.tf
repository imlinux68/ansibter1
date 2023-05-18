variable "myvpcvar" { 
    type = string
    default = "100.0.0.0/16"
}

variable "subnet_cidr" {
    type = string
    default = "100.0.1.0/24"
}

variable "route_dest_block" {
    type = string
    default = "0.0.0.0/0"
}

variable "ec2-type" {
    type = string
    default = "t3.micro"
}

variable "alami" {
    type = string
    default = "ami-01acac09adf473073"
}

variable "vol_size" {
    type = string
    default = "10"
}