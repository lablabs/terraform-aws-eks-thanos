# IMPORTANT: Add addon specific variables here
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "thanos_query_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "thanos_query_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos query."
}

variable "thanos_query_service_account_name" {
  type        = string
  default     = "thanos-query"
  description = "The name of the Service Account for the Thanos query."
}

variable "thanos_query_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos query."
}

variable "thanos_query_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_query_irsa_policy` for the Thanos query. Mutually exclusive with `thanos_query_irsa_assume_role_enabled`."
}

variable "thanos_query_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos query. Applied only if `thanos_query_irsa_policy_enabled` is `true`."
}

variable "thanos_query_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos query is allowed to assume role defined by `thanos_query_irsa_assume_role_arn`. Mutually exclusive with `thanos_query_irsa_policy_enabled`."
}

variable "thanos_query_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos query. Applied only if `thanos_query_irsa_assume_role_enabled` is `true`."
}

variable "thanos_query_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos query. Defaults to `\"\"`."
}

variable "thanos_query_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos query. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_queryfrontend_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query Frontend component"
}

variable "thanos_queryfrontend_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Query Frontend."
}

variable "thanos_queryfrontend_service_account_name" {
  type        = string
  default     = "thanos-queryfrontend"
  description = "The name of the Service Account for the Thanos Query Frontend."
}

variable "thanos_queryfrontend_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Query Frontend."
}

variable "thanos_queryfrontend_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_queryfrontend_irsa_policy` for the Thanos Query Frontend. Mutually exclusive with `thanos_queryfrontend_irsa_assume_role_enabled`."
}

variable "thanos_queryfrontend_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Query Frontend. Applied only if `thanos_queryfrontend_irsa_policy_enabled` is `true`."
}

variable "thanos_queryfrontend_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Query Frontend is allowed to assume role defined by `thanos_queryfrontend_irsa_assume_role_arn`. Mutually exclusive with `thanos_queryfrontend_irsa_policy_enabled`."
}

variable "thanos_queryfrontend_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Query Frontend. Applied only if `thanos_queryfrontend_irsa_assume_role_enabled` is `true`."
}

variable "thanos_queryfrontend_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Query Frontend. Defaults to `\"\"`."
}

variable "thanos_queryfrontend_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Query Frontend. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_bucketweb_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Bucket Web component"
}

variable "thanos_bucketweb_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Bucket Web."
}

variable "thanos_bucketweb_service_account_name" {
  type        = string
  default     = "thanos-bucketweb"
  description = "The name of the Service Account for the Thanos Bucket Web."
}

variable "thanos_bucketweb_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Bucket Web."
}

variable "thanos_bucketweb_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_bucketweb_irsa_policy` for the Thanos Bucket Web. Mutually exclusive with `thanos_bucketweb_irsa_assume_role_enabled`."
}

variable "thanos_bucketweb_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Bucket Web. Applied only if `thanos_bucketweb_irsa_policy_enabled` is `true`."
}

variable "thanos_bucketweb_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Bucket Web is allowed to assume role defined by `thanos_bucketweb_irsa_assume_role_arn`. Mutually exclusive with `thanos_bucketweb_irsa_policy_enabled`."
}

variable "thanos_bucketweb_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Bucket Web. Applied only if `thanos_bucketweb_irsa_assume_role_enabled` is `true`."
}

variable "thanos_bucketweb_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Bucket Web. Defaults to `\"\"`."
}

variable "thanos_bucketweb_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Bucket Web. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_compactor_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Compactor component"
}

variable "thanos_compactor_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Compactor."
}

variable "thanos_compactor_service_account_name" {
  type        = string
  default     = "thanos-compactor"
  description = "The name of the Service Account for the Thanos Compactor."
}

variable "thanos_compactor_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Compactor."
}

variable "thanos_compactor_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_compactor_irsa_policy` for the Thanos Compactor. Mutually exclusive with `thanos_compactor_irsa_assume_role_enabled`."
}

variable "thanos_compactor_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Compactor. Applied only if `thanos_compactor_irsa_policy_enabled` is `true`."
}

variable "thanos_compactor_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Compactor is allowed to assume role defined by `thanos_compactor_irsa_assume_role_arn`. Mutually exclusive with `thanos_compactor_irsa_policy_enabled`."
}

variable "thanos_compactor_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Compactor. Applied only if `thanos_compactor_irsa_assume_role_enabled` is `true`."
}

variable "thanos_compactor_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Compactor. Defaults to `\"\"`."
}

variable "thanos_compactor_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Compactor. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_storegateway_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Store Gateway component"
}

variable "thanos_storegateway_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Store Gateway."
}

variable "thanos_storegateway_service_account_name" {
  type        = string
  default     = "thanos-storegateway"
  description = "The name of the Service Account for the Thanos Store Gateway."
}

variable "thanos_storegateway_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Store Gateway."
}

variable "thanos_storegateway_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_storegateway_irsa_policy` for the Thanos Store Gateway. Mutually exclusive with `thanos_storegateway_irsa_assume_role_enabled`."
}

variable "thanos_storegateway_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Store Gateway. Applied only if `thanos_storegateway_irsa_policy_enabled` is `true`."
}

variable "thanos_storegateway_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Store Gateway is allowed to assume role defined by `thanos_storegateway_irsa_assume_role_arn`. Mutually exclusive with `thanos_storegateway_irsa_policy_enabled`."
}

variable "thanos_storegateway_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Store Gateway. Applied only if `thanos_storegateway_irsa_assume_role_enabled` is `true`."
}

variable "thanos_storegateway_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Store Gateway. Defaults to `\"\"`."
}

variable "thanos_storegateway_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Store Gateway. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_ruler_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Ruler component"
}

variable "thanos_ruler_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Ruler."
}

variable "thanos_ruler_service_account_name" {
  type        = string
  default     = "thanos-ruler"
  description = "The name of the Service Account for the Thanos Ruler."
}

variable "thanos_ruler_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Ruler."
}

variable "thanos_ruler_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_ruler_irsa_policy` for the Thanos Ruler. Mutually exclusive with `thanos_ruler_irsa_assume_role_enabled`."
}

variable "thanos_ruler_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Ruler. Applied only if `thanos_ruler_irsa_policy_enabled` is `true`."
}

variable "thanos_ruler_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Ruler is allowed to assume role defined by `thanos_ruler_irsa_assume_role_arn`. Mutually exclusive with `thanos_ruler_irsa_policy_enabled`."
}

variable "thanos_ruler_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Ruler. Applied only if `thanos_ruler_irsa_assume_role_enabled` is `true`."
}

variable "thanos_ruler_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Ruler. Defaults to `\"\"`."
}

variable "thanos_ruler_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Ruler. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_receive_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Receive component"
}

variable "thanos_receive_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Receive."
}

variable "thanos_receive_service_account_name" {
  type        = string
  default     = "thanos-receive"
  description = "The name of the Service Account for the Thanos Receive."
}

variable "thanos_receive_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Receive."
}

variable "thanos_receive_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_receive_irsa_policy` for the Thanos Receive. Mutually exclusive with `thanos_receive_irsa_assume_role_enabled`."
}

variable "thanos_receive_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Receive. Applied only if `thanos_receive_irsa_policy_enabled` is `true`."
}

variable "thanos_receive_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Receive is allowed to assume role defined by `thanos_receive_irsa_assume_role_arn`. Mutually exclusive with `thanos_receive_irsa_policy_enabled`."
}

variable "thanos_receive_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Receive. Applied only if `thanos_receive_irsa_assume_role_enabled` is `true`."
}

variable "thanos_receive_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Receive. Defaults to `\"\"`."
}

variable "thanos_receive_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Receive. Where key is arbitrary id and value is policy ARN."
}

variable "thanos_receivedistributor_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Receive Distributor component"
}

variable "thanos_receivedistributor_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Receive Distributor."
}

variable "thanos_receivedistributor_service_account_name" {
  type        = string
  default     = "thanos-receivedistributor"
  description = "The name of the Service Account for the Thanos Receive Distributor."
}

variable "thanos_receivedistributor_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Receive Distributor."
}

variable "thanos_receivedistributor_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `thanos_receivedistributor_irsa_policy` for the Thanos Receive Distributor. Mutually exclusive with `thanos_receivedistributor_irsa_assume_role_enabled`."
}

variable "thanos_receivedistributor_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Receive Distributor. Applied only if `thanos_receivedistributor_irsa_policy_enabled` is `true`."
}

variable "thanos_receivedistributor_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Receive Distributor is allowed to assume role defined by `thanos_receivedistributor_irsa_assume_role_arn`. Mutually exclusive with `thanos_receivedistributor_irsa_policy_enabled`."
}

variable "thanos_receivedistributor_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Receive Distributor. Applied only if `thanos_receivedistributor_irsa_assume_role_enabled` is `true`."
}

variable "thanos_receivedistributor_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Receive Distributor. Defaults to `\"\"`."
}

variable "thanos_receivedistributor_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Receive Distributor. Where key is arbitrary id and value is policy ARN."
}
