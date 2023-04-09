module "eks"{
  source = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
  cluster_name = "sysmon-eks-cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true
  
  vpc_id = module.sysmon-vpc.vpc_id
  subnet_ids = module.sysmon-vpc.private_subnets

  tags = {
    environment = "development"
    application = "sysmonapp"
  }

  eks_managed_node_groups = {
    dev = {
      max_size = 3
      min_size = 1
      desired_size = 2

      instance_type = ["t2.small"]
    }
  }
}