# terraform/variables.tf

variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "ap-south-1"
}

variable "aws_ami" {
  description = "The AMI to use for the EC2 instance."
  type        = string
  default     = "ami-06f2f23b8b95143c4" # Amazon Linux 2 AMI (HVM), SSD Volume Type for ap-south-1
}

variable "aws_key_name" {
  description = "The name of your AWS key pair for SSH access."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t3.micro"
}

variable "domain_name" {
  description = "The root domain name for which the Route 53 hosted zone exists."
  type        = string
}

variable "hosted_zone_id" {
  description = "The ID of the Route 53 hosted zone for the domain."
  type        = string
}

variable "app_subdomain" {
  description = "Subdomain for the user-facing application."
  type        = string
  default     = "ec2app"
}

variable "api_subdomain" {
  description = "Subdomain for the backend API."
  type        = string
  default     = "ec2api"
}

variable "repo_url" {
  description = "The URL of the git repository to be deployed."
  type        = string
}