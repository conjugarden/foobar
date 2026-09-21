terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo hello from null_resource foobar"
  }
}

resource "null_resource" "example_asdf" {
  provisioner "local-exec" {
    command = "echo hello from null_resource asdf"
  }
}
