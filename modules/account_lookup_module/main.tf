#AWS account id for iam
#data "aws_caller_identity" "current" {}

#Detect my ip for sg
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

#Detect lasest amazon linux ami
data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}
