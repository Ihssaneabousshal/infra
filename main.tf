resource "aws_instance" "public_instance" {
 ami           = var.ami
 instance_type = var.instance_type
 vpc_security_group_ids = [aws_security_group.ec2sg.id]

 tags = {
   Name = var.name_tag,
 }
}
