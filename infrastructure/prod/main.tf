# Exemplo usando AWS (pode ser adaptado para DigitalOcean/GCP)
provider "aws" {
  region = "us-east-1"
}

# 1. Instância para rodar o Docker (Frontend + Backend + Observabilidade)
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu Server
  instance_type = "t3.medium"

  tags = {
    Name = "App-Production-Server"
  }

  # Aqui entraria o user_data para instalar Docker e Nginx
}

# 2. Segurança (Security Group para Nginx 80/443 e Datadog)
resource "aws_security_group" "web_sg" {
  name = "allow_web_traffic"

  ingress {
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. Output para configurar o Supabase
# Nota: O Supabase costuma ser gerenciado via Console ou Provider próprio
output "vps_ip" {
  value = aws_instance.app_server.public_ip
}