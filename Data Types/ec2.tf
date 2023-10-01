provider "aws" {
    region = "ap-south-1"
}


    resource "aws_instance" "testec2" {
    ami = "ami-067c21fb1979f0b27"
    count = 2
    instance_type = var.instance_type[count.index]
    availability_zone =  var.az[count.index]
}

  
