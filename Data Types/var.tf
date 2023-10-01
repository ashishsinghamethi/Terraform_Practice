variable "instance_type" {
  type = list(string)
  default = [ "t2.micro", "t2.medium" ]
}

variable "az" {
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
  
}
