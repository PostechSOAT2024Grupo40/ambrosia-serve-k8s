resource "aws_eks_cluster" "cluster" {
  depends_on = [aws_subnet.subnet_private_a, aws_subnet.subnet_private_b]
  name       = "ambrosia-serve-cluster"

  access_config {
    authentication_mode = "API"
  }

  role_arn = var.lab_role_arn
  version  = "1.31"

  vpc_config {
    subnet_ids         = [aws_subnet.subnet_private_a.id, aws_subnet.subnet_private_b.id]
    security_group_ids = [aws_security_group.sg.id]
  }
}


resource "aws_eks_node_group" "node_group" {
  depends_on      = [aws_eks_cluster.cluster]
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "ambrosia-serve-node-group"
  node_role_arn   = var.lab_role_arn
  subnet_ids      = toset([aws_subnet.subnet_private_a.id, aws_subnet.subnet_private_b.id])

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  update_config {
    max_unavailable = 1
  }

}


resource "aws_eks_access_entry" "eks_access_entry" {
  depends_on        = [aws_eks_cluster.cluster]
  cluster_name      = aws_eks_cluster.cluster.name
  principal_arn     = var.lab_role_arn
  kubernetes_groups = ["group-1"]
  type              = "STANDARD"
}


resource "aws_eks_access_policy_association" "access_policy_association_lab" {
  depends_on   = [aws_eks_cluster.cluster]
  cluster_name = aws_eks_cluster.cluster.name

  # aws eks list-access-policies --output table
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = var.lab_role_arn

  access_scope {
    type = "cluster"
  }
}
