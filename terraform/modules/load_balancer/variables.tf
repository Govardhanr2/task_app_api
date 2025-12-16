# terraform/modules/load_balancer/variables.tf

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of IDs of the public subnets where the ALB will be deployed."
  type        = list(string)
}

variable "alb_sg_id" {
  description = "The ID of the security group for the ALB."
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate to use for HTTPS listener."
  type        = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance to register with target groups."
  type        = string
}

variable "domain_name" {
  description = "The root domain name."
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
