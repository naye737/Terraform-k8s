resource "aws_instance" "cloudee-pub-ec2-bastion-2a" {
  ami                         = "ami-056a29f2eddc40520"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.cloudee-sg-bastion.id]
  subnet_id                   = aws_subnet.cloudee-pub-subnet-2a.id
  key_name                    = "NAYE_key"
  associate_public_ip_address = true

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "cloudee-pub-ec2-bastion-2a"
    }
  }

  tags = {
    "Name" = "cloudee-pub-ec2-bastion-2a"
  }
}


