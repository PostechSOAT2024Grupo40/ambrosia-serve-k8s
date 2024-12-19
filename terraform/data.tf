data "aws_instance" "ec2" {
    depends_on = [aws_eks_node_group.node_group]
    filter {
        name = "tag:eks:nodegroup-name"
        values = ["ambrosia-serve-node-group"]
    }
}