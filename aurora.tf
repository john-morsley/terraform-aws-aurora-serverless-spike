/*                                    
    /\                             
   /  \  _   _ _ __ ___  _ __ __ _ 
  / /\ \| | | | '__/ _ \| '__/ _` |
 / ____ \ |_| | | | (_) | | | (_| |
/_/    \_\__,_|_|  \___/|_|  \__,_|

*/


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group
resource "aws_db_subnet_group" "private" {
  name       = "${var.cluster_name}-db-subnet-group"
  subnet_ids = module.aurora-vpc.private_subnet_ids // ToDo --> This needs to be private eventually.
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster
resource "aws_rds_cluster" "this" {

  //count = var.create_cluster ? 1 : 0

  //global_cluster_identifier = var.global_cluster_identifier
  cluster_identifier = var.cluster_name
  //replication_source_identifier       = var.replication_source_identifier
  //source_region                       = var.source_region
  engine         = var.engine
  engine_mode    = var.engine_mode
  engine_version = var.engine_version
  //allow_major_version_upgrade         = var.allow_major_version_upgrade
  //enable_http_endpoint                = var.enable_http_endpoint
  //kms_key_id                          = var.kms_key_id
  //database_name                       = var.database_name
  master_username = var.master_username
  master_password = random_password.master_password.result
  //final_snapshot_identifier           = "${var.final_snapshot_identifier_prefix}-${var.name}-${element(concat(random_id.snapshot_identifier.*.hex, [""]), 0)}"
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection
  //backup_retention_period             = var.backup_retention_period
  //preferred_backup_window             = var.preferred_backup_window
  //preferred_maintenance_window        = var.preferred_maintenance_window
  port                   = 5432 #local.port
  db_subnet_group_name   = aws_db_subnet_group.private.name
  vpc_security_group_ids = [aws_security_group.aurora-application-access.id]
  //snapshot_identifier                 = var.snapshot_identifier
  //storage_encrypted                   = var.storage_encrypted
  //apply_immediately                   = var.apply_immediately
  //db_cluster_parameter_group_name     = var.db_cluster_parameter_group_name
  //iam_database_authentication_enabled = var.iam_database_authentication_enabled
  //backtrack_window                    = local.backtrack_window
  //copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  //iam_roles                           = var.iam_roles

  //enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  # Only required when 'engine_mode' is 'serverless'.
  dynamic "scaling_configuration" {
    for_each = var.scaling_configuration[*]
    content {
      auto_pause               = scaling_configuration.value.auto_pause
      max_capacity             = scaling_configuration.value.max_capacity
      min_capacity             = scaling_configuration.value.min_capacity
      seconds_until_auto_pause = scaling_configuration.value.seconds_until_auto_pause
      timeout_action           = scaling_configuration.value.timeout_action
    }
  }

  tags = var.tags

}