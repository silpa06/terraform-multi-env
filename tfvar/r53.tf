resource "aws_route53_record" "expense-records" {
  for_each = aws_instance.expense
  zone_id = local.zone_id
  # mysql.devteck.xyz
  name = each.key == "frontend-prod" ? local.domain_name : "${each.key}.${local.zone_name}"
  type    = "A"
  ttl     = "1"
  # startswith (key.value, "frontend") ?
  records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
}