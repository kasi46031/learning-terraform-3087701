data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "blog-ec2" {
  ami            = data.aws_ami.app_ami.id
  instance_type  = var.instance_type

  subnet_id               = module.blog_vpc.public_subnets[0]
  vpc_security_group_ids  = [module.blog_sg.security_group_id] 

}


module "blog_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c" ]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]


  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


module "blog_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  name = "blog-sg"

  vpc_id = module.blog_vpc.vpc_id
  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}


module "blog_alb" {
  source  = "terraform-aws-modules/alb/aws"
  name = "blog-alb"

  load_balancer_type = "application"

  vpc_id             = module.blog_vpc.vpc_id
  subnets            = module.blog_vpc.public_subnets
  security_groups    = [module.blog_sg.security_group_id]

  access_logs = {
    bucket = "my-alb-logs"
  }

  target_groups = [
    {
      name_prefix      = "blog-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = aws_instance.blog_ec2.id
          port = 80
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Dev"
  }
}

