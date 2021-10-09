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

resource "openstack_compute_instance_v2" "server" {
  for_each            = toset(var.instances_name)
  name                = each.key
  image_name          = var.image_name
  flavor_name         = var.flavor_name
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

