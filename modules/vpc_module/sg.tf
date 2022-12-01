#Security group
resource "aws_security_group" "security_group_fp" {
  name        = "${var.project}_security_group"
  description = "Security group for ${var.project}"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description = "SSH from my IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  ingress {
    description = "SSH inside VPC only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  ingress {
    description = "HTTP to all"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Jenkins port 8080 from my IP only"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  ingress {
    description = "Jenkins port 8080 inside VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  ingress {
    description = "Nexus port 8081 from my IP only"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  ingress {
    description = "Nexus port 8081 nside VPC"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  ingress {
    description = "Nexus port 8081 nside VPC"
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  ingress {
    description = "Java app port 8096 nside VPC"
    from_port   = 8095
    to_port     = 8095
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  ingress {
    description = "Java app port 8096 nside VPC"
    from_port   = 8096
    to_port     = 8096
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  ingress {
    description = "Nexus docker port 5000 inside VPC"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform_vpc.cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.project}_security_group"
  }
}
