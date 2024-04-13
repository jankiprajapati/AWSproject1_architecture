resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.dynamodbname
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "empid"

  attribute {
    name = "empid"
    type = "N"
  }
 
  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "test"
    Environment = "testing"
  }
}
