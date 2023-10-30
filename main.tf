# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/regions
data "aws_regions" "main" {
  # The absence of any filter statement indicates that the data source
  # should retrieve a set of (public) AWS Regions that are of type:
  #
  #  * `opt-in-not-required` (e.g.: AWS Regions that are enabled in any AWS account)
  #  or
  #  * `opted-in` (e.g.: AWS Regions that are purposely enabled in the current AWS account)
  #
  # This query will omit AWS Regions of type `not-opted-in`.
}

locals {
  # assemble a Regular Expression accounting for AZ indices from 1 to 4
  regex_azs = "([1-4])"

  # assemble a Regular Expression from the keys of the `cidr_map.geo` map
  # see https://developer.hashicorp.com/terraform/language/functions/format
  # and https://developer.hashicorp.com/terraform/language/functions/join
  # and https://developer.hashicorp.com/terraform/language/functions/keys
  regex_geo = format("(%s)", join("|", keys(var.cidr_map.geo)))

  # assemble a Regular Expression from the keys of the `cidr_map.geo` map
  # see https://developer.hashicorp.com/terraform/language/functions/format
  # and https://developer.hashicorp.com/terraform/language/functions/join
  # and https://developer.hashicorp.com/terraform/language/functions/keys
  regex_cardinality = format("(%s)", join("|", keys(var.cidr_map.cardinality)))

  # assemble Regular Expression from Geo and Cardinality, and AZ indices
  regex = "^${local.regex_geo}-${local.regex_cardinality}-${local.regex_azs}$"

  # assemble a map of regions containing Geo, Cardinality, and AZ index
  region_map = {
    for region in data.aws_regions.main.names : region => {
      geo         = replace(region, "/${local.regex}/", "$1")
      cardinality = replace(region, "/${local.regex}/", "$2")
      index       = replace(region, "/${local.regex}/", "$3")
    }
  }

  # assemble a map of regions containing CIDR octets for Geo, Cardinality, and AZ index
  cidr_map = {
    for region, data in local.region_map : region => {
      geo         = lookup(var.cidr_map.geo, data.geo)
      cardinality = lookup(var.cidr_map.cardinality, data.cardinality)
      index       = data.index
    }
  }

  # assemble a map of regions with their respective CIDR blocks
  cidrs = {
    for region, data in local.cidr_map : region => "${var.cidr_base}.${local.cidr_map[region].geo}.${local.cidr_map[region].cardinality}${local.cidr_map[region].index}.0/${var.cidr_prefix}"
  }
}
