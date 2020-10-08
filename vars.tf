variable "tags" {
  type = map(string)
  default = {
    environment    = "production"
    provisioned_by = "terraform"
  }

}


variable "dynamodb_name" {
  default = "dynamodb"
}

variable "access_key" {
  default = "AM"
}
variable "secret_key" {
  default = "XXXXXXXXXXXXXXXXXXX"
}
