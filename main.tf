/**
 * # AWS EKS Thanos Terraform module
 *
 * A Terraform module to deploy the [Thanos](https://thanos.io/) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-thanos/actions/workflows/pre-commit.yaml)
 */
locals {
  addon = {
    name = "thanos"

    helm_chart_version = "15.14.1"
    helm_repo_url      = "https://charts.bitnami.com/bitnami"
  }

  addon_irsa = {
    query = {
      service_account_create = var.query_service_account_create
      service_account_name   = var.query_service_account_name

      irsa_role_create          = var.query_irsa_role_create
      irsa_policy_enabled       = var.query_irsa_policy_enabled
      irsa_policy               = var.query_irsa_policy
      irsa_assume_role_enabled  = var.query_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.query_irsa_assume_role_arns
      irsa_permissions_boundary = var.query_irsa_permissions_boundary
      irsa_additional_policies  = var.query_irsa_additional_policies
    }
    queryfrontend = {
      service_account_create = var.queryfrontend_service_account_create
      service_account_name   = var.queryfrontend_service_account_name

      irsa_role_create          = var.queryfrontend_irsa_role_create
      irsa_policy_enabled       = var.queryfrontend_irsa_policy_enabled
      irsa_policy               = var.queryfrontend_irsa_policy
      irsa_assume_role_enabled  = var.queryfrontend_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.queryfrontend_irsa_assume_role_arns
      irsa_permissions_boundary = var.queryfrontend_irsa_permissions_boundary
      irsa_additional_policies  = var.queryfrontend_irsa_additional_policies
    }
    bucketweb = {
      service_account_create = var.bucketweb_service_account_create
      service_account_name   = var.bucketweb_service_account_name

      irsa_role_create          = var.bucketweb_irsa_role_create
      irsa_policy_enabled       = var.bucketweb_irsa_policy_enabled
      irsa_policy               = var.bucketweb_irsa_policy
      irsa_assume_role_enabled  = var.bucketweb_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.bucketweb_irsa_assume_role_arns
      irsa_permissions_boundary = var.bucketweb_irsa_permissions_boundary
      irsa_additional_policies  = var.bucketweb_irsa_additional_policies
    }
    compactor = {
      service_account_create = var.compactor_service_account_create
      service_account_name   = var.compactor_service_account_name

      irsa_role_create          = var.compactor_irsa_role_create
      irsa_policy_enabled       = var.compactor_irsa_policy_enabled
      irsa_policy               = var.compactor_irsa_policy
      irsa_assume_role_enabled  = var.compactor_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.compactor_irsa_assume_role_arns
      irsa_permissions_boundary = var.compactor_irsa_permissions_boundary
      irsa_additional_policies  = var.compactor_irsa_additional_policies
    }
    storegateway = {
      service_account_create = var.storegateway_service_account_create
      service_account_name   = var.storegateway_service_account_name

      irsa_role_create          = var.storegateway_irsa_role_create
      irsa_policy_enabled       = var.storegateway_irsa_policy_enabled
      irsa_policy               = var.storegateway_irsa_policy
      irsa_assume_role_enabled  = var.storegateway_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.storegateway_irsa_assume_role_arns
      irsa_permissions_boundary = var.storegateway_irsa_permissions_boundary
      irsa_additional_policies  = var.storegateway_irsa_additional_policies
    }
    ruler = {
      service_account_create = var.ruler_service_account_create
      service_account_name   = var.ruler_service_account_name

      irsa_role_create          = var.ruler_irsa_role_create
      irsa_policy_enabled       = var.ruler_irsa_policy_enabled
      irsa_policy               = var.ruler_irsa_policy
      irsa_assume_role_enabled  = var.ruler_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.ruler_irsa_assume_role_arns
      irsa_permissions_boundary = var.ruler_irsa_permissions_boundary
      irsa_additional_policies  = var.ruler_irsa_additional_policies
    }
    receive = {
      service_account_create = var.receive_service_account_create
      service_account_name   = var.receive_service_account_name

      irsa_role_create          = var.receive_irsa_role_create
      irsa_policy_enabled       = var.receive_irsa_policy_enabled
      irsa_policy               = var.receive_irsa_policy
      irsa_assume_role_enabled  = var.receive_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.receive_irsa_assume_role_arns
      irsa_permissions_boundary = var.receive_irsa_permissions_boundary
      irsa_additional_policies  = var.receive_irsa_additional_policies
    }
    receivedistributor = {
      service_account_create = var.receivedistributor_service_account_create
      service_account_name   = var.receivedistributor_service_account_name

      irsa_role_create          = var.receivedistributor_irsa_role_create
      irsa_policy_enabled       = var.receivedistributor_irsa_policy_enabled
      irsa_policy               = var.receivedistributor_irsa_policy
      irsa_assume_role_enabled  = var.receivedistributor_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.receivedistributor_irsa_assume_role_arns
      irsa_permissions_boundary = var.receivedistributor_irsa_permissions_boundary
      irsa_additional_policies  = var.receivedistributor_irsa_additional_policies
    }
  }

  addon_values = yamlencode({
    query = {
      enabled = var.query_enabled
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
      enabled = var.queryfrontend_enabled
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
      enabled = var.bucketweb_enabled
      serviceAccount = {
        create = module.addon-irsa["bucketweb"].service_account_create
        name   = module.addon-irsa["bucketweb"].service_account_name
        annotations = module.addon-irsa["bucketweb"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["bucketweb"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    compactor = {
      enabled = var.compactor_enabled
      serviceAccount = {
        create = module.addon-irsa["compactor"].service_account_create
        name   = module.addon-irsa["compactor"].service_account_name
        annotations = module.addon-irsa["compactor"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["compactor"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    storegateway = {
      enabled = var.storegateway_enabled
      serviceAccount = {
        create = module.addon-irsa["storegateway"].service_account_create
        name   = module.addon-irsa["storegateway"].service_account_name
        annotations = module.addon-irsa["storegateway"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["storegateway"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    ruler = {
      enabled = var.ruler_enabled
      serviceAccount = {
        create = module.addon-irsa["ruler"].service_account_create
        name   = module.addon-irsa["ruler"].service_account_name
        annotations = module.addon-irsa["ruler"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["ruler"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    receive = {
      enabled = var.receive_enabled
      serviceAccount = {
        create = module.addon-irsa["receive"].service_account_create
        name   = module.addon-irsa["receive"].service_account_name
        annotations = module.addon-irsa["receive"].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa["receive"].iam_role_attributes.arn
        } : tomap({})
      }
    }

    receiveDistributor = {
      enabled = var.receivedistributor_enabled
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
