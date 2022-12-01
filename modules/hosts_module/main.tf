#EC2 instances for DevTools and environments


#Elastic ips

resource "aws_eip" "ansible" {
  instance = aws_instance.ansible.id
  vpc      = true
  tags = {
    Name = "${var.project}_ansible"
  }
}

resource "aws_eip" "dev_tools" {
  instance = aws_instance.dev_tools.id
  vpc      = true
  tags = {
    Name = "${var.project}_dev_tools"
  }
}

resource "aws_eip" "qa" {
  instance = aws_instance.qa.id
  vpc      = true
  tags = {
    Name = "${var.project}_qa"
  }
}

resource "aws_eip" "ci" {
  instance = aws_instance.ci.id
  vpc      = true
  tags = {
    Name = "${var.project}_ci"
  }
}

resource "aws_eip" "docker" {
  instance = aws_instance.docker.id
  vpc      = true
  tags = {
    Name = "${var.project}_docker"
  }
}


#SSH keys

resource "aws_key_pair" "ireland_managed_key" {
  key_name   = "ireland_managed_key"
  public_key = var.ireland_managed_key
}

resource "aws_key_pair" "ireland_control_key" {
  key_name   = "ireland_control_key"
  public_key = var.ireland_control_key
}


#EC2 instances

resource "aws_instance" "ansible" {
  ami                         = var.latest_ami_id
  instance_type               = "t2.large"
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ireland_control_key.key_name
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo su
hostnamectl set-hostname ansible
( echo '127.0.0.1' ansible ; cat /etc/hosts ) > /tmp/new_hosts ;
mv /tmp/new_hosts /etc/hosts -y
reboot
cat /home/mary/.ssh/ireland_managed_key > /home/ec2-user/.ssh/ireland_managed_key
chmod 0600 /home/ec2-user/.ssh/ireland_managed_key
chown ec2-user:ec2-user /home/ec2-user/.ssh/ireland_managed_key
yum update -y
amazon-linux-extras install ansible2 -y


EOF

  tags = {
    Name      = "ansible_${var.project}",
    inventory = "ansible"
  }
}

resource "aws_instance" "dev_tools" {
  ami                         = var.latest_ami_id
  instance_type               = "t2.large"
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ireland_managed_key.key_name
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo su
hostnamectl set-hostname devtools
( echo '127.0.0.1' devtools ; cat /etc/hosts ) > /tmp/new_hosts ;
mv /tmp/new_hosts /etc/hosts -y
reboot

EOF

  tags = {
    Name      = "dev_tools_${var.project}",
    inventory = "devtools"
  }
}


resource "aws_instance" "qa" {
  ami                         = var.latest_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ireland_managed_key.key_name
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo su
hostnamectl set-hostname qa
( echo '127.0.0.1' qa ; cat /etc/hosts ) > /tmp/new_hosts ;
mv /tmp/new_hosts /etc/hosts -y
reboot



EOF

  tags = {
    Name      = "qa_${var.project}",
    inventory = "qa"
  }
}


resource "aws_instance" "ci" {
  ami                         = var.latest_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ireland_managed_key.key_name
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo su
hostnamectl set-hostname ci
( echo '127.0.0.1' ci ; cat /etc/hosts ) > /tmp/new_hosts ;
mv /tmp/new_hosts /etc/hosts -y
reboot


EOF

  tags = {
    Name      = "ci_${var.project}",
    inventory = "ci"
  }
}

resource "aws_instance" "docker" {
  ami                         = var.latest_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ireland_managed_key.key_name
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo su
hostnamectl set-hostname docker
( echo '127.0.0.1' docker ; cat /etc/hosts ) > /tmp/new_hosts ;
mv /tmp/new_hosts /etc/hosts -y
reboot


EOF

  tags = {
    Name      = "docker_${var.project}",
    inventory = "docker"
  }
}


#Associate eip with EC2

resource "aws_eip_association" "eip_assoc_ansible" {
  instance_id   = aws_instance.ansible.id
  allocation_id = aws_eip.ansible.id
}

resource "aws_eip_association" "eip_assoc_dev_tools" {
  instance_id   = aws_instance.dev_tools.id
  allocation_id = aws_eip.dev_tools.id
}


resource "aws_eip_association" "eip_assoc_qa" {
  instance_id   = aws_instance.qa.id
  allocation_id = aws_eip.qa.id
}

resource "aws_eip_association" "eip_assoc_ci" {
  instance_id   = aws_instance.ci.id
  allocation_id = aws_eip.ci.id
}

resource "aws_eip_association" "eip_assoc_docker" {
  instance_id   = aws_instance.docker.id
  allocation_id = aws_eip.docker.id
}
