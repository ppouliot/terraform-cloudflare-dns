output "gsuite_verification_record_id" {
  description = "The ID of the GSuite TXT verification record"
  value       = try(cloudflare_record.google_site_verification[0].id, null)
}

output "gsuite_mx_record_ids" {
  description = "The IDs of the GSuite MX records"
  value       = cloudflare_record.google_mx[*].id
}

output "gh_pages_a_record_ids" {
  description = "The IDs of the GitHub Pages A records"
  value       = [for r in cloudflare_record.gh_pages_http_servers : r.id]
}

output "azure_delegation_ns_record_ids" {
  description = "The IDs of the Azure DNS delegation NS records"
  value       = [for r in cloudflare_record.azure_delegated_zone_ns : r.id]
}