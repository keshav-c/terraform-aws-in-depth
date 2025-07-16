output "aws_instance_arns" {
  description = "The AWS Resource Name of the created instance"
  value       = aws_instance.hello_world[*].arn
}

output "aws_instance_ips" {
  description = "The IP address for the private network interface on the instance"
  value       = aws_instance.hello_world[*].private_ip
}

output "aws_instances" {
  description = "The entire AWS instance resource"
  value       = aws_instance.hello_world[*]
}

