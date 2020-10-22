variable "zone" {}
variable "record_name" {}
variable "record_value" {}
variable "type" { default = "CNAME" }
variable "ttl" { default = "300" }

data "aws_route53_zone" "zone" {
  name = var.zone
}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${var.record_name}.${data.aws_route53_zone.zone.name}"
  type    = var.type
  records = [var.record_value]
  ttl     = var.ttl
}
