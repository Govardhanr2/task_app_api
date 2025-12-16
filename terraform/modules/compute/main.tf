# terraform/modules/compute/main.tf

resource "aws_instance" "main" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.ec2_instance_sg_id]
  key_name      = var.aws_key_name

  root_block_device {
    volume_size = 20
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y git docker
              fallocate -l 2G /swapfile
              chmod 600 /swapfile
              mkswap /swapfile
              swapon /swapfile
              echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
              service docker start
              usermod -a -G docker ec2-user
              curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
              su - ec2-user <<'EOS'
              cd /home/ec2-user
              git clone ${var.repo_url}
              cd task_app_api/
              sed -i '/platform: linux\/arm64/d' docker-compose.yml
              sed -i "s|REACT_APP_API_URL=http://localhost:8080|REACT_APP_API_URL=https://${var.api_subdomain}.${var.domain_name}|g" docker-compose.yml
              sudo /usr/local/bin/docker-compose pull redis
              sudo /usr/local/bin/docker-compose up -d --build
              EOS
              EOF

  tags = {
    Name = "main-instance"
  }
}
