locals {
  disabled_rule = {
    enabled                 = false
    rest_api_id             = var.rest_api_id
    resource_id             = var.resource_id
    http_method             = aws_api_gateway_method.api_method.http_method
    integration_http_method = ""
    type                    = ""
    uri                     = var.gatewayed_lambda_arn
    request_templates       = {
      "application/json"    = <<TEMPLATE
{
}
TEMPLATE
    }
  }

  integrations = {
    mock = var.mock_mode ? {
      enabled                 = true
      rest_api_id             = var.rest_api_id
      resource_id             = var.resource_id
      http_method             = aws_api_gateway_method.api_method.http_method
      integration_http_method = "ANY"
      uri                     = ""
      type                    = "MOCK"
      request_templates       = {
        "application/json"    = <<TEMPLATE
{
  "statusCode": 404
}
TEMPLATE
      } 
    } : local.disabled_rule
    lambda = !var.mock_mode ? {
      enabled                 = true
      rest_api_id             = var.rest_api_id
      resource_id             = var.resource_id
      http_method             = aws_api_gateway_method.api_method.http_method
      integration_http_method = "POST"
      type                    = "AWS_PROXY"
      uri                     = var.gatewayed_lambda_arn
      request_templates       = {
        "application/json"    = <<TEMPLATE
{
}
TEMPLATE
      } 
    } : local.disabled_rule
  }
}