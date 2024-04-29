resource "aws_docdb_cluster" "docdb" {
  engine                 = var.engine
  engine_version         = var.engine_version
  master_username        = local.db_username
  master_password        = local.db_password
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = var.db_subnet_group_name
  port                   = var.db_port
  vpc_security_group_ids = var.docdb_sg

}

resource "aws_docdb_cluster_instance" "docdb_instance" {
 
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.instance_class
  engine             = var.engine

}

# data "aws_secretsmanager_secret" "username" {
#   name = var.master_username
# }

# data "aws_secretsmanager_secret" "password" {
#   name = var.master_password
# }

# data "aws_secretsmanager_secret_version" "current_username" {
#   secret_id = data.aws_secretsmanager_secret.username.id
# }

# data "aws_secretsmanager_secret_version" "current_password" {
#   secret_id = data.aws_secretsmanager_secret.password.id
# }

# locals {
#   db_username = jsondecode(data.aws_secretsmanager_secret_version.current_username.secret_string)
#   db_password = jsondecode(data.aws_secretsmanager_secret_version.current_password.secret_string)
# }
data "aws_secretsmanager_secret" "mongo_credentials" {
  name = "mongo_credentials"
}

data "aws_secretsmanager_secret_version" "current_username" {
  secret_id = data.aws_secretsmanager_secret.mongo_credentials.id
}

data "aws_secretsmanager_secret_version" "current_password" {
  secret_id = data.aws_secretsmanager_secret.mongo_credentials.id
}

locals {
  db_username = jsondecode(data.aws_secretsmanager_secret_version.current_username.secret_string)["mongo_name"]
  db_password = jsondecode(data.aws_secretsmanager_secret_version.current_password.secret_string)["mongo_pass"]
}
