provider "aws" {
  region  = "us-east-2"
  profile = "terraform-user"

}

#create vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    "Name" = "rds vpc"
  }

}

#create subnet
resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_a_cidr_block
  availability_zone = "us-east-2a"

  tags = {
    "Name" = "Subnet a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_b_cidr_block
  availability_zone = "us-east-2b"

  tags = {
    "Name" = "Subnet b"
  }
}



#create security group
resource "aws_security_group" "rds_sg" {
    vpc_id = aws_vpc.main.id
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    tags = {
      "Name" = "RDS Security Group"
    }
}


# create subnet group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-subnet-group"
  subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  tags = {
    Name = "RDS Subnet Group"
  }
  
}