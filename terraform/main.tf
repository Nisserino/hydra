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

resource "openstack_networking_network_v2" "network" {
for_each = var.networks
name = each.key
}

resource "openstack_networking_subnet_v2" "subnets" {
for_each        = var.networks
name            = each.key
network_id      = "${openstack_networking_network_v2.network[each.key].id}"
cidr            = each.value
ip_version      = 4
dns_nameservers = var.dns_ip
}

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
  description         = "Terraform SH for Port 22"

  rule {
    from_port         = 22
    to_port           = 22
    ip_protocol       = "tcp"
    cidr              = "0.0.0.0/0" # only for demo purposes, tighten up in live scenario
  }
}

# Create a port
## SAN 1 network
 resource "openstack_networking_port_v2" "port" {
  for_each = var.instances

  name           = each.key
  network_id     = "${openstack_networking_network_v2.network[each.value[1]]}"
  admin_state_up = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]
  
  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets[each.value[1]].id}"
    ip_address        = each.value[0]
  }
 }

 resource "openstack_networking_port_v2" "port_1" {
  name                = "port_1"
  network_id          = "${openstack_networking_network_v2.network["SAN1"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["SAN1"].id}"
    ip_address        = var.instances["VmServer"]
  }
}

resource "openstack_networking_port_v2" "port_2" {
  name                = "port_2"
  network_id          = "${openstack_networking_network_v2.network["SAN1"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["SAN1"].id}"
    ip_address        = var.instances["DbServer1"]
  }
}
resource "openstack_networking_port_v2" "port_3" {
  name                = "port_3"
  network_id          = "${openstack_networking_network_v2.network["SAN1"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["SAN1"].id}"
    ip_address        = var.instances["FileServer1"]
  }
}
## SAN 2 network
resource "openstack_networking_port_v2" "port_4" {
  name                = "port_4"
  network_id          = "${openstack_networking_network_v2.network["IT-admin"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["IT-admin"].id}"
    ip_address        = var.instances["AnsibleMaster"]
  }
}
resource "openstack_networking_port_v2" "port_5" {
  name                = "port_5"
  network_id          = "${openstack_networking_network_v2.network["SAN2"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["SAN2"].id}"
    ip_address        = var.instances["DbServer2"]
  }
}
resource "openstack_networking_port_v2" "port_6" {
  name                = "port_6"
  network_id          = "${openstack_networking_network_v2.network["SAN2"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["SAN2"].id}"
    ip_address        = var.instances["FileServer2"]
  }
}
## admin network
resource "openstack_networking_port_v2" "NAS" {
  name                = "port_7"
  network_id          = "${openstack_networking_network_v2.network["IT-admin"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["IT-admin"].id}"
    ip_address        = var.instances["NAS"]
  }
}
## dmz network
resource "openstack_networking_port_v2" "web" {
  name                = "port_8"
  network_id          = "${openstack_networking_network_v2.network["DMZ"].id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnets["DMZ"].id}"
    ip_address        = var.instances["web"]
  }
}
# Connect the subnet to the router
resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["DMZ"].id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_2" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["Film/foto"].id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_3" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["HR/ekonomi"].id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_4" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["R&D"].id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_5" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["IT-admin"].id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_6" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["SAN1"].id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_7" {
  router_id           = var.router_id
  subnet_id           = "${openstack_networking_subnet_v2.subnets["SAN2"].id}"
}

resource "openstack_compute_instance_v2" "server" {
  for_each            = var.instances
  name                = each.key
  image_name          = var.image_name
  flavor_name         = var.flavor_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_web
  network {
  port              = "${openstack_networking_port_v2.port[each.key].id}"
}
}
