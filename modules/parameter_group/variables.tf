variable "db_pmg_name" {
  description = "The name of the parameter group"
  type        = string
  default = "rds-pg"
}

variable "db_pmg_family" {
  description = "The family of the parameter group"
  type        = string
  default = "postgres16"
}