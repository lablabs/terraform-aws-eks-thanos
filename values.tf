locals {

  values = yamlencode({
    query : {
      enabled : "${var.thanos_query}"
      stores : "${var.thanos_query_stores}"
    }
    queryFrontend : {
      enabled : "${var.thanos_queryfrontend}"
    }
    storegateway : {
      enabled : "${var.thanos_storegateway}"
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : "${try(aws_iam_role.thanos[0].arn, {})}"
        }
      }
      sharded : {
        enabled : true
      }
    }
    compactor : {
      enabled : "${var.thanos_compactor}"
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : "${try(aws_iam_role.thanos[0].arn, {})}"
        }
      }
    }
    bucketweb : {
      enabled : "${var.thanos_bucketweb}"
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : "${try(aws_iam_role.thanos[0].arn, {})}"
        }
      }
    }
    objstoreConfig : {
      type : "S3",
      config : {
        bucket : "${module.thanos_s3.bucket_id}",
        region : "${module.thanos_s3.bucket_region}",
        endpoint : "s3.${module.thanos_s3.bucket_region}.amazonaws.com"
      }
    }
  })
}

data "utils_deep_merge_yaml" "values" {
  count = var.enabled ? 1 : 0
  input = compact([
    local.values,
    var.values
  ])
}
