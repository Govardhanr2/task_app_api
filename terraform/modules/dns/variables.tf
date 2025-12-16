# terraform/modules/dns/variables.tf

variable "domain_name" {
  description = "The root domain name."
  type        = string
}

variable "hosted_zone_id" {
  description = "The ID of the Route 53 hosted zone for the domain."
  type        = string
}

variable "app_subdomain" {
  description = "Subdomain for the user-facing application."
  type        = string
}

variable "api_subdomain" {
  description = "Subdomain for the backend API."
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  type        = string
}

variable "alb_zone_id" {
  description = "The Zone ID of the Application Load Balancer."
  type        = string
}
