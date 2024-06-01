locals {
  domain                = "gh-v6.com"
  cloudflare_account_id = "186a9b0a6ef4bf5c3792c9f4b4ebfbda"
  cloudflare_zone_id    = cloudflare_zone.dns.id
}
