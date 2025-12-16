# terraform/modules/security/variables.tf

variable "vpc_id" {
  description = "The ID of the VPC where the security groups will be created."
  type        = string
}
