# Proxmox Full-Clone
# Thanks to https://github.com/ChristianLempa/ for this template
# ---
# Create a new VM from a clone

module "worker-1" {
  source        = "./modules/worker-node"
  node-id       = 211
  node-name     = "k8s-w1"
  node-ipconfig = "ip=192.168.1.211/24,gw=192.168.1.1"
}

#module "worker-2" {
#  source        = "./modules/worker-node"
#  node-id       = 212
#  node-name     = "k8s-w2"
#  node-ipconfig = "ip=192.168.1.212/24,gw=192.168.1.1"
#}
