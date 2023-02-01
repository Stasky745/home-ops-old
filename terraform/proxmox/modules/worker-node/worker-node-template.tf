resource "proxmox_vm_qemu" "worker-node-template" {

  # VM General Settings
  target_node = "proxmox"
  vmid        = var.node-id
  name        = var.node-name
  desc        = "Worker of K8s Cluster"

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings
  clone      = "ubuntu-cloud-22.10"
  full_clone = true

  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores   = 2
  sockets = 1
  cpu     = "host"

  # VM Memory Settings
  memory = 4096

  # VM Disk Settings
  disk {
    size    = "40G"
    type    = "virtio"
    storage = "local-lvm"
    backup  = 1
  }

  # VM Network Settings
  network {
    bridge   = "vmbr0"
    model    = "virtio"
    firewall = false
  }

  nameserver = "1.1.1.1"

  # VM Cloud-Init Settings
  os_type = "cloud-init"

  # (Optional) IP Address and Gateway
  ipconfig0 = var.node-ipconfig

  # (Optional) Default User
  ciuser     = "stasky"
  cipassword = data.sops_file.creds.data["user_pwd"]

  # (Optional) Add your SSH KEY
  sshkeys = data.sops_file.creds.data["ssh_public_key"]
  # sshkeys = <<EOF
  # #YOUR-PUBLIC-SSH-KEY
  # EOF
}
