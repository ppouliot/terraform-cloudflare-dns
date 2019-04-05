# Uses GSuite TXT Record for Verification and adds Googles MX Servers and Zone MX Records

# TXT Record for GMail Verification
resource "cloudflare_record" "google_site_verification" {
  count  = "${var.gmail_mx_enable}"
  domain = "${var.domain_name}"
  name   = "@"
  value = "${var.google_site_verification_token}"
  type   = "TXT"
  ttl    = 3600
}

# MX record for Zone
resource "cloudflare_record" "google_mx" {
  count = "${length(var.gmail_mx_servers) * var.gmail_mx_enable}"
  domain = "${var.domain_name}"
  name = "mail"
  value = "${var.gmail_mx_servers[count.index]}"
  priority = "${count.index + 1}"
  type = "MX"
  ttl = 3600
  depends_on = [ "cloudflare_record.google_site_verification" ]
}

# Add CNAME Records for GSuite Services
resource "cloudflare_record" "gsuite_aliases" {
  count = "${length(var.gsuite_aliases) * var.gmail_mx_enable}"
  domain = "${var.domain_name}"
  name = "${var.gsuite_aliases[count.index]}"
  value = "ghs.google.com"
  type  = "CNAME"
  ttl = 3600
  depends_on = [
    "cloudflare_record.google_site_verification",
    "cloudflare_record.google_mx",
  ]
}
