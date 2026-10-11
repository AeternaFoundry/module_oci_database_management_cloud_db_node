resource "oci_database_management_cloud_db_node" "database_management_cloud_db_nodes" {
  for_each = var.database_management_cloud_db_nodes

  cloud_db_node_id   = each.value.cloud_db_node_id
  cloud_connector_id = each.value.cloud_connector_id
  defined_tags       = each.value.defined_tags
  freeform_tags      = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

