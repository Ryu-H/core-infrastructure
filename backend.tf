terraform {
  backend "s3" {
    bucket = "ryu-infrastructure"
    key = "network.infrastructure"
    region = "ap-southeast-2"
    dynamodb_table = "network.infrastructure"
  }
}
