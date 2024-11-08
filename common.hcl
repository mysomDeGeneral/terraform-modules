generate "backend" {
    path = "backend.hcl"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
terraform {
    backend "s3" {
        bucket = "mysom-terraform-remote-state"
        key    = "${path_relative_to_include()}/terraform.tfstate"
        region = "us-east-2"
    }
}
EOF
}