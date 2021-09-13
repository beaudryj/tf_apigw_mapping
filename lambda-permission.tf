#############################
# Lambda
#############################

/*
The Content-Type of this file needs to be text/* or this will fail because Terraform won't pull down the body of the file.
*/

resource "aws_lambda_permission" "apigw_permission" {
  statement_id  = "AllowAPIInvoke-${var.resource_identifier}"
  action        = "lambda:InvokeFunction"
  function_name = var.gatewayed_lambda_name
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${var.gateway_execution_arn}/*/*/${var.resource_name}"
}