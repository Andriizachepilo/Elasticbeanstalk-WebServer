variable "dns_support" {
  description = "Whether DNS support is enabled for the VPC."
  type        = bool
}

variable "public_cidr_block" {
  description = "List of public CIDR blocks for subnets."
  type        = list(string)
}

variable "availability_zone" {
  description = "List of availability zones to deploy resources."
  type        = list(string)
}

variable "private_cidr_block" {
  description = "List of private CIDR blocks for subnets."
  type        = list(string)
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "force_destroy" {
  description = "Boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  type        = bool
}

variable "create_elasticbeanstalk" {
  description = "Whether to create an Elastic Beanstalk environment."
  type        = bool
}

variable "tier" {
  description = "The tier type for the Elastic Beanstalk environment (e.g., WebServer, Worker)."
  type        = string
}

variable "availability_zones_selector" {
  description = "String to select specific availability zones."
  type        = string
}

variable "loadbalancer_type" {
  description = "The type of load balancer (e.g., application, network)."
  type        = string
}

variable "s3_key" {
  description = "The S3 key where the application code is stored."
  type        = string
}

variable "path_to_upload" {
  description = "The local path to the application code to be uploaded to S3."
  type        = string
}

variable "beanstalk_app_name" {
  description = "The name of the Elastic Beanstalk application."
  type        = string
}

variable "associate_public_address" {
  description = "Whether to associate a public IP address with the EC2 instances."
  type        = bool
}

variable "lb_scheme" {
  description = "The load balancer scheme (e.g., internet-facing, internal)."
  type        = string
}

variable "application_port" {
  description = "The port on which the application listens."
  type        = number
}

variable "lb_protocol" {
  description = "The protocol used by the load balancer (e.g., HTTP, HTTPS)."
  type        = string
}

variable "autoscale_min" {
  description = "The minimum number of instances in the autoscaling group."
  type        = number
}

variable "autoscale_max" {
  description = "The maximum number of instances in the autoscaling group."
  type        = number
}

variable "instance_type" {
  description = "The type of instance to use for the Elastic Beanstalk environment."
  type        = string
}

variable "keypair" {
  description = "The name of the key pair to use for SSH access to the instances."
  type        = string
}

variable "environment_type" {
  description = "The type of environment for Elastic Beanstalk (e.g., LoadBalanced, SingleInstance)."
  type        = string
}

variable "solution_stack_name" {
  description = "The solution stack to use for the Elastic Beanstalk environment (e.g., 64bit Amazon Linux 2 v3.2.2 running Node.js 12)."
  type        = string
}

variable "version_label" {
  description = "The version label of the application to deploy in Elastic Beanstalk."
  type        = string
}

variable "health_path" {
  description = "The path to the health check endpoint for the application."
  type        = string
}

variable "MeasureName" {
  description = "The name of the CloudWatch metric to measure (e.g., CPUUtilization)."
  type        = string
  default     = "CPUUtilization"
}

variable "RootSize" {
  description = "The size of the root volume in GB."
  type        = number
}

variable "RootVolumeType" {
  description = "The type of the root volume (e.g., gp2, io1)."
  type        = string
}

variable "env_name" {
  description = "The name of the environment."
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "StickinessEnabled" {
  description = "Whether stickiness is enabled for the load balancer."
  type        = bool
}

variable "proxy" {
  description = "The proxy type to use (e.g., nginx)."
  type        = string
  default     = "nginx"
}

variable "lb_ssl_policy" {
  description = "The SSL policy for the load balancer."
  type        = string
}

variable "lb_certificate_arn" {
  description = "The ARN of the SSL certificate for the load balancer."
  type        = string
}
