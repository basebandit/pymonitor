resource "aws_s3_bucket" "sysmon_tfstate_bucket" {
  bucket        = var.s3_tfstate_bucket.bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "sysmon_tfstate_bucket_versioning" {
  bucket = aws_s3_bucket.sysmon_tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
