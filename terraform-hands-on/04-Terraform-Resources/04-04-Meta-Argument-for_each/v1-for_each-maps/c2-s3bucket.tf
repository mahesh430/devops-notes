# Create S3 Bucket per environment with for_each and maps
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "mys3bucket" {

  # for_each Meta-Argument
  for_each = {
    dev  = "my-dapp-bucket-2"
    qa   = "my-qapp-bucket-2"
    stag = "my-sapp-bucket-2"
    prod = "my-papp-bucket-2"
  }

  bucket = "${each.key}-${each.value}"
  #acl    = "private" # This argument is deprecated, so commenting it. 
  

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}
