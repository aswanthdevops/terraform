resource "aws_s3_bucket" "tf" {
  bucket = "my-tf-log-bucketq" # BucketName
  acl    = "private"       # BuckerACL   
  versioning {
    enabled = true
  }
  tags = { for k, v in merge({ resource = "aws_s3_bucket" }, var.tags) : k => lower(v) }
}

resource "aws_s3_bucket_object" "tf" {
  key    = "index.zip"
  source = "index.zip"
  bucket = aws_s3_bucket.tf.id
  # server_side_encryption = "AES256"
}

resource "aws_s3_bucket_public_access_block" "tf" {
  bucket = aws_s3_bucket.tf.id
  block_public_acls   = true
  block_public_policy = true
}