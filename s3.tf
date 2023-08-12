data "aws_s3_bucket" "inventory_bucket" {
  bucket = "apiappinventorybucket"
}

resource "aws_s3_bucket_object" "inventory_object" {
  bucket = data.aws_s3_bucket.inventory_bucket.id
  key    = "dynamic_inventory.ini"
  content = data.template_file.inventory.rendered
}
