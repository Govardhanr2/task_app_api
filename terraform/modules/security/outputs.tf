# terraform/modules/security/outputs.tf

output "alb_sg_id" {
  description = "The ID of the ALB security group."
  value       = aws_security_group.alb.id
}

output "ec2_instance_sg_id" {
  description = "The ID of the EC2 instance security group."
  value       = aws_security_group.ec2_instance.id
}
