variable "properties" {
  description = "table properties"

  type = object ({
    name = string
    hashkey = string
  })

  default = {
    name = "globaltable"
    hashkey = "id"
  }

}