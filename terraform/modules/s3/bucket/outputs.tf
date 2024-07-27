output "bucket_name" {
  description = "S3 Bucket name"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN of S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "bucket_id" {
  description = "ID of S3 bucket"
  value       = aws_s3_bucket.this.id
}
