resource "aws_dynamodb_table" "this" {
 # source   = "terraform-aws-modules/dynamodb-table/aws"

  name      = var.name
  hash_key  = var.hashkey
  range_key = var.rangekey
  
  point_in_time_recovery {
    enabled = true
  }
  
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.this.arn
  }
  

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

resource "aws_kms_key" "this" {
  description  = var.kmskey
  multi_region = false
}


