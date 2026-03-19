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
}

variable "domain_name" {
  type        = string
  description = "DNS Domain Name used for the Zone Records (used for CNAME targets)"
}

# GMAIL MX Records With TXT Verification
variable "gmail_mx_enable" {
  type        = bool
  description = "Enable GMail MX Records"
  default     = false
}

# Google Gmail TXT Record Verification String
variable "google_site_verification_token" {
  type        = string
  description = "Google site verification token for using GMail as primary MX"
  default     = ""
}

variable "gmail_mx_servers" {
  type        = list(string)
  description = "Google Gmail MX Mail relays"
  default = [
    "aspmx.l.google.com",
    "alt1.aspmx.l.google.com",
    "alt2.aspmx.l.google.com",
    "alt3.aspmx.l.google.com",
    "alt4.aspmx.l.google.com",
  ]
}

variable "gsuite_aliases" {
  type        = list(string)
  description = "Aliases to Google Gsuite Applications"
  default     = ["calendar", "docs", "mail", "sites", "start"]
}

# Azure Delegation Enable/Disable
variable "az_zone_delegation_enable" {
  type        = bool
  description = "Enable a Delegated Zone in Azure DNS"
  default     = false
}

variable "azure_nameservers" {
  type        = list(string)
  description = "List of Azure DNS nameservers for zone delegation"
  default     = []
}

# Github Pages APEX Domain Record Enable/Disable
variable "gh_pages_apex_domain_enable" {
  type        = bool
  description = "Enable Github Pages APEX Domain A Record"
  default     = false
}

variable "gh_pages_http_servers" {
  type        = list(string)
  description = "GitHub Pages HTTP Server IP Addresses for APEX domains"
  default = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}