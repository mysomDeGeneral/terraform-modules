resource "aws_kms_key" "kms_key" {
  description = "KMS key for RDS encryption"
  deletion_window_in_days = 30

  tags = {
    Name = "RDS KMS key"
  }
}