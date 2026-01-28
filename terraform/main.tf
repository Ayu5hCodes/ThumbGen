provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "thumbgen_ec2" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
  key_name      = "thynktech"

  tags = {
    Name = "thumbgen-server"
  }
}

resource "aws_security_group" "thumbgen_sg" {
  name = "thumbgen-sg"

  ingress {
    from_port   = 5173
    to_port     = 5173
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
