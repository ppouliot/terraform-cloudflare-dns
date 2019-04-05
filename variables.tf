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

variable "gmail_mx_enable" {
  description = "Enable GMail MX Records"
  default     = 0
}

variable "az_zone_delegation_enable" {
  description = "Enable a Delegated Zone in Azure DNS"
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
