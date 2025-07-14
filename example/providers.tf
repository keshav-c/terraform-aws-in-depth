terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "The AWS Region to connect and run tests in."
}

provider "aws" {
  region = var.region
}
