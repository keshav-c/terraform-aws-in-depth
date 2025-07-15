output "aws_instance_arn" {
  description = "The AWS Resource Name of the created instance"
  value       = aws_instance.hello_world.arn
}

output "aws_instance_ip" {
  description = "The IP address for the private network interface on the instance"
  value       = aws_instance.hello_world.private_ip
}

output "aws_instance" {
  description = "The entire AWS instance resource"
  value       = aws_instance.hello_world
}

