
resource "aws_security_group" "test-sg-eks-cluster" {
  name        = "skt-kmj-sg-eks-cluster"
  description = "security_group for skt-kmj-eks-cluster"
  vpc_id      = aws_vpc.test-vpc.id

  tags = {
    Name = "skt-kmj-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "test-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.test-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for skt-kmj-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "test-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.test-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for skt-kmj-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
