# 
# Cloudflare Variables
#

variable "cloudflare_email" {
  description = "The email adress used for your Cloudflare account"
}

variable "cloudflare_token" {
  description = "Cloudflare account global token"
}

# Google Gmail TXT Record Verification String
variable "google_site_verification_token" {
  description = "Google site verification token for using GMail as prirmary MX"
}

# Currently in variables.tf 
variable "domain_name" {
  description = "DNS Domain Name used for the Zone Records"
}
