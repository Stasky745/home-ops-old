# Proxmox Full-Clone
# Thanks to https://github.com/ChristianLempa/ for this template
# ---
# Create a new VM from a clone


module "master-1" {
  source        = "./modules/master-node"
  node-id       = 201
  node-name     = "k8s-m1"
  node-ipconfig = "ip=192.168.1.201/24,gw=192.168.1.1"
}

module "master-2" {
  source        = "./modules/master-node"
  node-id       = 202
  node-name     = "k8s-m2"
  node-ipconfig = "ip=192.168.1.202/24,gw=192.168.1.1"
}

module "master-3" {
  source        = "./modules/master-node"
  node-id       = 203
  node-name     = "k8s-m3"
  node-ipconfig = "ip=192.168.1.203/24,gw=192.168.1.1"
}
