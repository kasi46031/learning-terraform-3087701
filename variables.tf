
#Dynamo DB Core components needs to be updated per table definition 

variable "name" {
  description = "Name of the DynamoDB table "
  
  type = string
  default  = "exampletable"

}

variable "hashkey" {
  description = "The attribute to use as the hash (partition) key."

  type = string
  default = "id"
  
}

variable "rangekey" {
  description = "The attribute to use as the range (sort) key.."
  
  type = string 
  default = "title"

}

variable "readc" {
  description = "The attribute to use as the range (sort) key.."
  
  type = string 
  default = 1

}

variable "writec" {
  description = "The attribute to use as the range (sort) key.."
  
  type = string 
  default = 1

}

variable "pintrecovery" {
  description = "The attribute to use point in time recovery"
  
  type = bool
  default = true

}

variable "ssencryption" {
  description = "The attribute to use define encryption key"
  
  type = bool
  default = true

}





variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties: name - (Required) The name of the attribute, type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  
  type = list(object(
    {
      attributename = string
      attributetype = string
    }
  ))
    default = [
      {
      attributename = "id"
      attributetype = "N"
      }, 
      {
      attributename = "title"
      attributetype = "S"
      }
    ]
}








