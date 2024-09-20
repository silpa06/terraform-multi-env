resource "aws_instance" "expense" {
  ami           = data.aws_ami.redhat.id
  for_each = var.instances
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.expense_sg.id]
  tags = merge( 
    var.common_tags,
    var.tags,
    {
      Name = each.key
    }

  )
}

resource "aws_security_group" "expense_sg" {
  name = "expense_sg_${var.environment}"
  description = "open port 22 for ssh"
  tags = merge(
    var.common_tags,
    var.tags,
    {
    Name = "all ssh ${var.environment}"
    }
  )

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
}

