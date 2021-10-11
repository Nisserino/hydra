## VARIABLES
# Make changes here


# template <name> = [<ip_address>, <network>]
variable "instances" {
type      = map(list(string))
default = {
    "VmServer" = ["192.168.6.50", "SAN1"],
    "AnsibleMaster" = ["192.168.5.51", "IT-admin"],
    "DbServer1" = ["192.168.6.51", "SAN1"],
    "DbServer2" = ["192.168.7.50", "SAN2"],
    "FileServer1" = ["192.168.6.52", "SAN1"],
    "FileServer2" = ["192.168.7.51", "SAN2"],
    "NAS" = ["192.168.5.50", "IT-admin"],
    "web" = ["192.168.1.50", "DMZ"]
  }
}

variable "networks" {
type = map(string)
default = {
"DMZ" = "192.168.1.0/24",
"Film/foto" = "192.168.2.0/24",
"HR/ekonomi" = "192.168.3.0/24",
"R&D" = "192.168.4.0/24",
"IT-admin" = "192.168.5.0/24",
"SAN1" = "192.168.6.0/24",
"SAN2" = "192.168.7.0/24",
}
}

variable "image_name" {
  type    = string
  default = "ubuntu-20.04-server-latest"
}

variable "flavor_name" {
  type    = string
  default = "v1-mini-1"
}

variable "key_name" {
  type    = string
  default = "nisseburk"
}

variable "dns_ip" {
  type    = list(string)
  default = [ "8.8.8.8", "8.8.4.4" ]
}

variable "router_id" {
  type    = string
  default = "e3ee40b5-7707-4634-a725-144e81545c31"
}

variable "fip_pool" {
  type    = string
  default = "elx-public1"
}

variable "region" {
  type    = string
  default = "sto1"
}

variable "cloudconfig_web" {
  type    = string
  default = <<EOF
#cloud-config
system_info:
  default_user:
    name: nisse
packages:
 - nginx
EOF
}
