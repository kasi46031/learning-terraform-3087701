module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name      = var.properties.name
  hash_key  = var.properties.hashkey
  point_in_time_recovery_enabled  = true
  server_side_encryption_enabled = true

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
