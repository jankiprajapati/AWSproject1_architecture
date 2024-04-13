resource "aws_instance" "inst"{
  tags = merge (
      {
          Name = "${var.name}-inst-${count.index}"
      },
      var.tags
  )
 count                         = length(aws_subnet.private)
 ami                           = var.ami_id_ubuntu
 instance_type                 = var.inst_type_1
 key_name                      = aws_key_pair.tf-key.key_name
 subnet_id                     = aws_subnet.private[count.index].id
 associate_public_ip_address   = false
 security_groups               = [aws_security_group.sg1.id]
 iam_instance_profile          = aws_iam_instance_profile.ec2_role_1.name
}


#Bastion Host
resource "aws_instance" "bastion"{
  tags = merge (
      {
          Name = "${var.name}-bastion"
      },
      var.tags
  )
 ami = var.ami_id_ubuntu
 instance_type = var.inst_type_1
 key_name = aws_key_pair.tf-key.key_name
 subnet_id = aws_subnet.public[0].id
 associate_public_ip_address = true
 security_groups = [aws_security_group.sg2.id]
 user_data = <<-EOF
                     #!/bin/bash
                     sudo apt update -y
                 EOF
}
