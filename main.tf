provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  # Additional configurations if needed
  acl = var.bucket_acl
  # Other configurations like versioning, logging, encryption, etc., can be added here

tags = {
    Name = var.bucket_tag_name
    Environment = var.bucket_tag_environment
  }

  versioning {
    enabled = var.enable_versioning
  }
  
  # Define other configurations like CORS, logging, encryption, etc., if needed
}

resource "aws_ecr_repository" "repository" {
  name = var.repo_name
}


resource "aws_security_group" "http_access" {
  name        = "http_access"
  description = "Allow HTTP access"
  vpc_id = var.vpc_id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "default_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}
