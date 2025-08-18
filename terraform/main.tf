resource "proxmox_virtual_environment_download_file" "download-debian-iso" {
  content_type = "iso"
  datastore_id = var.iso_datastore_id
  file_name = var.iso_file_name
  node_name = var.node_name
  url = var.iso_download_url
}

resource "proxmox_virtual_environment_vm" "create-vm" {
  depends_on = [
    proxmox_virtual_environment_download_file.download-debian-iso # wait for the ISO download to be finished
  ]
  vm_id = var.vm_id
  name = var.vm_name
  node_name = var.node_name
  bios = "ovmf"
  on_boot = true
  operating_system {
    type = "l26" # Linux kernel type
  }
  tpm_state {
    version = "v2.0"
    datastore_id = var.vm_datastore
  }
  efi_disk {
    datastore_id = var.vm_datastore
  }
  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = true
  }
  cpu {
    cores = var.vm_core
    type = "host"
  }
  memory {
    dedicated = var.vm_ram
  }
  cdrom {
    file_id = "local:iso/${var.iso_file_name}"
  }
  disk { 
    datastore_id = var.vm_datastore
    interface = "virtio0"
    size = var.vm_disk_size
    ssd = true
    file_format = "raw"
    iothread = true
    backup = true
  }
  network_device {
    bridge = var.vm_network_bridge
  }
  vga {
    type = "std"
  }
}
