locals {
  # Get Azure DNS Server Records
  az_ns_servers = [
    "${concat(azurerm_dns_zone.delegated.name_servers, list(" "))}",
    "${concat(azurerm_dns_zone.delegated.name_servers, list(" ")) != "" ? 1:0}",
  ]
}
# Delegate Az Zone to Azure DNS
resource "cloudflare_record" "azure_delegated_zone_ns" {
  count = "${length(local.az_ns_servers) - 1 * var.az_zone_delegation_enable }"
  domain = "${var.domain_name}"
  name = "az"
  value = "${local.az_ns_servers[count.index]}"
  type = "NS"
  ttl = 3600
}
