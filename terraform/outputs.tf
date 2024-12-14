output "cluster_name" {
  value       = aws_eks_cluster.cluster.id
  description = "The name of the EKS cluster"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.cluster.endpoint
  description = "The endpoint for the EKS cluster"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.ecr.repository_url
  description = "The URL of the ECR repository"
}

output "ecr_repository_id" {
  value = aws_ecr_repository.ecr.registry_id
}

output "ecr_repository_arn" {
  value = aws_ecr_repository.ecr.arn
}