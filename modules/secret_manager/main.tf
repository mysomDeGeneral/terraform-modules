terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

# provider "aws" {
#   region = var.region
#   profile = "terraform-user"
# }

resource "random_pet" "db_password_name" {
  length = 2
}

resource "aws_secretsmanager_secret" "db_password" {
  name = "db-password-${random_pet.db_password_name.id}"
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = var.db_password

}