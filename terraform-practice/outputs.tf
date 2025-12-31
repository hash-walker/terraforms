output "access_key_id" {
  value = aws_iam_access_key.assignment_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.assignment_key.secret
  sensitive = true
}

output "web_server_public_ip" {
  value = aws_instance.ec2_web_1.public_ip
}
