/*
defining a local variable rds that captures information about the RDS instance created by the aws_db_instance resource.
It includes the database name, password, username, and endpoint.
*/

locals {
  rds = {
    db_name  = aws_db_instance.wordpress_db.db_name
    password = aws_db_instance.wordpress_db.password
    username = aws_db_instance.wordpress_db.username
    endpoint = aws_db_instance.wordpress_db.endpoint
  }
}
