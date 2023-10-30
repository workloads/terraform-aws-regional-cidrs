module "basic" {
  source = "../.."
}

# uncommenting the `aws_vpc` resource below will provision a VPC for each CIDR block.
# With default AWS resource limits, this will fail with a resource exhaustion error.
#
# This code is provided for illustration only and should be adapted to your needs.
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
#resource "aws_vpc" "regional" {
#  for_each = module.basic.cidrs
#
#  cidr_block = each.value
#}
