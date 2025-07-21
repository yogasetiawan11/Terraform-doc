resource "aws_instance" "web" {
  description = "Web server instance"
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}