locals {
   zone_name         = "devteck.xyz"
   zone_id = data.aws_route53_zone.expense-r53.zone_id
   domain_name    = "www.${data.aws_route53_zone.expense-r53.name}"
}