output "thanos_s3_arn" {
  value       = module.thanos_s3.bucket_arn
  description = "Thanos S3 bucket ARN"
}

output "thanos_s3_id" {
  value       = module.thanos_s3.bucket_id
  description = "Thanos S3 bucket id (name)"
}

output "thanos_s3_region" {
  value       = module.thanos_s3.bucket_region
  description = "Thanos S3 bucket region"
}

output "thanos_kms_arn" {
  value       = module.thanos_key.key_arn
  description = "Thanos KMS ARN"
}

output "thanos_sa_role_arn" {
  value = try(aws_iam_role.thanos[0].arn, {})
  description = "Thanos Service Account ARN"
}
