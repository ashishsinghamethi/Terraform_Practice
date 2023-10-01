 #resource1
provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "example_sg" {
  name        = "test-ashish"
  description = "crra"
  

  
  ingress   {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  
}


#resource2

resource "aws_instance" "testec2" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "t2.micro"

    #I am refering SG id from sg resource

    security_groups = [aws_security_group.example_sg.name]
  
}



