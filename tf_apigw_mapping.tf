# Module specfic code
#############################
# API Gateway
#############################

# Method
resource "aws_api_gateway_method" "api_method" {
  rest_api_id          = var.rest_api_id
  resource_id          = var.resource_id
  http_method          = var.api_method
  authorization        = "CUSTOM"
  authorizer_id        = var.authorizer_id
  request_validator_id = var.request_validator_id

  request_parameters = var.request_parameters
}

resource "aws_api_gateway_method_response" "options_200" {
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.api_method.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
    "method.response.header.Access-Control-Allow-Origin"  = true
  }

  depends_on = [aws_api_gateway_method.api_method]
}

resource "aws_api_gateway_method_response" "options_404" {
  count = var.mock_mode ? 1 : 0
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.api_method.http_method
  status_code = "404"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
    "method.response.header.Access-Control-Allow-Origin"  = true
  }

  depends_on = [aws_api_gateway_method.api_method]
}

resource "aws_api_gateway_integration" "integration" {
  for_each = {for i in local.integrations:  
  i.enabled => i
  if i.enabled
  }
  rest_api_id             = each.value.rest_api_id
  resource_id             = each.value.resource_id
  http_method             = each.value.http_method
  integration_http_method = each.value.integration_http_method
  type                    = each.value.type
  uri                     = each.value.uri
  request_templates       = each.value.request_templates
}

resource "aws_api_gateway_integration_response" "mock_mode_integration_response" {
  count = var.mock_mode ? 1 : 0
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.api_method.http_method
  status_code = aws_api_gateway_method_response.options_404.*.status_code[count.index]
  selection_pattern = "\\d{3}"

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = <<EOF
    {"message": "Endpoint not available", "statusCode": 404}
    EOF
  }
  depends_on = [aws_api_gateway_integration.integration, aws_api_gateway_method_response.options_404]
}
