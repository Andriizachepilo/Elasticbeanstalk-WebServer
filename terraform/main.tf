module "Virtual_Private_Cloud" {
  source = "./modules/Netwkoring"

  cidr_block           = var.cidr_block
  dns_support          = var.dns_support
  availability_zone    = var.availability_zone
  private_cidr_block   = var.private_cidr_block
  public_cidr_block    = var.public_cidr_block
  db_subnet_group_name = var.db_subnet_group_name
}

module "Security_groups" {
  source = "./modules/Security"

  vpc_id = module.Virtual_Private_Cloud.vpc_id

}

module "docdb" {
  source = "./modules/docdb"

  db_subnet_group_name = var.db_subnet_group_name
  docdb_sg             = [module.Security_groups.my_sg]
  engine               = var.engine
  engine_version       = var.engine_version
  db_port              = var.db_port
  skip_final_snapshot  = var.skip_final_snapshot
  instance_class       = var.instance_class

  master_password = var.master_password
  master_username = var.master_username
  create_elasticbeanstalk = var.create_elasticbeanstalk

}

module "S3-bucket" {
  source = "./modules/S3-bucket"

  bucket_name   = var.bucket_name
  force_destroy = var.force_destroy

  s3_key         = var.s3_key
  path_to_upload = var.path_to_upload



}

module "elasticbeanstalk" {
  source                  = "./modules/Elasticbeanstalk"
  create_elasticbeanstalk = var.create_elasticbeanstalk

  beanstalk_app_name = var.beanstalk_app_name
  tier               = var.tier
  solution_stack_name      = var.solution_stack_name
  version_label            = var.version_label

  vpc_id                      = module.Virtual_Private_Cloud.vpc_id
  ec2_subnets                 = module.Virtual_Private_Cloud.public_subnets

  lb_subnets                  = module.Virtual_Private_Cloud.public_subnets
    availability_zones_selector = var.availability_zones_selector


  autoscale_max            = var.autoscale_max
  autoscale_min            = var.autoscale_min
  asg_sg                   = [module.Security_groups.my_sg]
  associate_public_address = var.associate_public_address
  environment_type         = var.environment_type
  lb_protocol              = var.lb_protocol
  lb_sg                    = [module.Security_groups.my_sg]
  env_name                 = var.env_name
  port                     = var.port
  health_path              = var.health_path
  instance_type            = var.instance_type
  lb_scheme                = var.lb_scheme
  s3object_id              = module.S3-bucket.aws_s3_public_object
  
  keypair                  = var.keypair
  RootVolumeType           = var.RootVolumeType
  MeasureName              = var.MeasureName
  listener_enabled         = var.listener_enabled
  s3bucket_id              = module.S3-bucket.aws_s3_bucket_id
  loadbalancer_type        = var.loadbalancer_type
  RootSize                 = var.RootSize


}
