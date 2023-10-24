resource "cloudflare_account" "intermittent" {
  name              = "Cloudflare.com@mog.se's Account"
  #type              = "standard"
  #enforce_twofactor = true
}

resource "cloudflare_zone" "intermittent" {
  account_id = cloudflare_account.intermittent.id
  zone       = "intermittent.energy"
}

resource "cloudflare_record" "intermittent" {
  zone_id = cloudflare_zone.intermittent.id
  name    = "intermittent.energy"
  value   = var.target_host
  type    = "CNAME"
  proxied = true
  #ttl     = 3600
}
