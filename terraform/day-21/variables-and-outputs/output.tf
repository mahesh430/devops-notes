output "instance_id" {
  value       = aws_instance.myec2.id
  description = "The ID of the created EC2 instance."
}
