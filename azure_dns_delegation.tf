# Delegate Az Zone to Azure DNS

resource "cloudflare_record" "azure_delegated_zone_ns" {
  for_each = var.azure_dns.delegation_enable ? toset(var.azure_dns.nameservers) : []

  zone_id = var.zone_id
  name    = "az"
  value   = each.value
  type    = "NS"
  ttl     = 3600
}