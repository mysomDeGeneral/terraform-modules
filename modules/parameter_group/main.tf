resource "aws_db_parameter_group" "db_pmg" {
  name = var.db_pmg_name
  family = var.db_pmg_family

  parameter {
    name = "max_connections"
    value = "200"
    apply_method = "pending-reboot"
  }
}
