# Major changes from order

## Network

### Subnet sizes
Originally the subnets were set with /27 netmasks.  
We felt this was unneccacarily complicated as it makes it much harder to troubleshoot.
  
To make troubleshooting easier we made /24 networks, one for each department/relevant section.

### Ip-ranges
We also set some rules for what different ip addresses _should_ mean.
> 192.168.x.1 - 192.168.x.49: network units  
> 192.168.x.50 - 192.168.x.99: servers  
> 192.168.x.100 - 192.168.x.254: clients
  
This setup makes it easy to identify device based on the ip address when inspecting logs during troubleshooting  
  
The only downside with this is that every adress from 1-99 has to be set manually, and the dhcp sets the clients ipadresses.
  
If you want to know which department a request came from, or is going to,
_x_ in the example will tell you what to look up in the documentation.
  
In hindsight, having 49 adresses for network units is quite overkill on the cloud, with what is supposed to run on it as it looks today.
The thought to have that many emerged from the real-world setup scenario, 
where the company wanted ip-cameras, which then would be put in the 1-49 range.
  
This could have also been done by having a dedicated subnet for the ipcameras, 
but it feels nice to keep general rules to make it quick and easy to get an idea of what's happening reading logs.

## Instances

### VmServer(2)
Since we are running on the cloud, and after some discussion with our consult _hxp_, 
we decided it was unneccecary to have two vm-servers.  
  
The server in question was supposed to be used as a backup incase the main vm-server goes down.
But since it's only supposed to host 'in-house' applications, 
the risk of getting overloaded is small enough that the cost is too great compared to what we would gain.
  
If the server goes down, it will be easy to get it up and running again, and since we are using volumes, 
the data is persistant. We would get some downtime, but no data loss.

### AnsibleMaster

We decided to use ansible to configure all the machines.
To make the process as easy as possible, we wanted to have the ansible master running inside of the cloud. 
This also means that we don't need to open the ssh-ports to wan on every instance.

