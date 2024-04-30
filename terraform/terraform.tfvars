#VPC
cidr_block         = "10.0.0.0/20"
dns_support        = true #remove later on and add DNS hostnames?
availability_zone  = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
private_cidr_block = ["10.0.9.0/24", "10.0.8.0/24", "10.0.7.0/24"]
public_cidr_block  = ["10.0.6.0/24", "10.0.5.0/24", "10.0.4.0/24"]

#mongo
db_subnet_group_name = "db_subnet_group"

engine              = "docdb"
engine_version      = "5.0.0"
db_port             = 27017
skip_final_snapshot = true
instance_class      = "db.t3.medium"
master_username     = "mongo_name"
master_password     = "mongo_pass"



#Security Groups

# ingress_traffic = {
#   "HTTP"  = { from_port = 80, to_port = 80, protocol = "tcp", cidr_block = ["0.0.0.0/0"] }
#   "HTTPS" = { from_port = 443, to_port = 443, protocol = "tcp", cidr_block = ["0.0.0.0/0"] }
# }

# egress_traffic = {
#   "all_traffic" = { from_port = 0, to_port = 0, protocol = "tcp", cidr_block = ["0.0.0.0/0"] }
# }

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
listener_enabled            = true

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
RootVolumeType = "gp2"
port           = 80
lb_protocol    = "HTTP"

path_to_upload = "/Users/andriizachepilo/myproject/Elasticbeanstalk-WebServer/app/app.zip"
s3_key         = "bnstlk/app.zip"








