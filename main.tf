# TXT Record for GMail Verification
resource "cloudflare_record" "google_gmail_txt_verify" {
  count  = "${var.google_site_verification_token != "" ? 1:0}
  domain = "${var.domain_name}"
  name   = "@"
  value = "${var.google_site_verification_token}"
  type   = "TXT"
  ttl    = 3600
}

locals {
  # Get Azure DNS Server Records
  az_ns_servers = [
    "${concat(azurerm_dns_zone.delegated.name_servers, list(" "))}",
  ]
  # GMail Mail servers
  gmail_mx_servers = [
    "aspmx.l.google.com",
    "alt1.aspmx.l.google.com",
    "alt2.aspmx.l.google.com",
    "alt3.aspmx.l.google.com",
    "alt4.aspmx.l.google.com",
  ]
}

# Delegate Az Zone to Azure DNS
resource "cloudflare_record" "azure_delegated_zone_ns" {
  count = "${length(local.az_ns_servers) - 1}"
  domain = "${var.domain_name}"
  name = "az"
  value = "${local.az_ns_servers[count.index]}"
  type = "NS"
  ttl = 3600
}

# MX record for Zone
resource "cloudflare_record" "zone_mx" {
  count = "${length(local.gmail_mx_servers)}"
  domain = "${var.domain_name}"
  name = "mail"
  value = "${local.gmail_mx_servers[count.index]}"
  priority = "${count.index + 1}"
  type = "MX"
  ttl = 3600
}
