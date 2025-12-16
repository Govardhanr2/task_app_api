# terraform/modules/compute/variables.tf

variable "aws_ami" {
  description = "The AMI to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of a public subnet where the EC2 instance will be launched."
  type        = string
}

variable "ec2_instance_sg_id" {
  description = "The ID of the security group for the EC2 instance."
  type        = string
}

variable "aws_key_name" {
  description = "The name of your AWS key pair for SSH access."
  type        = string
}

variable "repo_url" {
  description = "The URL of the git repository to be deployed."
  type        = string
}

variable "domain_name" {
  description = "The root domain name for which the Route 53 hosted zone exists."
  type        = string
}

variable "api_subdomain" {
  description = "Subdomain for the backend API."
  type        = string
}
