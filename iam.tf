locals {
  irsa_role_map = {
    query = {
      enabled             = var.enabled && var.thanos_query_enabled
      service_account     = var.thanos_query_service_account_name
      additional_policies = var.thanos_query_irsa_additional_policies
      role_arn            = var.thanos_query_role_arn
    }
    queryfrontend = {
      enabled             = var.enabled && var.thanos_queryfrontend_enabled
      service_account     = var.thanos_queryfrontend_service_account_name
      additional_policies = var.thanos_queryfrontend_irsa_additional_policies
      role_arn            = var.thanos_queryfrontend_role_arn
    }
    bucketweb = {
      enabled             = var.enabled && var.thanos_bucketweb_enabled
      service_account     = var.thanos_bucketweb_service_account_name
      additional_policies = var.thanos_bucketweb_irsa_additional_policies
      role_arn            = var.thanos_bucketweb_role_arn
    }
    compactor = {
      enabled             = var.enabled && var.thanos_compactor_enabled
      service_account     = var.thanos_compactor_service_account_name
      additional_policies = var.thanos_compactor_irsa_additional_policies
      role_arn            = var.thanos_compactor_role_arn
    }
    storagegateway = {
      enabled             = var.enabled && var.thanos_storagegateway_enabled
      service_account     = var.thanos_storagegateway_service_account_name
      additional_policies = var.thanos_storagegateway_irsa_additional_policies
      role_arn            = var.thanos_storagegateway_role_arn
    }
    ruler = {
      enabled             = var.enabled && var.thanos_ruler_enabled
      service_account     = var.thanos_ruler_service_account_name
      additional_policies = var.thanos_ruler_irsa_additional_policies
      role_arn            = var.thanos_ruler_role_arn
    }
    receive = {
      enabled             = var.enabled && var.thanos_receive_enabled
      service_account     = var.thanos_receive_service_account_name
      additional_policies = var.thanos_receive_irsa_additional_policies
      role_arn            = var.thanos_receive_role_arn
    }
    receivedistributor = {
      enabled             = var.enabled && var.thanos_receivedistributor_enabled
      service_account     = var.thanos_receivedistributor_service_account_name
      additional_policies = var.thanos_receivedistributor_irsa_additional_policies
      role_arn            = var.thanos_receivedistributor_role_arn
    }
  }

  additional_policies_list = flatten([
    for component, value in local.irsa_role_map : [
      for policy, arn in value.additional_policies : {
        key        = "${component}-${policy}"
        component  = component
        policy_arn = arn
      }
      if value.enabled && value.role_arn == ""
    ]
  ])

  additional_policies_map = {
    for item in local.additional_policies_list :
    item.key => {
      component  = item.component
      policy_arn = item.policy_arn
    }
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = local.additional_policies_map

  role       = aws_iam_role.this[each.value.component].name
  policy_arn = each.value.policy_arn
}

data "aws_iam_policy_document" "this_irsa" {
  for_each = {
    for component, value in local.irsa_role_map :
    component => value
    if value.enabled && value.role_arn == ""
  }

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"
      values = [
        "system:serviceaccount:${var.k8s_namespace}:${each.value.service_account}",
      ]
    }
  }
}

resource "aws_iam_role" "this" {
  for_each = {
    for component, value in local.irsa_role_map :
    component => value
    if value.enabled && value.role_arn == ""
  }

  name               = "${var.k8s_irsa_role_name_prefix}-${var.helm_chart_name}-${each.key}"
  assume_role_policy = data.aws_iam_policy_document.this_irsa[each.key].json
}
