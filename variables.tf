variable "table_properties" {
  description = "table properties"

  type = object ({
    name = string
    hashkey = string
    rangekey = string 
  })

  default = {
    name = "globaltable"
    hashkey = "userid"
    rangekey = "tabletitle" 
  }

}