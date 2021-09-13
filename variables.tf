#############################
# General
#############################
variable "rest_api_id" {
  description = "if of rest api to deploy to"
  default     = ""
}

variable "authorizer_id" {
  description = "id of api gateway authorizer"
  default     = ""
}


variable "api_method" {
  description = "id of rest api to deploy to"
  default     = ""
}

variable "resource_name" {
  description = "name of resource to be used for invocation permission"
  default     = ""
}

variable "resource_identifier" {
  description = "which resource to deliniate in iam"
  default     = ""
}


variable "resource_id" {
  description = "id of api resource"
  default     = ""
}


variable "gatewayed_lambda_arn" {
  description = "ARN of Lambda in Gateway"
  type        = string
  default     = "changeme"
}

variable "gatewayed_lambda_name" {
  description = "ARN of Lambda in Gateway"
  type        = string
  default     = "changeme"
}

variable "mock_mode" {
  description = "Flag to set integration to mock mode"
  type        = bool
  default     = false
}


#############################
# API Gateway
#############################
variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "change me"
}

variable "gateway_execution_arn" {
  description = "API Gateway Execution ARN"
  type        = string
  default     = "change me"
}


variable "request_parameters" {
  type    = map
  default = {}
}

variable "request_validator_id" {
  type    = string
  default     = ""
}


#############################
# Lambda
#############################
variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "changeme"
}

#############################
# General Shared
#############################

variable "tags" {
  description = "Default Tags"
  type        = map
}
