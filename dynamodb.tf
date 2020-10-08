resource "aws_dynamodb_table" "tf" {
  name           = "${var.dynamodb_name}table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "requestid"
  range_key      = "contextid"

  attribute {
    name = "requestid"
    type = "S"
  }

  attribute {
    name = "contextid"
    type = "S"
  }

  attribute {
    name = "callerid"
    type = "S"
  }

  global_secondary_index {
    name               = "ContextCallerIndex"
    hash_key           = "contextid"
    range_key          = "callerid"
    write_capacity     = 5
    read_capacity      = 5
    projection_type    = "INCLUDE"
    non_key_attributes = ["requestid", "action", "clientip", "component", "createdtime", "type"]
  }
  tags = { for k, v in merge({ resource = "aws_dynamodb_table" }, var.tags) : k => lower(v) }

}
