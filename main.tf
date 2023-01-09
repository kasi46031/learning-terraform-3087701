module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name      = var.name
  hash_key  = var.hashkey
  range_key = var.rangekey

  point_in_time_recovery_enabled  = true
  server_side_encryption = true
  

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "Dev"
  }
  
}


