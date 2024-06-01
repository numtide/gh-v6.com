resource "cloudflare_zone" "dns" {
  account_id = local.cloudflare_account_id
  zone       = local.domain
  plan       = "free"
}

# Add some fake addresses so CloudFlare start proxying those. It doesn't
# matter what the address is, because the worker intercepts all of the
# requests.

resource "cloudflare_record" "A-root" {
  zone_id = local.cloudflare_zone_id
  name    = "@"
  value   = "88.99.244.96"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "AAAA-root" {
  zone_id = local.cloudflare_zone_id
  name    = "@"
  value   = "2a01:4f8:10b:49f::1"
  type    = "AAAA"
  proxied = true
}

resource "cloudflare_record" "A-star" {
  zone_id = local.cloudflare_zone_id
  name    = "*"
  value   = "88.99.244.96"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "AAAA-star" {
  zone_id = local.cloudflare_zone_id
  name    = "*"
  value   = "2a01:4f8:10b:49f::1"
  type    = "AAAA"
  proxied = true
}
