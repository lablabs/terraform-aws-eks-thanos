locals {
  values_default = yamlencode({
    query : {
      enabled : var.thanos_query_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["query"].arn, var.thanos_query_role_arn)
        }
      }
    }
    queryFrontend : {
      enabled : var.thanos_queryfrontend_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["queryFrontend"].arn, var.thanos_queryfrontend_role_arn)
        }
      }
    }
    bucketweb : {
      enabled : var.thanos_bucketweb_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["bucketweb"].arn, var.thanos_bucketweb_role_arn)
        }
      }
    }
    compactor : {
      enabled : var.thanos_compactor_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["compactor"].arn, var.thanos_compactor_role_arn)
        }
      }
    }
    storegateway : {
      enabled : var.thanos_storegateway_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["storegateway"].arn, var.thanos_storegateway_role_arn)
        }
      }
    }
    ruler : {
      enabled : var.thanos_ruler_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["ruler"].arn, var.thanos_ruler_role_arn)
        }
      }
    }
    receive : {
      enabled : var.thanos_receive_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["receive"].arn, var.thanos_receive_role_arn)
        }
      }
    }
    receiveDistributor : {
      enabled : var.thanos_receivedistributor_enabled
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : try(aws_iam_role.this["receivedistributor"].arn, var.thanos_receivedistributor_role_arn)
        }
      }
    }
  })
}

data "utils_deep_merge_yaml" "values" {
  count = var.enabled ? 1 : 0
  input = compact([
    local.values_default,
    var.values
  ])
}
