data "aws_instance" "ec2" {
  depends_on = [aws_eks_node_group.node_group]
  filter {
    name   = "tag:eks:nodegroup-name"
    values = ["ambrosia-serve-node-group"]
  }
}


data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}