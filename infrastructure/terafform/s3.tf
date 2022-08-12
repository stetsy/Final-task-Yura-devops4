//module "s3_bucket" {
  //source = "terraform-aws-modules/s3-bucket/aws"

  //bucket = "s3-final-task-devops4"
  //acl    = "private"

  //versioning = {
    //enabled = false
  //}

//}
terraform {
   backend "s3" {
     bucket         = "s3-final-task-devops4"
     key            = "terraform.tfstate"
     region         = "us-west-2"
   }
}