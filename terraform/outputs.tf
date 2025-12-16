# terraform/outputs.tf

output "app_url" {
  description = "The URL for the deployed web application."
  value       = module.dns.app_url
}

output "api_url" {
  description = "The URL for the deployed API."
  value       = module.dns.api_url
}