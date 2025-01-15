resource "aws_instance""example"{
    ami               ="ami-04c535bac3bf07b9a" 
    instance_type     ="t2.micro" 
    key_name          = "NAYE_key"
    vpc_security_group_ids    = [aws_security_group.instance.id]   # 아래 보안그룹을 묶어주는 역할을 함.
    user_data=<<-EOF
    #!/bin/bash
    echo"Today 25-01-13" > index.html 
    nohup busybox httpd -f -p 8080 
    EOF
}
resource "aws_security_group" "instance" {                   
  ingress {
    from_port      = 8080                  
    to_port        = 8080                  
    protocol       = "tcp"                      
    cidr_blocks    = ["0.0.0.0/0"]
  }
 ingress {
    from_port     = 22                       
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


