# Add A records for GitHub Pages to Host the APEX Domain

resource "cloudflare_record" "gh_pages_http_servers" {
  for_each = var.gh_pages_apex_domain_enable ? toset(var.gh_pages_http_servers) : []

  zone_id = var.zone_id
  name    = "@"
  value   = each.value
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "www_gh_pages" {
  count   = var.gh_pages_apex_domain_enable ? 1 : 0
  zone_id = var.zone_id
  name    = "www"
  value   = var.domain_name
  type    = "CNAME"
  ttl     = 3600
}