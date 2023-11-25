variable "aws_region" {
  description = "The AWS region in which to launch the instance"
  default     = "ap-southeast-2"  // Change this to your preferred default region
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0df4b2961410d4cff"  // Update with your desired AMI ID
}

variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t2.micro"  // Update with your desired instance type
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  default     = "example-instance"  // Update with your desired instance name
}

variable "bucket_name" {
  description = "The name of the S3 bucket to be created"
  default     = "av-new" // Replace with your desired bucket name
}

variable "bucket_acl" {
  description = "The Access Control List (ACL) for the bucket"
  default     = "private" // Change as needed (private, public-read, etc.)
}

variable "bucket_tag_name" {
  description = "Name tag for the S3 bucket"
  default = "MyS3Bucket"
}

variable "bucket_tag_environment" {
  description = "Environment tag for the S3 bucket"
  default = "Production"
}

variable "enable_versioning" {
  description = "Enable versioning for the bucket"
  default = true
}

variable "repo_name" {
  description = "The name of the repository to be created"
  default     = "sample-ecr" // Replace with your desired repository name
}
