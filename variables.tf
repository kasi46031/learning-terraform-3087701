
#Dynamo DB Core components needs to be updated per table definition 

variable "name" {
  description = "Name of the DynamoDB table "
  
  type = object ({
    name = string
  })

  default = {
    name = "Sampletable"
  }

}

variable "hashkey" {
  description = "The attribute to use as the hash (partition) key."

  hashkey = string
  
  default = {
    hashkey = "hashid"
  }
}

variable "rangekey" {
  description = "The attribute to use as the range (sort) key.."
  
  rangekey = string

  default = {
    rangekey = "rangeid"
  }
}

variable "pintrecovery" {
  description = "point in time recovery"
  
  pintrecovery = bool
 
  default = {
    pintrecovery = "true"
  }
}


variable "ssencryption" {
  description = "The attribute to use define encryption key"
  
  ssencryption = bool

  default = {
    ssencryption = "true"
  }
}


variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties: name - (Required) The name of the attribute, type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  
  type = list(object(
    {
      name = string
      type = string
    }
  ))
  default = []
  }







