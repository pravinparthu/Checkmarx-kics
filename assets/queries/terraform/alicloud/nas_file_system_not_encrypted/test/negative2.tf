resource "alicloud_nas_file_system" "foo2" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "tf-testAccNasConfig"
  encrypt_type  = "2"
}
