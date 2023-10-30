output "aws_regions" {
  description = "Exported Attributes for `aws_regions.main` data source."
  value       = data.aws_regions.main
}

output "cidrs" {
  description = "List of Region-specific CIDRs."
  value       = local.cidrs
}

output "cidr_map" {
  description = "List of Region-specific CIDR Octets."
  value       = local.cidr_map
}

output "region_map" {
  description = "Results of Region Mapping."
  value       = local.region_map
}

output "regular_expression_patterns" {
  description = "Regular Expression patterns for matching AWS Regions."

  value = {
    geo         = local.regex_geo
    cardinality = local.regex_cardinality
  }
}
