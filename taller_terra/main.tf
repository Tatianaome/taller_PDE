#Declarar un proveedor de nube
provider "aws" {
    region = "us-east-1"
    profile = "administrador"
}

#Recursos declaraciones de componentes

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}


resource "aws_instance" "EC2-backend" {
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-backend"
  }
}

resource "aws_instance" "EC2-bd" {
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-bd"
  }
}

resource "aws_instance" "EC2-web" {
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

     tags = {
     Name = "EC2-web"
  }
}


#Consulta de Datos (Opcional)

#Ciclo de vida Terraform 

#Inicializar: terraform init

#Aplicar el diseño: terraform apply

#Distribuir infraestructura: terraform destroy 