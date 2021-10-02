## VARIABLES
# Make changes here

variable "VmServer1" {
  type    = string
  default = "VmServer1"
}
variable "VmServer2" {
  type    = string
  default = "VmServer2"
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

variable "network1" {
  type    = string
  default = "tf-test1"
}

variable "subnet_name1" {
  type    = string
  default = "tf-test-sub1"
}
variable "network2" {
  type    = string
  default = "tf-test2"
}

variable "subnet_name2" {
  type    = string
  default = "tf-test-sub2"
}

variable "subnet_cidr1" {
  type    = string
  default = "192.168.0.0/24"
}

variable "subnet_cidr2" {
  type    = string
  default = "192.168.1.0/24"
}

variable "dns_ip" {
  type    = list(string)
  default = [ "8.8.8.8", "8.8.4.4" ]
}

variable "port_ip_vm1" {
  type    = string
  default = "192.168.0.10"
}

variable "port_ip_vm2" {
  type    = string
  default = "192.168.1.10"
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
