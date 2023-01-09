
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

  type = object ({
    hashkey = string
  })

  default = {
    hashkey = "hashid"
  }
}

variable "rangekey" {
  description = "The attribute to use as the range (sort) key.."
  
  type = object ({
    rangekey = string
  })

  default = {
    rangekey = "rangeid"
  }
}

variable "kmskey" {
  description = "The attribute to use define encryption key"
  
  type = object ({
    kmskey = string
  })

  default = {
    kmskey = "kmskeydetails"
  }
}


variable "attributes" {
  description = "Attributes inside the DynaomoDB table."
  
  type = list(object(
    {
      name = string
      type = string
      #......add more attributes as per table definition
    }
  ))
  default = []
  }







