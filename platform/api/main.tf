terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
  backend "s3" {
    bucket                      = "tfstate"
    key                         = "conjugarden/platform/api/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "https://sg-demo.tailfa28d.ts.net:8443"
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

locals {
  rev = "1"
}

resource "random_pet" "api" {
  keepers = { rev = local.rev }
}

resource "null_resource" "api" {
  triggers = { pet = random_pet.api.id, rev = local.rev }
}
