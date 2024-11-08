variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "CIDR Block for the VPC"
  type        = string

}

variable "subnet_a_cidr_block" {
  default     = "10.0.1.0/24"
  description = "CIDR Block for subnet a"
  type        = string
}

variable "subnet_b_cidr_block" {
  default     = "10.0.2.0/24"
  description = "CIDR Block for subnet b"
  type        = string
}


