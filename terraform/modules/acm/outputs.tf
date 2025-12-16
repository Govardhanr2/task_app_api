# terraform/modules/acm/outputs.tf

output "certificate_arn" {
  description = "The ARN of the validated ACM certificate."
  value       = aws_acm_certificate_validation.main.certificate_arn
}
