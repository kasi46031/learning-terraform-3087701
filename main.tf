module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name      = var.properties.name
  hash_key  = var.properties.hashkey
  range_key = var.properties.rangekey

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