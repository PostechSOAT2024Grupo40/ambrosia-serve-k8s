output "cluster_name" {
  value = aws_eks_cluster.cluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

output "ecr_repository_id" {
  value = aws_ecr_repository.ecr.registry_id
}

output "ecr_repository_arn" {
  value = aws_ecr_repository.ecr.arn
}

output "vpc_arn" {
  value = aws_vpc.ambrosia_serve_vpc.arn
}

output "subnet_public_a_id" {
  value = aws_subnet.subnet_public_a.id
}

output "subnet_public_b_id" {
  value = aws_subnet.subnet_public_b.id
}

output "subnet_private_a_id" {
  value = aws_subnet.subnet_private_a.id
}

output "subnet_private_b_id" {
  value = aws_subnet.subnet_private_b.id
}

output "security_group_id" {
  value = aws_security_group.sg.id
}
