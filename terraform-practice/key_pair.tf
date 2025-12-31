# generating key pairs 

resource "tls_private_key" "terraforms_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraforms_key" {
  key_name   = "terraforms-key"
  public_key = tls_private_key.terraforms_key.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename        = "${path.module}/terraforms-key.pem"
  content         = tls_private_key.terraforms_key.private_key_pem
  file_permission = "0400"
}
