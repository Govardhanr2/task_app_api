# terraform/main.tf

provider "aws" {
  region = var.aws_region
}

# 1. Networking Module
module "networking" {
  source = "./modules/networking"
  aws_region = var.aws_region
}

# 2. Security Module
module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

# 3. ACM Module (Certificate)
module "acm" {
  source = "./modules/acm"
  domain_name = var.domain_name
  hosted_zone_id = var.hosted_zone_id
  app_subdomain = var.app_subdomain
  api_subdomain = var.api_subdomain
}

# 4. Compute Module (EC2 Instance)
module "compute" {
  source = "./modules/compute"
  aws_ami = var.aws_ami
  instance_type = var.instance_type
  public_subnet_id = module.networking.public_subnet_ids[0] # Launch in the first public subnet
  ec2_instance_sg_id = module.security.ec2_instance_sg_id
  aws_key_name = var.aws_key_name
  repo_url = var.repo_url
  domain_name = var.domain_name
  api_subdomain = var.api_subdomain
}

# 5. Load Balancer Module
module "load_balancer" {
  source = "./modules/load_balancer"
  vpc_id = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  alb_sg_id = module.security.alb_sg_id
  certificate_arn = module.acm.certificate_arn
  instance_id = module.compute.instance_id
  domain_name = var.domain_name
  app_subdomain = var.app_subdomain
  api_subdomain = var.api_subdomain
}

# 6. DNS Module (Route 53 Records)
module "dns" {
  source = "./modules/dns"
  domain_name = var.domain_name
  hosted_zone_id = var.hosted_zone_id
  app_subdomain = var.app_subdomain
  api_subdomain = var.api_subdomain
  alb_dns_name = module.load_balancer.alb_dns_name
  alb_zone_id = module.load_balancer.alb_zone_id
}
