output "public_ip" {
   value = ["${google_compute_instance.vms.*.network_interface.0.access_config.0.assigned_nat_ip}"]
}
