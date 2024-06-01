terraform {
  cloud {
    organization = "numtide"

    workspaces {
      project = "gh-v6"
      name = "main"
    }
  }

  required_providers {
    cloudflare = { source = "cloudflare/cloudflare" }
  }
}
