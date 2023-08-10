resource "aws_s3_bucket" "inventory_bucket" {
  bucket = "Abucketforinventory"
  acl    = "private"  # Adjust ACL as needed
}
resource "aws_s3_bucket_object" "inventory_object" {
  bucket = aws_s3_bucket.inventory_bucket.id
  key    = "dynamic_inventory.ini"
  content = data.template_file.inventory.rendered
  acl    = "private"  # Adjust ACL as needed
}
