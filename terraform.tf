terraform {
  cloud {
    organization = "numtide"

    workspaces {
      project = "gh-v6"
      name = "gh-v6com"
    }
  }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.34.0"
    }
  }
}
