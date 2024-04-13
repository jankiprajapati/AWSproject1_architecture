resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-key" {
  key_name = "tf-key"    #Name of the key (Stored on aws console)
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "tf_key" {
 content  = tls_private_key.rsa.private_key_pem
 filename = "tf-key"     #Name of the key (Stored on the local-folder)
}
