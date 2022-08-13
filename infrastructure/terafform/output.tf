output "vpc_id" {
  value = module.vpc.vpc_id
}


output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}


output "azs" {
  value = module.vpc.azs
}


output "public_subnets" {
  value = module.vpc.public_subnets
}


output "private_subnets" {
  value = module.vpc.private_subnets
}


output "aws_kms_key" {
  value = aws_kms_key.this.arn
}
