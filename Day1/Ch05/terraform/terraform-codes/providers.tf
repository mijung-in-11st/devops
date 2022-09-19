# terraform init -backend-config="access_key=AKIATW5PBYLEGOEBPINW" -backend-config="secret_key=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" -backend-config="region=ap-southeast-1" --reconfigure

terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "skt-kmj-s3-bucket-tfstate"
    key = "terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "skt-kmj-s3-ddb-tflock"
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
  profile = "skt-user02"

  # access_key = "AKIATW5PBYLEGOEBPINW"
  # secret_key = "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"
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-southeast-1a","ap-southeast-1c"]
}

