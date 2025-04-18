resource "aws_launch_template" "app_template" {
  name_prefix   = "app-launch-template-"
  image_id      = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  user_data = base64encode(<<EOF
#!/bin/bash
echo "Setting up app server"
# export DB_HOST=${var.database_host}
EOF
  )

  vpc_security_group_ids = [var.ec2_sg_id]
}

output "launch_template_id" {
  value = aws_launch_template.app_template.id
}
