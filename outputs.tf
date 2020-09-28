output "msk_configuration_revision" {
  value = aws_msk_configuration.msk_cluster_configuration.latest_revision
}
