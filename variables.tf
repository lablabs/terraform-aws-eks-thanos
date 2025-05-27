# IMPORTANT: Add addon specific variables here
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "query_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "query_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos query."
}

variable "query_service_account_name" {
  type        = string
  default     = "thanos-query"
  description = "The name of the Service Account for the Thanos query."
}

variable "query_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos query."
}

variable "query_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `query_irsa_policy` for the Thanos query. Mutually exclusive with `query_irsa_assume_role_enabled`."
}

variable "query_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos query. Applied only if `query_irsa_policy_enabled` is `true`."
}

variable "query_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos query is allowed to assume role defined by `query_irsa_assume_role_arn`. Mutually exclusive with `query_irsa_policy_enabled`."
}

variable "query_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos query. Applied only if `query_irsa_assume_role_enabled` is `true`."
}

variable "query_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos query. Defaults to `\"\"`."
}

variable "query_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos query. Where key is arbitrary id and value is policy ARN."
}

variable "queryfrontend_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query Frontend component"
}

variable "queryfrontend_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Query Frontend."
}

variable "queryfrontend_service_account_name" {
  type        = string
  default     = "thanos-queryfrontend"
  description = "The name of the Service Account for the Thanos Query Frontend."
}

variable "queryfrontend_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Query Frontend."
}

variable "queryfrontend_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `queryfrontend_irsa_policy` for the Thanos Query Frontend. Mutually exclusive with `queryfrontend_irsa_assume_role_enabled`."
}

variable "queryfrontend_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Query Frontend. Applied only if `queryfrontend_irsa_policy_enabled` is `true`."
}

variable "queryfrontend_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Query Frontend is allowed to assume role defined by `queryfrontend_irsa_assume_role_arn`. Mutually exclusive with `queryfrontend_irsa_policy_enabled`."
}

variable "queryfrontend_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Query Frontend. Applied only if `queryfrontend_irsa_assume_role_enabled` is `true`."
}

variable "queryfrontend_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Query Frontend. Defaults to `\"\"`."
}

variable "queryfrontend_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Query Frontend. Where key is arbitrary id and value is policy ARN."
}

variable "bucketweb_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Bucket Web component"
}

variable "bucketweb_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Bucket Web."
}

variable "bucketweb_service_account_name" {
  type        = string
  default     = "thanos-bucketweb"
  description = "The name of the Service Account for the Thanos Bucket Web."
}

variable "bucketweb_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Bucket Web."
}

variable "bucketweb_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `bucketweb_irsa_policy` for the Thanos Bucket Web. Mutually exclusive with `bucketweb_irsa_assume_role_enabled`."
}

variable "bucketweb_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Bucket Web. Applied only if `bucketweb_irsa_policy_enabled` is `true`."
}

variable "bucketweb_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Bucket Web is allowed to assume role defined by `bucketweb_irsa_assume_role_arn`. Mutually exclusive with `bucketweb_irsa_policy_enabled`."
}

variable "bucketweb_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Bucket Web. Applied only if `bucketweb_irsa_assume_role_enabled` is `true`."
}

variable "bucketweb_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Bucket Web. Defaults to `\"\"`."
}

variable "bucketweb_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Bucket Web. Where key is arbitrary id and value is policy ARN."
}

variable "compactor_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Compactor component"
}

variable "compactor_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Compactor."
}

variable "compactor_service_account_name" {
  type        = string
  default     = "thanos-compactor"
  description = "The name of the Service Account for the Thanos Compactor."
}

variable "compactor_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Compactor."
}

variable "compactor_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `compactor_irsa_policy` for the Thanos Compactor. Mutually exclusive with `compactor_irsa_assume_role_enabled`."
}

variable "compactor_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Compactor. Applied only if `compactor_irsa_policy_enabled` is `true`."
}

variable "compactor_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Compactor is allowed to assume role defined by `compactor_irsa_assume_role_arn`. Mutually exclusive with `compactor_irsa_policy_enabled`."
}

variable "compactor_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Compactor. Applied only if `compactor_irsa_assume_role_enabled` is `true`."
}

variable "compactor_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Compactor. Defaults to `\"\"`."
}

variable "compactor_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Compactor. Where key is arbitrary id and value is policy ARN."
}

variable "storegateway_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Store Gateway component"
}

variable "storegateway_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Store Gateway."
}

variable "storegateway_service_account_name" {
  type        = string
  default     = "thanos-storegateway"
  description = "The name of the Service Account for the Thanos Store Gateway."
}

variable "storegateway_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Store Gateway."
}

variable "storegateway_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `storegateway_irsa_policy` for the Thanos Store Gateway. Mutually exclusive with `storegateway_irsa_assume_role_enabled`."
}

variable "storegateway_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Store Gateway. Applied only if `storegateway_irsa_policy_enabled` is `true`."
}

variable "storegateway_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Store Gateway is allowed to assume role defined by `storegateway_irsa_assume_role_arn`. Mutually exclusive with `storegateway_irsa_policy_enabled`."
}

variable "storegateway_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Store Gateway. Applied only if `storegateway_irsa_assume_role_enabled` is `true`."
}

variable "storegateway_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Store Gateway. Defaults to `\"\"`."
}

variable "storegateway_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Store Gateway. Where key is arbitrary id and value is policy ARN."
}

variable "ruler_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Ruler component"
}

variable "ruler_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Ruler."
}

variable "ruler_service_account_name" {
  type        = string
  default     = "thanos-ruler"
  description = "The name of the Service Account for the Thanos Ruler."
}

variable "ruler_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Ruler."
}

variable "ruler_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `ruler_irsa_policy` for the Thanos Ruler. Mutually exclusive with `ruler_irsa_assume_role_enabled`."
}

variable "ruler_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Ruler. Applied only if `ruler_irsa_policy_enabled` is `true`."
}

variable "ruler_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Ruler is allowed to assume role defined by `ruler_irsa_assume_role_arn`. Mutually exclusive with `ruler_irsa_policy_enabled`."
}

variable "ruler_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Ruler. Applied only if `ruler_irsa_assume_role_enabled` is `true`."
}

variable "ruler_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Ruler. Defaults to `\"\"`."
}

variable "ruler_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Ruler. Where key is arbitrary id and value is policy ARN."
}

variable "receive_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Receive component"
}

variable "receive_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Receive."
}

variable "receive_service_account_name" {
  type        = string
  default     = "thanos-receive"
  description = "The name of the Service Account for the Thanos Receive."
}

variable "receive_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Receive."
}

variable "receive_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `receive_irsa_policy` for the Thanos Receive. Mutually exclusive with `receive_irsa_assume_role_enabled`."
}

variable "receive_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Receive. Applied only if `receive_irsa_policy_enabled` is `true`."
}

variable "receive_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Receive is allowed to assume role defined by `receive_irsa_assume_role_arn`. Mutually exclusive with `receive_irsa_policy_enabled`."
}

variable "receive_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Receive. Applied only if `receive_irsa_assume_role_enabled` is `true`."
}

variable "receive_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Receive. Defaults to `\"\"`."
}

variable "receive_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Receive. Where key is arbitrary id and value is policy ARN."
}

variable "receivedistributor_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Receive Distributor component"
}

variable "receivedistributor_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Thanos Receive Distributor."
}

variable "receivedistributor_service_account_name" {
  type        = string
  default     = "thanos-receivedistributor"
  description = "The name of the Service Account for the Thanos Receive Distributor."
}

variable "receivedistributor_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Thanos Receive Distributor."
}

variable "receivedistributor_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `receivedistributor_irsa_policy` for the Thanos Receive Distributor. Mutually exclusive with `receivedistributor_irsa_assume_role_enabled`."
}

variable "receivedistributor_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Thanos Receive Distributor. Applied only if `receivedistributor_irsa_policy_enabled` is `true`."
}

variable "receivedistributor_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Thanos Receive Distributor is allowed to assume role defined by `receivedistributor_irsa_assume_role_arn`. Mutually exclusive with `receivedistributor_irsa_policy_enabled`."
}

variable "receivedistributor_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Thanos Receive Distributor. Applied only if `receivedistributor_irsa_assume_role_enabled` is `true`."
}

variable "receivedistributor_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Thanos Receive Distributor. Defaults to `\"\"`."
}

variable "receivedistributor_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Thanos Receive Distributor. Where key is arbitrary id and value is policy ARN."
}
