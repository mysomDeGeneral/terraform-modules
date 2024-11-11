# configure  aws provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "terraform-user"
}

module "vpc" {
  source = "../rds-vpc"
}

module "iam_role" {
  source = "../iam_role"
}

module "parameter_group" {
  source = "../parameter_group"
}

module "kms_key" {
  source = "../kms_key"

}
# data "aws_secretsmanager_secret" "db_password" {
#   name = var.secret_name

# }

module "secret_manager" {
  source      = "../secret_manager"
  db_password = var.password

}
data "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id = module.secret_manager.secret_id
}

# create rds
resource "aws_db_instance" "rds" {
  depends_on = [data.aws_secretsmanager_secret_version.db_password_version]

  identifier        = var.identifier
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  username          = var.username
  password          = data.aws_secretsmanager_secret_version.db_password_version.secret_string

  vpc_security_group_ids = [module.vpc.rds_security_group_id]
  db_subnet_group_name   = module.vpc.rds_subnet_group_name

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier

  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = module.iam_role.aws_iam_role_arn

  performance_insights_enabled = var.performance_insights_enabled

  storage_encrypted = true

  kms_key_id = module.kms_key.rds_kms_key_arn

  parameter_group_name = module.parameter_group.parameter_group_name

  multi_az = true
  tags = {
    Name = "rds"
  }
}