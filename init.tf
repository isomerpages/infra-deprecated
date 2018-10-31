terraform {
  backend "s3" {
    bucket         = "isomer-terraform-state"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "isomer-terraform-state-lock-dynamo"
  }
}

// configure the github provider
provider "github" {
  organization = "isomerpages"
}
