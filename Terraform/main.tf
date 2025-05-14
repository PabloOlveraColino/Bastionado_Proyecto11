provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "pfsense" {
  name        = "pfsense"
  target_node = var.pm_node
  iso         = var.pfsense_iso
  cores       = 2
  memory      = 2048
  net0        = "virtio,bridge=vmbr0"
  net1        = "virtio,bridge=vmbr1"
  disk {
    size = "10G"
    type = "scsi"
    storage = var.storage
  }
}

resource "proxmox_vm_qemu" "kali" {
  name        = "kali"
  target_node = var.pm_node
  clone       = var.kali_template
  cores       = 2
  memory      = 2048
  net0        = "virtio,bridge=vmbr1"
  cloudinit   = true
  ipconfig0   = "ip=dhcp"
}

resource "proxmox_vm_qemu" "ubuntu" {
  name        = "ubuntu"
  target_node = var.pm_node
  clone       = var.ubuntu_template
  cores       = 2
  memory      = 2048
  net0        = "virtio,bridge=vmbr1"
  cloudinit   = true
  ipconfig0   = "ip=dhcp"
}
