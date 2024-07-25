# Regional Predictable CIDRs for AWS VPCs

> This module manages the lifecycle of regional, predictable AWS-specific CIDRs for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Regional Predictable CIDRs for AWS VPCs](#regional-predictable-cidrs-for-aws-vpcs)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
  * [Usage](#usage-1)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- Amazon Web Services (AWS) [Account](https://aws.amazon.com/account/)
- HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This module depends on a correctly configured [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "regional_cirs" {
  source  = "workloads/regional-cidrs/aws"
  version = "1.0.0"
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/workloads/regional-cidrs/aws) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/workloads/terraform-aws-regional-cidrs/tree/main/examples).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| cidr_base | Base Octet of CIDR block. | `number` | no |
| cidr_map | Mapping of CIDR data by AWS Region. | <pre>object({<br>    geo         = map(number)<br>    cardinality = map(number)<br>  })</pre> | no |
| cidr_prefix | Prefix of CIDR block. | `number` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_regions | Exported Attributes for `aws_regions.main` data source. |
| cidr_map | List of Region-specific CIDR Octets. |
| cidrs | List of Region-specific CIDRs. |
| region_map | Results of Region Mapping. |
| regular_expression_patterns | Regular Expression patterns for matching AWS Regions. |
<!-- END_TF_DOCS -->

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/terraform-aws-regional-cidrs/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
