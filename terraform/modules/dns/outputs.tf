# terraform/modules/dns/outputs.tf

output "app_url" {
  description = "The URL for the deployed web application."
  value       = "https://${var.app_subdomain}.${var.domain_name}"
}

output "api_url" {
  description = "The URL for the deployed API."
  value       = "https://${var.api_subdomain}.${var.domain_name}"
}
