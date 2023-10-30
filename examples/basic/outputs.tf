output "all_regions" {
  value = module.basic.cidrs
}

output "single_region" {
  value = module.basic.cidrs["us-east-1"]
}
