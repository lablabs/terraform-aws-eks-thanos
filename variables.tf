variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster"
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account"
}

# Helm

variable "helm_chart_name" {
  type        = string
  default     = "thanos"
  description = "Helm chart name to be installed"
}

variable "helm_chart_version" {
  type        = string
  default     = "6.0.13"
  description = "Version of the Helm chart"
}

variable "helm_release_name" {
  type        = string
  default     = "thanos"
  description = "Helm release name"
}

variable "helm_repo_url" {
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
  description = "Helm repository"
}

variable "helm_create_namespace" {
  type        = bool
  default     = true
  description = "Create the namespace if it does not yet exist"
}

variable "helm_wait" {
  type        = bool
  default     = true
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
}

variable "helm_timeout" {
  type        = number
  default     = 300
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
}

variable "helm_cleanup_on_fail" {
  type        = bool
  default     = false
  description = "Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false."
}

variable "helm_atomic" {
  type        = bool
  default     = false
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false."
}

# Values

variable "k8s_namespace" {
  type        = string
  default     = "thanos"
  description = "The K8s namespace in which the ingress-nginx has been created"
}

variable "k8s_irsa_role_name_prefix" {
  type        = string
  default     = "thanos-irsa"
  description = "The IRSA role name prefix for thanos"
}

variable "values" {
  type        = string
  default     = ""
  description = "Additional yaml encoded values which will be passed to the Helm chart."
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/argo/argo-cd"
}


variable "thanos_query_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "thanos_query_service_account_name" {
  type        = string
  default     = "thanos-query"
  description = "Name for Thanos Query Service Account"
}

variable "thanos_query_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_query_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_queryfrontend_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query Frontend component"
}

variable "thanos_queryfrontend_service_account_name" {
  type        = string
  default     = "thanos-queryfrontend"
  description = "Name for Thanos Query Frontend Service Account"
}

variable "thanos_queryfrontend_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_queryfrontend_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_bucketweb_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Bucket Web component"
}

variable "thanos_bucketweb_service_account_name" {
  type        = string
  default     = "thanos-bucketweb"
  description = "Name for Thanos Bucket Web Service Account"
}

variable "thanos_bucketweb_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_bucketweb_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_compactor_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Compactor component"
}

variable "thanos_compactor_service_account_name" {
  type        = string
  default     = "thanos-compactor"
  description = "Name for Thanos Compactor Service Account"
}

variable "thanos_compactor_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_compactor_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_storagegateway_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Store Gateway component"
}

variable "thanos_storagegateway_service_account_name" {
  type        = string
  default     = "thanos-storegateway"
  description = "Name for Thanos Store Gateway Service Account"
}

variable "thanos_storagegateway_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_storagegateway_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_ruler_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Ruler component"
}

variable "thanos_ruler_service_account_name" {
  type        = string
  default     = "thanos-ruler"
  description = "Name for Thanos Ruler Service Account"
}

variable "thanos_ruler_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_ruler_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_receive_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Receive component"
}

variable "thanos_receive_service_account_name" {
  type        = string
  default     = "thanos-receive"
  description = "Name for Thanos Receive Service Account"
}

variable "thanos_receive_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_receive_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}


variable "thanos_receivedistributor_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable Thanos Receive Distributor component"
}

variable "thanos_receivedistributor_service_account_name" {
  type        = string
  default     = "thanos-receivedistributor"
  description = "Name for Thanos Receive Distributor Service Account"
}

variable "thanos_receivedistributor_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies arns to be attached to default role. Where key is arbiraty id and value is policy arn."
}

variable "thanos_receivedistributor_role_arn" {
  default     = ""
  description = "Whether to create and use default role or use existing role. Useful for a variety of use cases, such as cross account access. Default (empty string) use default generted role."
}

# ArgoCD

variable "argo_namespace" {
  type        = string
  default     = "argo"
  description = "Namespace to deploy ArgoCD application CRD to"
}

variable "argo_application_enabled" {
  type        = bool
  default     = false
  description = "If set to true, the module will be deployed as ArgoCD application, otherwise it will be deployed as a Helm release"
}

variable "argo_application_use_helm" {
  type        = bool
  default     = false
  description = "If set to true, the ArgoCD Application manifest will be deployed using Kubernetes provider as a Helm release. Otherwise it'll be deployed as a Kubernetes manifest. See Readme for more info"
}

variable "argo_application_values" {
  default     = ""
  description = "Value overrides to use when deploying argo application object with helm"
}

variable "argo_destionation_server" {
  type        = string
  default     = "https://kubernetes.default.svc"
  description = "Destination server for ArgoCD Application"
}

variable "argo_project" {
  type        = string
  default     = "default"
  description = "ArgoCD Application project"
}

variable "argo_info" {
  default = [{
    "name"  = "terraform"
    "value" = "true"
  }]
  description = "ArgoCD info manifest parameter"
}

variable "argo_sync_policy" {
  description = "ArgoCD syncPolicy manifest parameter"
  default     = {}
}
