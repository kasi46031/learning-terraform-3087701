module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.table_properties.name
  hash_key = var.table_properties.hashkey
  range_key = var.table_properties.rangekey

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
}