module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "my-table"
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Terraform   = "true"
    Environment = "Dev"
  }
}