resource "aws_eks_cluster" "cluster" {
  name = "ambrosia-serve-cluster"

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  role_arn = var.lab_role_arn
  version  = "1.31"

  vpc_config {
    subnet_ids         = ["subnet-07a2bee2a3e08594e", "subnet-0bb9852652d96a262"]
    security_group_ids = [aws_security_group.sg.id]
  }
}


resource "aws_eks_node_group" "node_group" {
  depends_on      = [aws_eks_cluster.cluster]
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "ambrosia-serve"
  node_role_arn   = var.lab_role_arn
  subnet_ids      = ["subnet-07a2bee2a3e08594e", "subnet-0bb9852652d96a262"]

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
  principal_arn     = var.voclabs_role_arn
  kubernetes_groups = ["ambrosia-serve"]
}

resource "aws_eks_access_policy_association" "voclabs_access_policy_association" {
  cluster_name  = aws_eks_cluster.cluster.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = var.voclabs_role_arn

  access_scope {
    type = "cluster"
  }
}
