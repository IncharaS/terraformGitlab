terraform {
  backend "s3" {
    bucket = "backendbucket986456"
    key = "state"
    region = "us-east-1"
    dynamodb_table = "state-lock"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}