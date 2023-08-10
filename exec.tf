data "template_file" "inventory" {
  template = <<-EOT
    [ec2_instances]
    ${aws_instance.public_instance.public_ip} ansible_user=ubuntu ansible_private_key_file=${path.module}/Mkey
    EOT
}

resource "null_resource" "move_inventory" {
  triggers = {
    inventory_rendered = data.template_file.inventory.rendered
  }

  provisioner "local-exec" {
    command = <<-EOT
      mkdir -p ~/2conf
      echo "${data.template_file.inventory.rendered}" > ~/2conf/dynamic_inventory.ini
      chmod 400 ~/2conf/dynamic_inventory.ini
    EOT
  }
}
