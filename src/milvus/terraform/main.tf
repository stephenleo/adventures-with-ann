terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_security_group" "cluster_sg" {
  name        = "cluster_sg"
  description = "Allows only me to access"
  vpc_id      = aws_vpc.cluster_vpc.id

  ingress {
    description      = "All ports from my IP"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = [var.my_ip]
  }

  ingress {
    description      = "Full subnet communication"
    from_port        = 0
    to_port          = 65535
    protocol         = "all"
    self             = true
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "cluster_sg"
  }
}

resource "aws_vpc" "cluster_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "cluster_vpc"
  }
}

resource "aws_internet_gateway" "cluster_gateway" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = "cluster_gateway"
  }
}

resource "aws_subnet" "cluster_subnet" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "cluster_subnet"
  }
}

resource "aws_route_table" "cluster_subnet_gateway_route" {
  vpc_id       = aws_vpc.cluster_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cluster_gateway.id
  }

  tags = {
    Name = "cluster_subnet_gateway_route"
  }
}

resource "aws_route_table_association" "cluster_subnet_add_gateway" {
  subnet_id      = aws_subnet.cluster_subnet.id
  route_table_id = aws_route_table.cluster_subnet_gateway_route.id
}

# resource "aws_instance" "sending_node" {
#   ami           = "ami-0d8d212151031f51c"
#   instance_type = var.sending_ec2_type
#   key_name      = var.key_name
#   subnet_id     = aws_subnet.cluster_subnet.id
#   vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
#   tags = {
#     Name = "sending_node"
#   }
# }


resource "aws_instance" "index_node" {
  count         = var.index_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.index_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "index-${count.index + 1}"
  }
}

resource "aws_instance" "data_node" {
  count         = var.data_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.data_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "data-${count.index + 1}"
  }
}

resource "aws_instance" "query_node" {
  count         = var.query_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.query_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "query-${count.index + 1}"
  }
}

resource "aws_instance" "proxy_node" {
  count         = var.proxy_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.proxy_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "proxy-${count.index + 1}"
  }
}

resource "aws_instance" "root_coordinator_node" {
  count         = var.root_coordinator_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.root_coordinator_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "root_coordinator-${count.index + 1}"
  }
}

resource "aws_instance" "query_coordinator_node" {
  count         = var.query_coordinator_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.query_coordinator_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "query_coordinator-${count.index + 1}"
  }
}

resource "aws_instance" "index_coordinator_node" {
  count         = var.index_coordinator_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.index_coordinator_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "index_coordinator-${count.index + 1}"
  }
}

resource "aws_instance" "data_coordinator_node" {
  count         = var.data_coordinator_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.data_coordinator_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  
  tags = {
    Name = "data_coordinator-${count.index + 1}"
  }
}

resource "aws_instance" "minio_node" {
  count         = var.minio_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.minio_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = 1000
  }
  
  tags = {
    Name = "minio-${count.index + 1}"
  }
}

resource "aws_instance" "etcd_node" {
  count         = var.etcd_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.etcd_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = 1000
  }
  
  tags = {
    Name = "etcd-${count.index + 1}"
  }
}

resource "aws_instance" "pulsar_node" {
  count         = var.pulsar_count
  ami           = "ami-0d8d212151031f51c"
  instance_type = var.pulsar_ec2_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.cluster_subnet.id
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = 1000
  }
  
  tags = {
    Name = "pulsar-${count.index + 1}"
  }
}






