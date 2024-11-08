include "root" {
    path = "${find_in_parent_folders("common.hcl")}"
}

terraform {
    source = "../modules/vpc"

    extra_arguments "custom_vars" {
        commands = [
            "apply",
            "plan",
            "import",
            "push",
            "refresh"
        ]

        required_var_files = [
            "terraform.tfvars"
        ]
    }
}


# remote_state {
#     backend = "s3"
#     config = {
#         bucket = "mysom-terraform-remote-state"
#         key    = "tutorial-website-ecs.tfstate"
#         region = "us-east-2"
#         }
#     }