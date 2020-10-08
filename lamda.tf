resource "aws_iam_role" "tf" {
  name               = "iam_for_lambda_pla"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "tf" {
  filename      = "index.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.tf.arn
  handler       = "exports.test"
  source_code_hash = filebase64sha256("index.zip")
  runtime = "python3.8"

  environment {
    variables = {
      environment = "test"
    }
  }
}
