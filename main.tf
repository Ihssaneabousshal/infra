resource "aws_instance" "apiapp_instance" {
 ami           = var.ami
 instance_type = var.instance_type
 key_name = "Mkey"
 vpc_security_group_ids = [aws_security_group.ec2sg.id]

 tags = {
   Name = var.name_tag,
 }
}
