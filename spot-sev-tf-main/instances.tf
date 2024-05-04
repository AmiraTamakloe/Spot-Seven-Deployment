data "openstack_images_image_v2" "default" {
  name        = var.image_name
  most_recent = true
}

data "openstack_compute_flavor_v2" "default" {
  vcpus = 2
  ram   = 4096
}

resource "openstack_compute_instance_v2" "spot_sev_host" {

  name            = "LOG3900-103-host"
  image_id        = data.openstack_images_image_v2.default.id
  flavor_id       = data.openstack_compute_flavor_v2.default.id
  key_pair        = var.key_pair
  security_groups = ["ssh","web"]
  network {
    name = var.private_network_name
  }
}

resource "openstack_compute_floatingip_v2" "spot_sev_ip" {
  pool = var.public_network_name
}

resource "openstack_compute_floatingip_associate_v2" "spot_sev_ip" {
    floating_ip = openstack_compute_floatingip_v2.spot_sev_ip.address
    instance_id = openstack_compute_instance_v2.spot_sev_host.id
    fixed_ip = openstack_compute_instance_v2.spot_sev_host.network.0.fixed_ip_v4
}
