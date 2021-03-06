## PROVIDER
# Configure the OpenStack Provider

terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

provider "openstack" {
  #user_name          = "" # use $OS_USERNAME
  #tenant_name        = "" # use $OS_PROJECT_NAME
  #tenant_id          = "" # use $OS_PROJECT_ID
  #password           = "" # use $OS_PASSWORD
  #auth_url           = "" # use $OS_AUTH_URL
  #region             = "" # use $OS_REGION_NAME
}

## NETWORK
# Create network
resource "openstack_networking_network_v2" "network_1" {
  name                = var.network1
  admin_state_up      = "true"
}

resource "openstack_networking_network_v2" "network_2" {
  name                = var.network2
  admin_state_up      = "true"
}

resource "openstack_networking_network_v2" "network_3" {
  name                = var.network3
  admin_state_up      = "true"
}

resource "openstack_networking_network_v2" "network_4" {
  name                = var.network4
  admin_state_up      = "true"
}

resource "openstack_networking_network_v2" "network_5" {
  name                = var.network5
  admin_state_up      = "true"
}

resource "openstack_networking_network_v2" "network_6" {
  name                = var.network6
  admin_state_up      = "true"
}

resource "openstack_networking_network_v2" "network_7" {
  name                = var.network7
  admin_state_up      = "true"
}

# Create subnet
resource "openstack_networking_subnet_v2" "subnet_1" {
  name                = var.subnet_name1
  network_id          = "${openstack_networking_network_v2.network_1.id}"
  cidr                = var.subnet_cidr1
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}
resource "openstack_networking_subnet_v2" "subnet_2" {
  name                = var.subnet_name2
  network_id          = "${openstack_networking_network_v2.network_2.id}"
  cidr                = var.subnet_cidr2
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}
resource "openstack_networking_subnet_v2" "subnet_3" {
  name                = var.subnet_name3
  network_id          = "${openstack_networking_network_v2.network_3.id}"
  cidr                = var.subnet_cidr3
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}
resource "openstack_networking_subnet_v2" "subnet_4" {
  name                = var.subnet_name4
  network_id          = "${openstack_networking_network_v2.network_4.id}"
  cidr                = var.subnet_cidr4
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}
resource "openstack_networking_subnet_v2" "subnet_5" {
  name                = var.subnet_name5
  network_id          = "${openstack_networking_network_v2.network_5.id}"
  cidr                = var.subnet_cidr5
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}
resource "openstack_networking_subnet_v2" "subnet_6" {
  name                = var.subnet_name6
  network_id          = "${openstack_networking_network_v2.network_6.id}"
  cidr                = var.subnet_cidr6
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}
resource "openstack_networking_subnet_v2" "subnet_7" {
  name                = var.subnet_name7
  network_id          = "${openstack_networking_network_v2.network_7.id}"
  cidr                = var.subnet_cidr7
  ip_version          = 4
  dns_nameservers     = var.dns_ip
}

# Create Security Groups
resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name                = "TerraformSG"
  description         = "Terraform SG for Port 80 and 443"

  rule {
    from_port         = 80
    to_port           = 80
    ip_protocol       = "tcp"
    cidr              = "0.0.0.0/0"
  }

  rule {
    from_port         = 443
    to_port           = 443
    ip_protocol       = "tcp"
    cidr              = "0.0.0.0/0"
  }
}


resource "openstack_compute_secgroup_v2" "secgroup_2" {
  name                = "TerraformSSH"
  description         = "Terraform SSH for Port 22"

  rule {
    from_port         = 22
    to_port           = 22
    ip_protocol       = "tcp"
    cidr              = "0.0.0.0/0" # only for demo purposes, tighten up in live scenario
  }
}


resource "openstack_compute_secgroup_v2" "secgroup_3" {
   name                = "TerraformDB"
   description         = "Terraform DB for Port 3306"

   rule {
     from_port         = 3306
     to_port           = 3306
     ip_protocol       = "tcp"
     cidr              = "192.168.0.0/16"
   }
}


resource "openstack_compute_secgroup_v2" "secgroup_4" {
   name                = "TerraformFS"
   description         = "Terraform FS for Port 445"

   rule {
     from_port         = 445
     to_port           = 445
     ip_protocol       = "tcp"
     cidr              = "192.168.0.0/16"
   }
 }


resource "openstack_compute_secgroup_v2" "secgroup_5" {
    name                = "TerraformVM"
    description         = "Terraform VM for Port 8080, 8096, 9980"

   
    rule {
      from_port         = 8080 
      to_port           = 8080
      ip_protocol       = "tcp"
      cidr              = "0.0.0.0/0" # only for demo purposes, tighten up in live scenario
    }
    rule {
      from_port         = 8096
      to_port           = 8096
      ip_protocol       = "tcp"
      cidr              = "0.0.0.0/0" # only for demo purposes, tighten up in live scenario
    }
    rule {
      from_port         = 9980
      to_port           = 9980
      ip_protocol       = "tcp"
      cidr              = "0.0.0.0/0" # only for demo purposes, tighten up in live scenario
    }
  }


# Create a port
## SAN 1 network
resource "openstack_networking_port_v2" "port_1" {
  name                = "port_1"
  network_id          = "${openstack_networking_network_v2.network_6.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_6.id}"
    ip_address        = var.port_ip_vm1
  }
}
resource "openstack_networking_port_v2" "port_2" {
  name                = "port_2"
  network_id          = "${openstack_networking_network_v2.network_6.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_6.id}"
    ip_address        = var.port_ip_db1
  }
}
resource "openstack_networking_port_v2" "port_3" {
  name                = "port_3"
  network_id          = "${openstack_networking_network_v2.network_6.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_6.id}"
    ip_address        = var.port_ip_fs1
  }
}
## SAN 2 network
resource "openstack_networking_port_v2" "port_4" {
  name                = "port_4"
  network_id          = "${openstack_networking_network_v2.network_5.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_5.id}"
    ip_address        = var.port_ip_ansibleMaster
  }
}
resource "openstack_networking_port_v2" "port_5" {
  name                = "port_5"
  network_id          = "${openstack_networking_network_v2.network_7.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_7.id}"
    ip_address        = var.port_ip_db2
  }
}
resource "openstack_networking_port_v2" "port_6" {
  name                = "port_6"
  network_id          = "${openstack_networking_network_v2.network_7.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_7.id}"
    ip_address        = var.port_ip_fs2
  }
}
## admin network
resource "openstack_networking_port_v2" "port_7" {
  name                = "port_7"
  network_id          = "${openstack_networking_network_v2.network_5.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_5.id}"
    ip_address        = var.port_ip_nas
  }
}
## dmz network
resource "openstack_networking_port_v2" "port_8" {
  name                = "port_8"
  network_id          = "${openstack_networking_network_v2.network_1.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_1.id}"
    ip_address        = var.port_ip_web
  }
}
# Connect the subnet to the router
resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_1.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_2" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_2.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_3" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_3.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_4" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_4.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_5" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_5.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_6" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_6.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_7" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnet_7.id}"
}

# Allocate Floating IP
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool                = var.fip_pool
}

resource "openstack_networking_floatingip_v2" "floatip_2" {
  pool                = var.fip_pool
}

## INSTANCE
# Create an instance
## SAN 1
resource "openstack_compute_instance_v2" "instance_1" {
  name                = var.VmServer
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}","${openstack_compute_secgroup_v2.secgroup_5.name}"]
  user_data           = var.cloudconfig_VmServer

  network {
    port              = "${openstack_networking_port_v2.port_1.id}"
  }
}
resource "openstack_compute_instance_v2" "instance_2" {
  name                = var.DbServer1
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}","${openstack_compute_secgroup_v2.secgroup_3.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_2.id}"
  }
}
resource "openstack_compute_instance_v2" "instance_3" {
  name                = var.FileServer1
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}","${openstack_compute_secgroup_v2.secgroup_4.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_3.id}"
  }
}
# Admin
resource "openstack_compute_instance_v2" "instance_4" {
  name                = var.AnsibleMaster
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_AnsibleMaster

  network {
    port              = "${openstack_networking_port_v2.port_4.id}"
  }
}
resource "null_resource" "copyFiles" {

connection {
    type = "ssh"
    user = "nisse"
    private_key = file("hydra_rsa")
    host = "${openstack_networking_floatingip_v2.floatip_2.address}" 
  }

  provisioner "file" {
    source = "../ansible/"
    destination = "~"

  }

  depends_on = [ openstack_compute_instance_v2.instance_4 ]

}
# SAN 2
resource "openstack_compute_instance_v2" "instance_5" {
  name                = var.DbServer2
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}","${openstack_compute_secgroup_v2.secgroup_3.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_5.id}"
  }
}
resource "openstack_compute_instance_v2" "instance_6" {
  name                = var.FileServer2
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}","${openstack_compute_secgroup_v2.secgroup_4.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_6.id}"
  }
}
# admin NAS
resource "openstack_compute_instance_v2" "instance_7" {
  name                = var.NAS
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_7.id}"
  }
}
# web
resource "openstack_compute_instance_v2" "instance_8" {
  name                = var.web
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_8.id}"
  }
}

# Associate Floating IP
resource "openstack_networking_floatingip_associate_v2" "fip_1" {
  floating_ip         = "${openstack_networking_floatingip_v2.floatip_1.address}"
  port_id             = "${openstack_networking_port_v2.port_8.id}"
}
resource "openstack_networking_floatingip_associate_v2" "fip_2" {
  floating_ip         = "${openstack_networking_floatingip_v2.floatip_2.address}"
  port_id             = "${openstack_networking_port_v2.port_4.id}"
}
