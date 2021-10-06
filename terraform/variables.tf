## VARIABLES
# Make changes here

variable "VmServer1" {
  type    = string
  default = "VmServer1"
}

variable "AnsibleMaster" {
  type    = string
  default = "AnsibleMaster"
}

variable "DbServer1" {
  type    = string
  default = "DbServer1"
}

variable "DbServer2" {
  type    = string
  default = "DbServer2"
}

variable "FileServer1" {
  type    = string
  default = "FileServer1"
}

variable "FileServer2" {
  type    = string
  default = "FileServer2"
}

variable "NAS" {
  type    = string
  default = "NAS"
}

variable "web" {
  type    = string
  default = "Web"
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
  default = "DMZ"
}

    variable "subnet_name1" {
      type    = string
      default = "DMZ"
    }

    variable "subnet_cidr1" {
      type    = string
      default = "192.168.1.0/24"
    }

variable "network2" {
  type    = string
  default = "Film/foto"
}

    variable "subnet_name2" {
      type    = string
      default = "Film/foto"
    }

    variable "subnet_cidr2" {
      type    = string
      default = "192.168.2.0/24"
    }

variable "network3" {
  type    = string
  default = "HR/ekonomi"
}

    variable "subnet_name3" {
      type    = string
      default = "HR/ekonomi"
    }

    variable "subnet_cidr3" {
      type    = string
      default = "192.168.3.0/24"
    }

variable "network4" {
  type    = string
  default = "R&D"
}

    variable "subnet_name4" {
      type    = string
      default = "R&D"
    }

    variable "subnet_cidr4" {
      type    = string
      default = "192.168.4.0/24"
    }

variable "network5" {
  type    = string
  default = "IT-admin"
}

    variable "subnet_name5" {
      type    = string
      default = "IT-admin"
    }

    variable "subnet_cidr5" {
      type    = string
      default = "192.168.5.0/24"
    }

variable "network6" {
  type    = string
  default = "SAN 1"
}

    variable "subnet_name6" {
      type    = string
      default = "SAN 1"
    }

    variable "subnet_cidr6" {
      type    = string
      default = "192.168.6.0/24"
    }

variable "network7" {
  type    = string
  default = "SAN 2"
}

    variable "subnet_name7" {
      type    = string
      default = "SAN 2"
    }

    variable "subnet_cidr7" {
      type    = string
      default = "192.168.7.0/24"
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
