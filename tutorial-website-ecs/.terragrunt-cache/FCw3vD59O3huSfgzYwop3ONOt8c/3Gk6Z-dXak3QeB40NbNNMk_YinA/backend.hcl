# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
    backend "s3" {
        bucket = "mysom-terraform-remote-state"
        key    = "tutorial-website-ecs/terraform.tfstate"
        region = "us-east-2"
    }
}