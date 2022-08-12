
data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "FT-cluster-devops4"
  cluster_version = "1.21"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {}
    kube-proxy = {}
    vpc-cni = {
    //  resolve_conflicts = "OVERWRITE"
    }
  }
    
  cluster_encryption_config = [{
    provider_key_arn = aws_kms_key.this.arn
    resources        = ["secrets"]
  }]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_group_defaults = {
    disk_size      = 30
  }
  eks_managed_node_groups = {
    
    node = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
    }
  }

# AWS-AUTH Configmap
manage_aws_auth_configmap = true

aws_auth_roles = [
  {
    rolearn  = "arn:aws:iam::114590890903:role/eksClusterRole"
    username = "eksClusterRole"
    groups   = ["system:masters"]
  },

]
aws_auth_users = [
  {
    userarn  = "arn:aws:iam::114590890903:user/devops4"
    username = "devops4"
    groups   = ["system:masters"]
  },

]

aws_auth_accounts = [
  "000000000000:",
]

 tags = {
   Environment = "dev"
   Terraform   = "true"
  }
}