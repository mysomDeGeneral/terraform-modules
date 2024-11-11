variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "storage_type" {
  description = "value of storage type"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string

}

variable "instance_class" {
  description = "The instance type to use"
  type        = string
}

variable "username" {
  description = "The database username"
  type        = string
}

variable "password" {
  description = "The database password"
  type        = string
}

variable "backup_retention_period" {
  description = "The backup retention period"
  type        = number
}

variable "backup_window" {
  description = "The backup window"
  type        = string
}

variable "maintenance_window" {
  description = "The maintenance window"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
}

variable "final_snapshot_identifier" {
  description = "The final snapshot identifier"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string

}


variable "monitoring_interval" {
  description = "The monitoring interval"
  type        = number
}

variable "performance_insights_enabled" {
  description = "Enable performance insights"
  type        = bool
}

variable "identifier" {
  description = "The identifier of the RDS instance"
  type        = string

}