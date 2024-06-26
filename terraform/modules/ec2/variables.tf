variable "sg_id" {
  description = "SG ID for EC2"
  type = string
}

variable "subnets" {
  description = "Subnets for EC2"
  type = list(string)
}

variable "ec2_names" {
    description = "EC2 names"
    type = list(string)
    default = ["python-development-environment1"] # e.g ["python-development-environment1", "python-development-environment2"]
}

variable "key_name" {
  description = "Key name for python-development-environment EC2"
  type = string
}

variable "private_key_path" {
  description = "Key full path"
  type = string
}
variable "cloudflare_zone_ids" {
  description = "Map of domain to Cloudflare zone IDs, subdomains, and inclusion flags"
  type = map(object({
    zone_id            = string
    service            = optional(string) # Now optional for root domains
    port               = optional(number) # Now optional for root domains
    subdomains         = list(object({
      name             = string
      service          = string
      port             = number
    }))
    include_root       = bool
    include_subdomains = bool
  }))
}
