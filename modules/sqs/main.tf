terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

}

resource "aws_sqs_queue" "sqs_queue" {
  name                       = var.sqs_queue_name
  delay_seconds              = var.sqs_queue_delay_seconds
  max_message_size           = var.sqs_queue_max_message_size
  message_retention_seconds  = var.sqs_queue_message_retention_seconds
  receive_wait_time_seconds  = var.sqs_queue_receive_wait_time_seconds
  visibility_timeout_seconds = var.sqs_queue_visibility_timeout_seconds
  sqs_managed_sse_enabled    = var.sqs_queue_sqs_managed_sse_enabled

}

data "aws_iam_policy_document" "sh_sqs_policy" {
  statement {
    sid    = "SQSSendReceiveMessage"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.sqs_principal_arn]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]

    resources = [
      aws_sqs_queue.sqs_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.sqs_queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy.json

}