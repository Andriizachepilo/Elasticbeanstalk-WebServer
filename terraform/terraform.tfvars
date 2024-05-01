region = "eu-west-2"

#VPC
cidr_block         = "10.0.0.0/20"
dns_support        = true #remove later on and add DNS hostnames?
availability_zone  = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
private_cidr_block = ["10.0.9.0/24", "10.0.8.0/24", "10.0.7.0/24"]
public_cidr_block  = ["10.0.6.0/24", "10.0.5.0/24", "10.0.4.0/24"]


# S3-bucket


bucket_name   = "andruhabucket96"
force_destroy = true


#beanstalk 
create_elasticbeanstalk = false
beanstalk_app_name = "auth"
tier               = "WebServer"

keypair                     = "elb-key"
availability_zones_selector = "Any 3"
loadbalancer_type           = "Application"



#public environment
env_name                 = "public-env"
solution_stack_name      = "64bit Amazon Linux 2023 v6.1.2 running Node.js 20"
version_label            = "default1"
associate_public_address = true
environment_type         = "LoadBalanced"

lb_scheme      = "Public"
autoscale_max  = 1
autoscale_min  = 1
instance_type  = "t2.micro"
health_path   = "/"
MeasureName    = "CPUUtilization"
RootSize       = 8
RootVolumeType = "sc1"
application_port = 0
lb_protocol    = "HTTPS"

path_to_upload = "/Users/andriizachepilo/myproject/Elasticbeanstalk-WebServer/app/app.zip"
s3_key         = "bnstlk/app.zip"








