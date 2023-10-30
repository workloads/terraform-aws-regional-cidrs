# Regional Predictable CIDRs for AWS VPCs

> This module manages the lifecycle of regional, predictable AWS-specific CIDRs for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Regional Predictable CIDRs for AWS VPCs](#regional-predictable-cidrs-for-aws-vpcs)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
  * [Usage](#usage-1)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

* Amazon Web Services (AWS) [Account](https://aws.amazon.com/account/)
* Terraform `1.6.0` or [newer](https://developer.hashicorp.com/terraform/downloads).

## Usage

This module depends on a correctly configured [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "regional_cirs" {
  source  = "ksatirli/regional-cidrs/aws"
  version = "1.0.0"
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/ksatirli/regional-cidrs/aws) using `terraform get`.

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

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/workloads/terraform-aws-regional-cidrs/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
