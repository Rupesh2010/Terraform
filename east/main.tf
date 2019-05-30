provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web1" {
  ami = "${var.ami_image}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${var.security_groups}"]
  user_data = "${file("userdata.sh")}"
  iam_instance_profile = "${aws_iam_instance_profile.default.id}"
  tags {
    Name = "Instance1"
  }
 }
