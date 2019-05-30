data "aws_iam_policy_document" "default" {
   statement { 
    actions = [	   
      "sts:AssumeRole"	
    ]
     
    principals {	  
      type = "Service"	 
      identifiers = [ "ec2.amazonaws.com" ]	 
   }
 } 
}  

resource "aws_iam_role" "default" {
  name   = "ec2_role_s3"
  assume_role_policy = "${data.aws_iam_policy_document.default.json}"
}

resource "aws_iam_instance_profile" "default" {
  name = "test_profile"
  role = "${aws_iam_role.default.name}"
}
