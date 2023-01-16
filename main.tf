provider "aws" {
  shared_config_files      = ["~/Desktop/conf"]
  shared_credentials_files = ["~/Desktop/mycredintial"]
  profile                  = "default"
}

resource "aws_s3_bucket" "bucket-11-lab" {
  bucket = "bucket-11-lab"
  
}

resource "aws_s3_bucket" "bucket-22-lab" {
  bucket = "bucket-22-lab"
  
}
