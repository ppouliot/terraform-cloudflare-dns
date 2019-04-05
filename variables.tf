# 
# Cloudflare Variables
#

variable "cloudflare_email" {
  description = "The email adress used for your Cloudflare account"
}

variable "cloudflare_token" {
  description = "Cloudflare account global token"
}

variable "domain_name" {
  description = "DNS Domain Name used for the Zone Records"
}

# GMAIL MX Records With TXT Verification
variable "gmail_mx_enable" {
  description = "Enable GMail MX Records"
  default     = 0
}

# Google Gmail TXT Record Verification String
variable "google_site_verification_token" {
  description = "Google site verification token for using GMail as prirmary MX"
  default = ""
}

variable "gmail_mx_servers" {
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
  description = "Aliases to Google Gsuite Applications"
  default = [ "calendar", "docs", "mail", "sites", "start" ]
}

# Azure Delegation Enable/Disable
variable "az_zone_delegation_enable" {
  description = "Enable a Delegated Zone in Azure DNS"
  default     = 0
}

# Github Pages APEX Domain Record Enable/Disable
variable gh_pages_apex_domain_enable {
  description = "Enable Github Pages APEX Domain A Record"
  default     = 0
}
variable "gh_pages_http_servers" {
  description = "GitHub Pages HTTP Server IP Addresses for APEX domains"
  default = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}
