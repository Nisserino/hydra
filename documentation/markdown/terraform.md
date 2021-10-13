# Terraform

## Prerequisites

This script assumes you already have a router with a specific ID in openstack  
Change the ID in `terraform/variables.tf` to match yours.  
It also assumes that you have a ssh key-pair on openstack named `Nietzsche`,  
aswell as the private key named `id_rsa` in `ansible/.ssh/id_rsa`
You will also need to replace the set ip in the security group allowing ssh from WAN.

In order to give your credentials to openstack  
you will need to source the project-script from openstack before running terraform commands.



## Usage

### First time

`terraform init`

### Build

`terraform apply -auto-approve`

For some reason, terraform needs to run the apply command twice to actually set the security groups.  

This will make the file-transfer a bit weird.  
Terraform is going to time-out on trying to ssh into the machine "AnsibleMaster",  
you can cancel this with `^c` and re-run the the apply command.  

This will set the security groups, and make it possible to transfer the files over ssh.  

### Destroy

`terraform destroy`

## Future features

### Volumes

We want to link volumes to some machines, to be able to have persistant data, and logs.  
The idea is to take snapshots of the important data and our logs,  
and have those snapshots on rolling backups.

### VPN

We want to set up a VPN server/service so that a 'client'  
can work inside the cloud as if you were connected in an office.

