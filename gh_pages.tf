# Add A records for  GitHub Pages to Host the APEX Domain
resource "cloudflare_record" "gh_pages_http_servers" {
  count = "${length(var.gh_pages_http_servers) * var.gh_pages_apex_domain_enable}"
  domain = "${var.domain_name}"
  name = "@"
  value = "${var.gh_pages_http_servers[count.index]}"
  type  = "A"
  ttl = 3600
}
resource "cloudflare_record" "www_gh-pages" {
  count = "${var.gh_pages_apex_domain_enable}"
  domain = "${var.domain_name}"
  name = "www"
  value = "$(var.domain_name)"
  type  = "A"
  ttl = 3600
  depends_on = ["cloudflare_record.gh_pages_http_servers"]
}
