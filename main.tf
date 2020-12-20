#EC2 Terraform
resource "aws_instance" "TestInstance" {
  ami = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Terraform Job"
  }
  key_name = "bob"
}
#SQS Terraform
resource "aws_sqs_queue" "TestQueue" {
  name = "test-queue"
  tags = {
    Name = "SQS Terraform Queue"
  }
}
#Lambda Terraform
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.8"

  environment {
    variables = {
      #Insert any if you need them
      foo = "bar"
    }
  }
}