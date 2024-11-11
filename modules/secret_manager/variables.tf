# variable "region" {
#   description = "AWS region"
#   type = string
# }

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

# variable "db_username" {
#   description = "Database username"
#   type        = string

# }

# variable "secret_name" {
#   description = "Name of the secret"
#   type        = string

# }