resource "aws_instance" "dev-airbnb-web" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-web-server"
  }
}
resource "aws_instance" "prod-airbnb-web" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-web-server2"
  }
}