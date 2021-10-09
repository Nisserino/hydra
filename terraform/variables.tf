## VARIABLES
# Make changes here

variable "instances_name" {
type      = list(string)
default = [
    "VmServer1",
    "AnsibleMaster",
    "DbServer1",
    "DbServer2",
    "FileServer1",
    "FileServer2",
    "NAS",
    "web"
  ]
}

variable "networks" {
type = map(string)
default = {
"DMZ" = "192.168.1.0/24",
"Film/foto" = "192.168.2.0/24",
"HR/ekonomi" = "192.168.3.0/24",
"R&D" = "192.168.4.0/24",
"IT-admin" = "192.168.5.0/24",
"SAN 1" = "192.168.6.0/24",
"SAN 2" = "192.168.7.0/24",
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

variable "port_ip_vm1" {
  type    = string
  default = "192.168.6.50"
}

variable "port_ip_ansibleMaster" {
  type    = string
  default = "192.168.5.51"
}

variable "port_ip_db1" {
  type    = string
  default = "192.168.6.51"
}

variable "port_ip_db2" {
  type    = string
  default = "192.168.7.51"
}

variable "port_ip_fs1" {
  type    = string
  default = "192.168.6.52"
}

variable "port_ip_fs2" {
  type    = string
  default = "192.168.7.52"
}

variable "port_ip_nas" {
  type    = string
  default = "192.168.5.50"
}

variable "port_ip_web" {
  type    = string
  default = "192.168.1.50"
}

variable "router_id" {
  type    = string
  default = "a44aee96-bc0c-4a6f-bf2c-e3007444428f"
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
