variable "access_key" {
    type = string
}

variable "secret_key" {
    type = string
}

variable "token" {
    type = string
}

terraform {
    cloud {
        organization = "ambrosia-serve"

        workspaces {
            name = "postech-workspace"
        }
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"

    access_key = var.access_key
    secret_key = var.secret_key
    token      = var.token

    default_tags {
        tags = {
            Environment = "Production"
            Owner       = "Grupo-40"
            Project     = "Ambrosia Serve"
        }
    }
}

