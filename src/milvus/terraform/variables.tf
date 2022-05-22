
# ------------------------------------- Node Count ------------------------------------- #
variable "index_count" {
  description = "Amount of index instances to run"
  type        = number
  default     = 1
}


variable "data_count" {
  description = "Amount of data instances to run"
  type        = number
  default     = 1
}

variable "query_count" {
  description = "Amount of query instances to run"
  type        = number
  default     = 1
}

variable "proxy_count" {
  description = "Amount of proxy instances to run"
  type        = number
  default     = 1
}

variable "root_coordinator_count" {
  description = "Amount of root_coordinator instances to run"
  type        = number
  default     = 1
}

variable "query_coordinator_count" {
  description = "Amount of query_coordinator instances to run"
  type        = number
  default     = 1
}

variable "index_coordinator_count" {
  description = "Amount of index_coordinator instances to run"
  type        = number
  default     = 1
}

variable "data_coordinator_count" {
  description = "Amount of data_coordinator instances to run"
  type        = number
  default     = 1
}

variable "minio_count" {
  description = "Amount of minio instances to run"
  type        = number
  default     = 1
}

variable "etcd_count" {
  description = "Amount of etcd instances to run"
  type        = number
  default     = 1
}

variable "pulsar_count" {
  description = "Amount of pulsar instances to run"
  type        = number
  default     = 1
}

# ------------------------------------- NODE TYPES ------------------------------------- #

variable "sending_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "c5.xlarge"
}

variable "index_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "c5.2xlarge"
}

variable "data_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "c5.2xlarge"
}

variable "query_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "c5.2xlarge"
}

variable "proxy_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "c5.2xlarge"
}

variable "root_coordinator_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

variable "query_coordinator_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

variable "index_coordinator_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

variable "data_coordinator_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

variable "minio_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

variable "etcd_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

variable "pulsar_ec2_type" {
  description = "Which server type"
  type        = string
  default     = "t2.xlarge"
}

# ------------------------------------- PERSONAL ------------------------------------- #

variable "key_name" {
  description = "Which aws key to use for access into instances, needs to be uploaded already"
  type        = string
  default     = "milvus"
}

variable "my_ip" {
  description = "my_ip for security group. used so that ansible and terraform can ssh in"
  type        = string
  default     = "0.0.0.0/0"
}

