resource "cloudflare_worker_route" "worker-naked" {
  zone_id     = local.cloudflare_zone_id
  pattern     = "${local.domain}/*"
  script_name = cloudflare_worker_script.worker.name
}

resource "cloudflare_worker_route" "worker-subdomains" {
  zone_id     = local.cloudflare_zone_id
  pattern     = "*.${local.domain}/*"
  script_name = cloudflare_worker_script.worker.name
}

resource "cloudflare_worker_script" "worker" {
  account_id = local.cloudflare_account_id
  name       = "gh-v6-worker"
  content = templatefile(
    "${path.module}/worker.js.tftpl",
    {
      worker_index_html         = file("${path.module}/worker.html")
      worker_not_supported_html = file("${path.module}/worker_not_supported.html")
    }
  )
  module = true
}
