resource "aws_vpc_peering_connection" "foo" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = local.default_vpc_id #acceptor
  vpc_id        = aws_vpc.main.id #requester
  auto_accept = true


 tags = merge(
   var.common_tags,
   var.vpc_peering_tags,
    {
      Name = "${local.resource_name}-default"
    }
  )
}