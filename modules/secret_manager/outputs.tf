output "secret_id" {
  description = "The value of the secret"
  value       = aws_secretsmanager_secret.db_password.arn
}