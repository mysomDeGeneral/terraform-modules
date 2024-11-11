variable "region" {
  description = "AWS region"
  type        = string

}

variable "profile" {
  description = "AWS profile"
  type        = string

}

variable "sqs_queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "sqs_queue_delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed"
  type        = number

}

variable "sqs_queue_max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it"
  type        = number

}

variable "sqs_queue_message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message"
  type        = number

}

variable "sqs_queue_receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive"
  type        = number

}

variable "sqs_queue_visibility_timeout_seconds" {
  description = "The visibility timeout for the queue"
  type        = number

}

variable "sqs_queue_sqs_managed_sse_enabled" {
  description = "Whether server-side encryption is enabled"
  type        = bool

}

variable "sqs_principal_arn" {
  description = "The ARN of the principal"
  type        = string

}


