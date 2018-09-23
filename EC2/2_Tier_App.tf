
resource "aws_instance" "EC2_App" {
  ami = "${var.Server_OS_AMI}"
  instance_type = "${var.Server_Size}"
  key_name = "Terraform_West2_KP"
  security_groups = ["EC2-app-sg"]

  tags {
    Name = "EC2_web_server"
  }
}

resource "aws_eip" "EC2_app_eip" {
  instance = "${aws_instance.EC2_App.id}"
#  vpc      = true
}
