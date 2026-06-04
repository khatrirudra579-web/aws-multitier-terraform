resource "aws_launch_template" "web_lt" {
  name_prefix = "web-template"

  image_id = "ami-0082a2af4ee051c96"

  instance_type = "t3.micro"

  vpc_security_group_ids = [
    var.ec2_sg_id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash
dnf install httpd -y
systemctl start httpd
systemctl enable httpd

echo "<h1>Hello from Auto Scaling Group</h1>" > /var/www/html/index.html
EOF
  )
}
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 2
  min_size         = 2
  max_size         = 6

  vpc_zone_identifier = [
    var.private_subnet_1,
    var.private_subnet_2
  ]

  target_group_arns = [
    var.target_group_arn
  ]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
}
