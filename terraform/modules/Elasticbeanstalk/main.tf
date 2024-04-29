resource "aws_elastic_beanstalk_application" "auth_app" {
  name = var.beanstalk_app_name
}

resource "aws_elastic_beanstalk_application_version" "public_version" {
  count       = var.create_elasticbeanstalk ? 1 : 0
  name        = var.version_label
  application = aws_elastic_beanstalk_application.auth_app.name
  bucket      = var.s3bucket_id
  key         = var.s3object_id
}


resource "aws_elastic_beanstalk_environment" "public_environnment" {
  count               = var.create_elasticbeanstalk ? 1 : 0
  name                = var.env_name
  application         = aws_elastic_beanstalk_application.auth_app.name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier          # webserver
  version_label       = "default1" #a uniq version for this environmnet



  setting {
    namespace = "aws:ec2:vpc"
    name      = "vpcId"
    value     = var.vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBscheme"
    value     = var.lb_scheme
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = var.associate_public_address
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", sort(var.ec2_subnets))
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = join(",", var.asg_sg)
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = var.availability_zones_selector
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.autoscale_min
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.autoscale_max
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.keypair
  }

  #lb#####

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.environment_type
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "Loadbalancertype"
    value     = var.loadbalancer_type
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = join(",", sort(var.lb_subnets))
  }

  #  setting {
  #     # namespace = "aws:elbv2:loadbalancer"
  #     # name      = "SecurityGroups"
  #     namespace = "aws:elb:loadbalancer"
  #     name      = "ManagedSecurityGroup"
  #     value     = join(",", var.public_env_lb_sg)
  #   }


  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Port"
    value     = var.port
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Protocol"
    value     = var.lb_protocol
  }



  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.keypair
  }


  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.ec2_iam_instance_profile1.name #issue
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = aws_iam_role.service_role321.name #issue
  }

  setting {
    namespace = "aws:elbv2:listener:default"
    name      = "ListenerEnabled"
    value     = var.listener_enabled
  }

  #  {
  #               - name      = "ProxyServer"
  #               - namespace = "aws:elasticbeanstalk:environment:proxy"
  #               - resource  = ""
  #               - value     = "nginx"
  #             }
  # - {
  #               - name      = "ExternalExtensionsS3Bucket"
  #               - namespace = "aws:elasticbeanstalk:environment"
  #               - resource  = ""
  #               - value     = ""
  #             },
  #           - {
  #               - name      = "ExternalExtensionsS3Key"
  #               - namespace = "aws:elasticbeanstalk:environment"
  #               - resource  = ""
  #               - value     = ""
  #             },
  #not the same 








  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = var.health_path
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "StickinessEnabled"
    value     = true #false ? sg for load balancer ????
  }



  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeType"
    value     = var.RootVolumeType
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = var.RootSize
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = var.MeasureName
  }


}


data "aws_iam_policy_document" "service_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["elasticbeanstalk.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "service_role321" {
  name               = "service" #this one 
  assume_role_policy = data.aws_iam_policy_document.service_role.json
}

resource "aws_iam_role_policy_attachment" "service_attachment_01" {
  role       = aws_iam_role.service_role321.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_role_policy_attachment" "service_attachment_02" {
  role       = aws_iam_role.service_role321.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"
}

#ec2
data "aws_iam_policy_document" "ec2_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2-role" #this one 
  assume_role_policy = data.aws_iam_policy_document.ec2_role.json
}

resource "aws_iam_instance_profile" "ec2_iam_instance_profile1" {
  name = "iam-instance-profile228"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "policy_attachment_1" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

