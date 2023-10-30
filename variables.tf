variable "cidr_base" {
  type        = number
  description = "Base Octet of CIDR block."
  default     = "10"
}

variable "cidr_map" {
  type = object({
    geo         = map(number)
    cardinality = map(number)
  })

  description = "Mapping of CIDR data by AWS Region."

  # see https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions
  default = {
    # The CIDR octet for most `geo` values is based on an anagram that maps
    # to a standard E.161 keypad to translate the letters to a numeric value.
    geo = {
      # Asia Central
      ac = 22

      # Africa
      af = 23

      # Asia Pacific
      ap = 27

      # Canada
      ca = 22

      # China; Only accessible to AWS accounts using the AWS China partition (`aws-cn`)
      # Formula: GovCloud base index (`100`), followed by value of assoc. region (`cn` = 26)
      cn = 126

      # Europe
      eu = 38

      # ISO (US); Only accessible to AWS accounts using the ISO (US) partition (`aws-iso`)
      # Formula: primary ISO regions base index (`110`), followed by value of assoc. region (`us` = 87)
      iso = 197

      # Secret Region Europe; Only accessible to AWS accounts using the ISOB partition (`aws-iso-b`)
      # Formula: secondary ISO regions base index (`120`), followed by value of assoc. region (`us` = 87)
      isob = 207

      # Secret Region Europe; Only accessible to AWS accounts using the ISOE partition (`aws-iso-e`)
      # Formula: primary ISO regions base index (`110`), followed by value of assoc. region (`eu` = 38)
      isoe = 138

      # Secret Region; Only accessible to AWS accounts using the ISOF partition (`aws-iso-f`)
      # Formula: primary ISO regions base index (`110`), followed by value of assoc. region (`eu` = 38)
      # isof = 138

      # Israel
      il = 45

      # Middle East
      me = 63

      # South America
      sa = 72

      # United States
      us = 87

      # GovCloud (US); Only accessible to AWS accounts using the GovCloud (US) partition (`aws-us-gov`)
      # Formula: GovCloud regions base index (`100`), followed by value of assoc. region (`us` = 87)
      us-gov = 187
    }

    cardinality = {
      # The CIDR octet for `cardinality` is based on the numerical index of
      # the cardinal direction when mapped to a standard 8-wind compass rose
      # see https://en.wikipedia.org/wiki/Points_of_the_compass
      central   = 9
      east      = 3
      north     = 1
      northeast = 2
      northwest = 8
      south     = 5
      southeast = 4
      west      = 7
    }
  }
}

variable "cidr_prefix" {
  type        = number
  description = "Prefix of CIDR block."
  default     = "24"

  validation {
    condition     = var.cidr_prefix >= 24 && var.cidr_prefix <= 28
    error_message = "`cidr_prefix` must be between `24` and `28` (inclusive)."
  }
}
