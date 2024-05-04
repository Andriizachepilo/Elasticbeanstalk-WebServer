module "Virtual_Private_Cloud" {
  source = "./modules/Netwkoring"

  cidr_block         = var.cidr_block
  dns_support        = var.dns_support
  availability_zone  = var.availability_zone
  private_cidr_block = var.private_cidr_block
  public_cidr_block  = var.public_cidr_block

}

module "Security_groups" {
  source = "./modules/Security"

  vpc_id = module.Virtual_Private_Cloud.vpc_id

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

  beanstalk_app_name  = var.beanstalk_app_name
  tier                = var.tier
  solution_stack_name = var.solution_stack_name
  version_label       = var.version_label
  env_name            = var.env_name
  environment_type    = var.environment_type

  vpc_id                   = module.Virtual_Private_Cloud.vpc_id
  ec2_subnets              = module.Virtual_Private_Cloud.public_subnets
  associate_public_address = var.associate_public_address

  loadbalancer_type   = var.loadbalancer_type
  lb_scheme           = var.lb_scheme
  lb_subnets          = module.Virtual_Private_Cloud.public_subnets
  loadbalancer_sg_80  = [module.Security_groups.http]
  loadbalancer_sg_443 = [module.Security_groups.https]
  StickinessEnabled   = var.StickinessEnabled
  proxy               = var.proxy

  lb_certificate_arn = var.lb_certificate_arn
  lb_ssl_policy      = var.lb_ssl_policy

  lb_protocol      = var.lb_protocol
  application_port = var.application_port
  health_path      = var.health_path

  asg_sg                      = [module.Security_groups.ec2_sg]
  availability_zones_selector = var.availability_zones_selector
  autoscale_max               = var.autoscale_max
  autoscale_min               = var.autoscale_min
  instance_type               = var.instance_type
  keypair                     = var.keypair
  RootVolumeType              = var.RootVolumeType
  RootSize                    = var.RootSize
  MeasureName                 = var.MeasureName

  s3object_id = module.S3-bucket.aws_s3_public_object
  s3bucket_id = module.S3-bucket.aws_s3_bucket_id
}
