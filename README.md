# terraform-cloudflare-dns
Terraform to manage Cloudflare DNS zones.

## Description

This provides opinionated terraform for managing CloudFlare Zones.
The idea is to create a working DNS zone, with Mail Delegated to GMail, and potentially
additional sub domains delegated to Azure DNS.

### Gmail as Primary MX for Zone

* create TXT records for GMail(GSuite) Verfication
* Add GMail Mail servers as for MX Records.

### Azure DNS zone Delegation

* Delegate a zone to Azure DNS
* Dynamically add Azure DNS nameservers in NS delegation records.


## Files

* [main.tf](main.tf)
* [provider.tf](provider.tf)
* [variables.tf](variables.tf)
