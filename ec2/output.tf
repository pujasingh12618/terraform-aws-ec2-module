output "id" {
  value       = aws_instance.main.id
  description = "Created EC2 Id"
}

output "az" {
  value       = aws_instance.main.availability_zone
  description = "Created EC2 Availablity Zone"
}