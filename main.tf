/**
 * # AWS EKS Thanos Terraform module
 *
 * A Terraform module to deploy the [Thanos](https://thanos.io/) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/pre-commit.yml)
 */

locals {
  addon = {
    name = "thanos"

    helm_chart_version = "15.14.1"
    helm_repo_url      = "https://charts.bitnami.com/bitnami"
  }

  addon_irsa = {
    query = {
      service_account_create = var.thanos_query_service_account_create
      service_account_name   = var.thanos_query_service_account_name

      irsa_role_create          = var.thanos_query_irsa_role_create
      irsa_policy_enabled       = var.thanos_query_irsa_policy_enabled
      irsa_policy               = var.thanos_query_irsa_policy
      irsa_assume_role_enabled  = var.thanos_query_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_query_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_query_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_query_irsa_additional_policies
    }
    queryfrontend = {
      service_account_create = var.thanos_queryfrontend_service_account_create
      service_account_name   = var.thanos_queryfrontend_service_account_name

      irsa_role_create          = var.thanos_queryfrontend_irsa_role_create
      irsa_policy_enabled       = var.thanos_queryfrontend_irsa_policy_enabled
      irsa_policy               = var.thanos_queryfrontend_irsa_policy
      irsa_assume_role_enabled  = var.thanos_queryfrontend_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_queryfrontend_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_queryfrontend_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_queryfrontend_irsa_additional_policies
    }
    bucketweb = {
      service_account_create = var.thanos_bucketweb_service_account_create
      service_account_name   = var.thanos_bucketweb_service_account_name

      irsa_role_create          = var.thanos_bucketweb_irsa_role_create
      irsa_policy_enabled       = var.thanos_bucketweb_irsa_policy_enabled
      irsa_policy               = var.thanos_bucketweb_irsa_policy
      irsa_assume_role_enabled  = var.thanos_bucketweb_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_bucketweb_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_bucketweb_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_bucketweb_irsa_additional_policies
    }
    compactor = {
      service_account_create = var.thanos_compactor_service_account_create
      service_account_name   = var.thanos_compactor_service_account_name

      irsa_role_create          = var.thanos_compactor_irsa_role_create
      irsa_policy_enabled       = var.thanos_compactor_irsa_policy_enabled
      irsa_policy               = var.thanos_compactor_irsa_policy
      irsa_assume_role_enabled  = var.thanos_compactor_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_compactor_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_compactor_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_compactor_irsa_additional_policies
    }
    storegateway = {
      service_account_create = var.thanos_storegateway_service_account_create
      service_account_name   = var.thanos_storegateway_service_account_name

      irsa_role_create          = var.thanos_storegateway_irsa_role_create
      irsa_policy_enabled       = var.thanos_storegateway_irsa_policy_enabled
      irsa_policy               = var.thanos_storegateway_irsa_policy
      irsa_assume_role_enabled  = var.thanos_storegateway_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_storegateway_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_storegateway_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_storegateway_irsa_additional_policies
    }
    ruler = {
      service_account_create = var.thanos_ruler_service_account_create
      service_account_name   = var.thanos_ruler_service_account_name

      irsa_role_create          = var.thanos_ruler_irsa_role_create
      irsa_policy_enabled       = var.thanos_ruler_irsa_policy_enabled
      irsa_policy               = var.thanos_ruler_irsa_policy
      irsa_assume_role_enabled  = var.thanos_ruler_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_ruler_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_ruler_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_ruler_irsa_additional_policies
    }
    receive = {
      service_account_create = var.thanos_receive_service_account_create
      service_account_name   = var.thanos_receive_service_account_name

      irsa_role_create          = var.thanos_receive_irsa_role_create
      irsa_policy_enabled       = var.thanos_receive_irsa_policy_enabled
      irsa_policy               = var.thanos_receive_irsa_policy
      irsa_assume_role_enabled  = var.thanos_receive_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_receive_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_receive_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_receive_irsa_additional_policies
    }
    receivedistributor = {
      service_account_create = var.thanos_receivedistributor_service_account_create
      service_account_name   = var.thanos_receivedistributor_service_account_name

      irsa_role_create          = var.thanos_receivedistributor_irsa_role_create
      irsa_policy_enabled       = var.thanos_receivedistributor_irsa_policy_enabled
      irsa_policy               = var.thanos_receivedistributor_irsa_policy
      irsa_assume_role_enabled  = var.thanos_receivedistributor_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.thanos_receivedistributor_irsa_assume_role_arns
      irsa_permissions_boundary = var.thanos_receivedistributor_irsa_permissions_boundary
      irsa_additional_policies  = var.thanos_receivedistributor_irsa_additional_policies
    }
  }

  addon_values = yamlencode({
    query = {
      enabled = var.thanos_query_enabled
      rbac = {
        create = module.addon-irsa["query"].rbac_create
      }

      serviceAccount = {
        create = module.addon-irsa["query"].service_account_create
        name   = module.addon-irsa["query"].service_account_name
        annotations = module.addon-irsa["query"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["query"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    queryFrontend = {
      enabled = var.thanos_queryfrontend_enabled
      rbac = {
        create = module.addon-irsa["queryfrontend"].rbac_create
      }

      serviceAccount = {
        create = module.addon-irsa["queryfrontend"].service_account_create
        name   = module.addon-irsa["queryfrontend"].service_account_name
        annotations = module.addon-irsa["queryfrontend"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["queryfrontend"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    buckeweb = {
      enabled = var.thanos_bucketweb_enabled
      serviceAccount = {
        create = module.addon-irsa["bucketweb"].service_account_create
        name   = module.addon-irsa["bucketweb"].service_account_name
        annotations = module.addon-irsa["bucketweb"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["bucketweb"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    compactor = {
      enabled = var.thanos_compactor_enabled
      serviceAccount = {
        create = module.addon-irsa["compactor"].service_account_create
        name   = module.addon-irsa["compactor"].service_account_name
        annotations = module.addon-irsa["compactor"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["compactor"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    storegateway = {
      enabled = var.thanos_storegateway_enabled
      serviceAccount = {
        create = module.addon-irsa["storegateway"].service_account_create
        name   = module.addon-irsa["storegateway"].service_account_name
        annotations = module.addon-irsa["storegateway"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["storegateway"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    ruler = {
      enabled = var.thanos_ruler_enabled
      serviceAccount = {
        create = module.addon-irsa["ruler"].service_account_create
        name   = module.addon-irsa["ruler"].service_account_name
        annotations = module.addon-irsa["ruler"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["ruler"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    receive = {
      enabled = var.thanos_receive_enabled
      serviceAccount = {
        create = module.addon-irsa["receive"].service_account_create
        name   = module.addon-irsa["receive"].service_account_name
        annotations = module.addon-irsa["receive"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["receive"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    receiveDistributor = {
      enabled = var.thanos_receivedistributor_enabled
      serviceAccount = {
        create = module.addon-irsa["receivedistributor"].service_account_create
        name   = module.addon-irsa["receivedistributor"].service_account_name
        annotations = module.addon-irsa["receivedistributor"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["receivedistributor"].iam_role_attributes.arn
        } : tomap({})
      }
    }
  })

  addon_depends_on = []
}
