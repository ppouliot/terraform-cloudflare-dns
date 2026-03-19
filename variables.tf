# 
# Cloudflare Variables
#

variable "cloudflare_email" {
  type        = string
  description = "The email address used for your Cloudflare account"
  default     = ""
}

variable "cloudflare_token" {
  type        = string
  description = "Cloudflare account global token"
  sensitive   = true
  default     = ""
}

variable "zone_id" {
  type        = string
  description = "The Cloudflare Zone ID where records will be managed"

  validation {
    condition     = can(regex("^[a-fA-F0-9]{32}$", var.zone_id))
    error_message = "The zone_id must be a 32-character hexadecimal string."
  }
}

variable "domain_name" {
  type        = string
  description = "DNS Domain Name used for the Zone Records (used for CNAME targets)"
}

variable "gsuite" {
  type = object({
    mx_enable               = optional(bool, false)
    site_verification_token = optional(string, "")
    mx_servers = optional(list(string), [
      "aspmx.l.google.com",
      "alt1.aspmx.l.google.com",
      "alt2.aspmx.l.google.com",
      "alt3.aspmx.l.google.com",
      "alt4.aspmx.l.google.com",
    ])
    aliases = optional(list(string), ["calendar", "docs", "mail", "sites", "start"])
  })
  description = "GSuite/Workspace integration settings"
  default     = {}
}

variable "azure_dns" {
  type = object({
    delegation_enable = optional(bool, false)
    nameservers       = optional(list(string), [])
  })
  description = "Azure DNS zone delegation settings"
  default     = {}
}

variable "github_pages" {
  type = object({
    apex_domain_enable = optional(bool, false)
    http_servers = optional(list(string), [
      "185.199.108.153",
      "185.199.109.153",
      "185.199.110.153",
      "185.199.111.153",
    ])
  })
  description = "GitHub Pages integration settings"
  default     = {}
}