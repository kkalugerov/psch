locals {
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.final_snapshot_identifier_prefix}-${var.identifier}-${try(random_id.snapshot_identifier[0].hex, "")}"
}
