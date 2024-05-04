resource "ansible_host" "spot-sev-ansible" {
  name   = "deploy_spot_sev"
  groups = ["toDeploy"]
  variables = {
    ansible_host      = openstack_compute_floatingip_v2.spot_sev_ip.address
    private_address   = openstack_compute_instance_v2.spot_sev_host.network.0.fixed_ip_v4
    ansible_user      = "step"
    private_interface = "ens3"
    public_interface  = "ens4"
  }
}
