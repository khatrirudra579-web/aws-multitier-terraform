resource "aws_db_subnet_group" "db_subnet_group" {
  name = "terraform-db-subnet-group"

  subnet_ids = [
    var.private_subnet_1,
    var.private_subnet_2
  ]
}
resource "aws_db_instance" "mysql" {

  identifier = "terraform-mysql"

  engine = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name  = "appdb"

  username = "admin"
  password = "Terraform123!"

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    var.rds_sg_id
  ]

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}
