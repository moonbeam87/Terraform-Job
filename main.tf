resource "aws_instance" "TestInstance" {
  ami = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Terraform Job"
  }
}