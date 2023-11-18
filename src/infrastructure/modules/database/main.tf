/*
creates a subnet group for an RDS instance to specify which subnets the RDS instance can be placed in.

creates an RDS instance and specifies various configurations such as 
allocated storage, database engine, instance class, database name, username, password, etc.
*/

resource "aws_db_subnet_group" "private_group" {
  name       = "database sub net group"
  subnet_ids = [var.subnet_ids.private_3, var.subnet_ids.private_4]
}



resource "aws_db_instance" "wordpress_db" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  db_name                = "wordpress_db"
  username               = "username"
  password               = "password"
  parameter_group_name   = "default.mysql8.0"
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.private_group.name
  skip_final_snapshot    = true

}
