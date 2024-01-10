variable "resource_group_name" {
  description = "function app rg"
  default     = "azure-functions-test-rg"
}

variable "location" {
  description = "function app location"
  default     = "uk south"
}

variable "storage_account_name" {
  description = "funtionapp001"
  default     = "functionsapptestsa"
}

variable "app_service_plan_name" {
  description = "TBC"
  default     = "azure-functions-test-service-plan"
}

variable "function_app_name" {
  description = "Function App"
  default     = "test-azure-functions"
}

variable "sku_tier" {
  description = "test"
  default     = "Standard"
}

variable "sku_size" {
  description = "size test"
  default     = "S1"
}
