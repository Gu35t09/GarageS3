# Node where to deploy the VM
node_name = "pve02"

# ISO path, url and name
iso_datastore_id = "local"
iso_file_name = "debian-13.0.0-amd64-netinst.iso"
iso_download_url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.0.0-amd64-netinst.iso"

# VM related variables
vm_id = 114
vm_name = "garage01"
vm_core = 2
vm_ram = 2048
vm_disk_size = 30
vm_datastore = "local-lvm"
vm_network_bridge = "vmbr0"
