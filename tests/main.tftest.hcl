variables {
  zone_id     = "023e105f4ecef8ad9ca31a8372d0c353"
  domain_name = "example.com"
}

run "validate_disabled_features_create_no_records" {
  command = plan
  
  assert {
    condition     = length(cloudflare_record.google_mx) == 0
    error_message = "Google MX records should not be created when mx_enable is false."
  }
  
  assert {
    condition     = length(cloudflare_record.azure_delegated_zone_ns) == 0
    error_message = "Azure NS records should not be created when delegation_enable is false."
  }
}

run "validate_enabled_features" {
  command = plan
  variables {
    gsuite = {
      mx_enable               = true
      site_verification_token = "google-site-verification=12345"
    }
    azure_dns = {
      delegation_enable = true
      nameservers       = ["ns1.azure.com", "ns2.azure.com"]
    }
  }

  assert {
    condition     = length(cloudflare_record.google_mx) == 5
    error_message = "Google MX records were not created correctly."
  }
  
  assert {
    condition     = length(cloudflare_record.azure_delegated_zone_ns) == 2
    error_message = "Azure NS records were not created correctly."
  }
}