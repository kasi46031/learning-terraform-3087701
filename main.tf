resource "aws_dynamodb_table" "this" {
 # source   = "terraform-aws-modules/dynamodb-table/aws"

  name      = var.name
  hash_key  = var.hashkey
  range_key = var.rangekey

  read_capacity = var.readc
  write_capacity  = var.writec
  
  point_in_time_recovery {
    enabled = var.pintrecovery
  }
  
  server_side_encryption {
    enabled     = var.ssencryption
   # kms_key_arn = kmskey.value
  }
  

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.attributename
      type = attribute.value.attributetype
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "Dev"
  }
  
}

