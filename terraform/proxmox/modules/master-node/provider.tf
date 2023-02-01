# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}

#provider "sops" {}

data "sops_file" "creds" {
  source_file = "./cred.enc.json"
}

provider "proxmox" {

  pm_api_url          = data.sops_file.creds.data["proxmox_api_url"]
  pm_api_token_id     = data.sops_file.creds.data["proxmox_api_token_id"]
  pm_api_token_secret = data.sops_file.creds.data["proxmox_api_token_secret"]

  pm_tls_insecure = true

}
