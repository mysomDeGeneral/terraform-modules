# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "mysom-terraform-remote-state"
    key       = "tutorial-website-ecs.tfstate"
    region    = "us-east-2"
    profile   = "terraform-user"
  }
}