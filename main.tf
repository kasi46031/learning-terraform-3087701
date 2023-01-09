module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name      = var.properties.name
  hash_key  = var.properties.hashkey

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "Dev"
  }
  
  point_in_time_recovery {
    enabled = true
  }

}

