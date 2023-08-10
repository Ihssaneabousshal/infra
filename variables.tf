variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = "AKIAULL2XHQ5MYAELL4X"
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = "W5Kf16Bivs1k0ch/jOEYC2lw9IvJilZBloSipTvu"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "ami" {
   type        = string
   description = "Ubuntu Server 22.04 LTS"
   default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "EC2instance"
   default     = "EC2instance"
}
