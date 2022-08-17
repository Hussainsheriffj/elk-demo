terraform {
  backend "s3" {
    bucket         = "talent-academy-hussainsheriff-lab-tfstates1"
    key            = "talent-academy/ta-vpc-training/terraform.tfstates"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}
