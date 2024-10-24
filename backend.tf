resource "aws_s3_bucket" "mybucket" {
    bucket = "backendbucket986456"
}
  

resource "aws_s3_bucket_server_side_encryption_configuration" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    apply_server_side_encryption_by_default {

      sse_algorithm     = "AES256"
    }
  }
}
resource "aws_s3_bucket_versioning" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "statelock" {
  name             = "state-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
}
