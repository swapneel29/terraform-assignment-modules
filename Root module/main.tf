provider "aws" {
    region="ap-south-1"
}

module "vpc"{
    source="./modules/vpc"
}

module "ec2"{
    source="./modules/ec2"
    pemfile="devops1"
    subnet1-id=module.vpc.subnet-id
    securitygroup-id=module.vpc.security-group-id
}

# Create S3 bucket to store remote state file #
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "swap26062021-assignment2"
}

# Create a dynamodb table for locking the state file #
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}