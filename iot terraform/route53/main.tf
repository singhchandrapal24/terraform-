resource "aws_route53_zone" "main" {
  name = "chandu.com"
}
resource "aws_route53_zone" "dev" {
  name = "dev.chandu.com"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.chandu.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.dev.name_servers
}