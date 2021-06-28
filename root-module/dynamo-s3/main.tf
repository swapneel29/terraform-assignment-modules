provider "aws"{
    region="ap-south-1"
}
# Create S3 bucket to store remote state file #
resource "aws_s3_bucket" "s3test" {
  bucket = "swap26062021-assignment"
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
  }