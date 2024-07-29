output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_zone_1a_id" {
  value = aws_subnet.public_1a.id
}

output "public_subnet_zone_1b_id" {
  value = aws_subnet.public_1b.id
}

output "private_subnet_zone_1a_id" {
  value = aws_subnet.private_1a.id
}

output "private_subnet_zone_1b_id" {
  value = aws_subnet.private_1b.id
}

output "db_subnet_zone_1a_id" {
  value = aws_subnet.db_1a.id
}

output "db_subnet_zone_1b_id" {
  value = aws_subnet.db_1b.id
}
