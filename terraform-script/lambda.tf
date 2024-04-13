resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
  })
}


resource "aws_iam_role_policy" "lambda_role_policy" {
  name = "lambda_role_policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*",
                "sns:*"
            ],
            "Resource": "*"
        }
    ]
    
  })
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/python/lambda.py"
  output_path = "${path.module}/python/lambda.zip"
}

resource "aws_lambda_function" "my_lambda_function" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "${path.module}/python/lambda.zip"
  function_name = "lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda.lambda_handler"                                                   //lambda.py file name and handler defined in the program
  runtime = "python3.12"
  
}

#To create destinantion for lambda function
resource "aws_lambda_function_event_invoke_config" "destination" {
  function_name = aws_lambda_function.my_lambda_function.function_name

  destination_config {
   # on_failure {
   #   destination = aws_sqs_queue.example.arn
   # }

    on_success {
      destination = aws_sns_topic.sns.arn
    }
  }
}
