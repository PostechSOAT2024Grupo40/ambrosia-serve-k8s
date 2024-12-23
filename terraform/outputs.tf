output "cluster_name" {
  value = aws_eks_cluster.cluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "vpc_arn" {
  value = data.aws_vpc.ambrosia_serve_vpc.arn
}

output "vpc_id" {
  value = data.aws_vpc.ambrosia_serve_vpc.id
}

output "vpc_cidr" {
  value = data.aws_vpc.ambrosia_serve_vpc.cidr_block

}

output "security_group_id" {
  value = aws_security_group.sg.id
}

output "alb_dns" {
  value = aws_alb.alb.dns_name
}

output "lab_role_arn" {
  value = var.lab_role_arn
}

output "voclabs_role_arn" {
  value = var.voclabs_role_arn
}
