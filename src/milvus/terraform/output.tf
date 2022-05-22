output "index_ids" {
  description = "IDs of the index instance"
  value       = aws_instance.index_node.*.id
}
output "data_ids" {
  description = "IDs of the data instance"
  value       = aws_instance.data_node.*.id
}
output "query_ids" {
  description = "IDs of the query instance"
  value       = aws_instance.query_node.*.id
}
output "proxy_ids" {
  description = "IDs of the proxy instance"
  value       = aws_instance.proxy_node.*.id
}
output "root_coordinator_ids" {
  description = "IDs of the proot_coordinator instance"
  value       = aws_instance.root_coordinator_node.*.id
}

output "query_coordinator_ids" {
  description = "IDs of the query_coordinator instance"
  value       = aws_instance.query_coordinator_node.*.id
}

output "index_coordinator_ids" {
  description = "IDs of the index_coordinator instance"
  value       = aws_instance.index_coordinator_node.*.id
}

output "data_coordinator_ids" {
  description = "IDs of the data_coordinator instance"
  value       = aws_instance.data_coordinator_node.*.id
}
output "minio_ids" {
  description = "IDs of the minio instance"
  value       = aws_instance.minio_node.*.id
}
output "etcd_ids" {
  description = "IDs of the etcd instance"
  value       = aws_instance.etcd_node.*.id
}
output "pulsar_ids" {
  description = "IDs of the pulsar instance"
  value       = aws_instance.pulsar_node.*.id
}


# output "sending_ips_public" {
#   description = "Public IP addresses of the sending instance"
#   value       = aws_instance.sending_node.*.public_ip
# }

output "index_ips_public" {
  description = "Public IP addresses of the index instance"
  value       = aws_instance.index_node.*.public_ip
}
output "data_ips_public" {
  description = "Public IP addresses of the data instance"
  value       = aws_instance.data_node.*.public_ip
}
output "query_ips_public" {
  description = "Public IP addresses of the query instance"
  value       = aws_instance.query_node.*.public_ip
}
output "proxy_ips_public" {
  description = "Public IP addresses of the proxy instance"
  value       = aws_instance.proxy_node.*.public_ip
}
output "root_coordinator_ips_public" {
  description = "Public IP addresses of the root_coordinator instance"
  value       = aws_instance.root_coordinator_node.*.public_ip
}
output "query_coordinator_ips_public" {
  description = "Public IP addresses of the query_coordinator instance"
  value       = aws_instance.query_coordinator_node.*.public_ip
}
output "index_coordinator_ips_public" {
  description = "Public IP addresses of the index_coordinator instance"
  value       = aws_instance.index_coordinator_node.*.public_ip
}
output "data_coordinator_ips_public" {
  description = "Public IP addresses of the data_coordinator instance"
  value       = aws_instance.data_coordinator_node.*.public_ip
}
output "minio_ips_public" {
  description = "Public IP addresses of the minio instance"
  value       = aws_instance.minio_node.*.public_ip
}
output "etcd_ips_public" {
  description = "Public IP addresses of the etcd instance"
  value       = aws_instance.etcd_node.*.public_ip
}
output "pulsar_ips_public" {
  description = "Public IP addresses of the pulsar instance"
  value       = aws_instance.pulsar_node.*.public_ip
}


output "index_ips_private" {
  description = "private IP addresses of the index instance"
  value       = aws_instance.index_node.*.private_ip
}
output "data_ips_private" {
  description = "private IP addresses of the data instance"
  value       = aws_instance.data_node.*.private_ip
}
output "query_ips_private" {
  description = "private IP addresses of the query instance"
  value       = aws_instance.query_node.*.private_ip
}
output "proxy_ips_private" {
  description = "private IP addresses of the proxy instance"
  value       = aws_instance.proxy_node.*.private_ip
}
output "root_coordinator_ips_private" {
  description = "private IP addresses of the root_coordinator instance"
  value       = aws_instance.root_coordinator_node.*.private_ip
}
output "query_coordinator_ips_private" {
  description = "private IP addresses of the query_coordinator instance"
  value       = aws_instance.query_coordinator_node.*.private_ip
}
output "index_coordinator_ips_private" {
  description = "private IP addresses of the index_coordinator instance"
  value       = aws_instance.index_coordinator_node.*.private_ip
}
output "data_coordinator_ips_private" {
  description = "private IP addresses of the data_coordinator instance"
  value       = aws_instance.data_coordinator_node.*.private_ip
}
output "minio_ips_private" {
  description = "private IP addresses of the minio instance"
  value       = aws_instance.minio_node.*.private_ip
}
output "etcd_ips_private" {
  description = "private IP addresses of the etcd instance"
  value       = aws_instance.etcd_node.*.private_ip
}
output "pulsar_ips_private" {
  description = "private IP addresses of the pulsar instance"
  value       = aws_instance.pulsar_node.*.private_ip
}


resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
      index_ips_public: aws_instance.index_node.*.public_ip
      query_ips_public: aws_instance.query_node.*.public_ip
      data_ips_public: aws_instance.data_node.*.public_ip
      proxy_ips_public: aws_instance.proxy_node.*.public_ip

      root_coordinator_ips_public: aws_instance.root_coordinator_node.*.public_ip
      query_coordinator_ips_public: aws_instance.query_coordinator_node.*.public_ip
      index_coordinator_ips_public: aws_instance.index_coordinator_node.*.public_ip
      data_coordinator_ips_public: aws_instance.data_coordinator_node.*.public_ip

      minio_ips_public: aws_instance.minio_node.*.public_ip
      pulsar_ips_public: aws_instance.pulsar_node.*.public_ip
      etcd_ips_public: aws_instance.etcd_node.*.public_ip

      index_ips_private: aws_instance.index_node.*.private_ip
      query_ips_private: aws_instance.query_node.*.private_ip
      data_ips_private: aws_instance.data_node.*.private_ip
      proxy_ips_private: aws_instance.proxy_node.*.private_ip

      root_coordinator_ips_private: aws_instance.root_coordinator_node.*.private_ip
      query_coordinator_ips_private: aws_instance.query_coordinator_node.*.private_ip
      index_coordinator_ips_private: aws_instance.index_coordinator_node.*.private_ip
      data_coordinator_ips_private: aws_instance.data_coordinator_node.*.private_ip

      minio_ips_private: aws_instance.minio_node.*.private_ip
      pulsar_ips_private: aws_instance.pulsar_node.*.private_ip
      etcd_ips_private: aws_instance.etcd_node.*.private_ip
 }
 )
 filename = "${path.module}/ansible/inventory"
}