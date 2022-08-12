terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
  
}

resource "aws_kms_key" "this" {
  description              = "key_from_terra"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  deletion_window_in_days  = 7
}
//resource "aws_vpc" "final-task-vpc-devops4" {
  //  cidr_block = "10.0.0.0/16"
    //tags = {
     // Name = "final-task-vpc-devops4"
    //}
//}

//resource "aws_subnet" "public_subnets" {
  //vpc_id     = aws_vpc.final-task-vpc-devops4.id
  //cidr_block = "10.0.100.0/24"
//}

//resource "aws_subnet" "private_subnets" {
  //vpc_id     = aws_vpc.final-task-vpc-devops4.id
  //cidr_block = "10.0.1.0/24"
//}

//resource "aws_s3_bucket" "s3_bucket" {
  //cidr_block = "10.0.0.0/16"
//}