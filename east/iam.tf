data "aws_iam_policy_document" "default" {
  statement {
  
    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}

resource "aws_iam_policy" "default" {
  name   = "ec2_policy"
  policy = "${data.aws_iam_policy_document.default.json}"
}
