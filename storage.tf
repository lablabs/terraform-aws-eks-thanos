
# S3 bucket

module "thanos_s3" {
  source             = "cloudposse/s3-bucket/aws"
  version            = "0.42.0"
  acl                = "private"
  enabled            = var.enabled
  policy             = local.s3_policy
  user_enabled       = false
  versioning_enabled = false
  kms_master_key_arn = module.thanos_key.key_arn
  sse_algorithm      = "aws:kms"
  name               = module.label.name
  stage              = module.label.stage
  environment        = module.label.environment
  namespace          = module.label.namespace
  tags               = module.label.tags
}

# KMS key used for SSE in S3 store

module "thanos_key" {
  source                  = "cloudposse/kms-key/aws"
  version                 = "0.11.0"
  description             = "KMS key for thanos S3"
  deletion_window_in_days = 10
  policy                  = local.kms_policy
  enable_key_rotation     = true
  name                    = module.label.name
  stage                   = module.label.stage
  environment             = module.label.environment
  namespace               = module.label.namespace
  tags                    = module.label.tags
}

locals {
  object_name          = "${module.label.namespace}-${module.label.environment}-${module.label.stage}-${module.label.name}"
  s3_policy            = length(var.thanos_s3_access) == 0 ? try(data.aws_iam_policy_document.thanos_account[0].json, null) : try(data.aws_iam_policy_document.thanos_cross_account[0].json, null)
  kms_policy           = length(var.thanos_s3_access) == 0 ? try(data.aws_iam_policy_document.thanos_account_kms[0].json, null) : try(data.aws_iam_policy_document.thanos_cross_account_kms[0].json, null)
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "thanos" {
  count = var.enabled ? 1 : 0
  statement {
    sid     = "FullObjectStorePermissions"
    effect  = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject"
    ]
    resources = ["arn:aws:s3:::${local.object_name}", "arn:aws:s3:::${local.object_name}/*"]
  }

  statement {
    sid = "KMS"
    actions = [
      "kms:GenerateDataKey",
      "kms:Encrypt",
      "kms:Decrypt"
    ]
    resources = [module.thanos_key.key_arn]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "thanos" {
  count       = var.enabled ? 1 : 0
  name        = "${local.object_name}-policy"
  path        = "/"
  description = "Policy for thanos service"

  policy = data.aws_iam_policy_document.thanos[0].json
}

data "aws_iam_policy_document" "thanos_assume" {
  count = var.enabled ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.k8s_namespace}:${var.thanos_storegateway_k8s_service_account_name}",
        "system:serviceaccount:${var.k8s_namespace}:${var.thanos_storeapi_k8s_service_account_name}",
        "system:serviceaccount:${var.k8s_namespace}:${var.thanos_compactor_k8s_service_account_name}",
        "system:serviceaccount:${var.k8s_namespace}:${var.thanos_ruler_k8s_service_account_name}",
        "system:serviceaccount:${var.k8s_namespace}:${var.thanos_bucketweb_k8s_service_account_name}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "thanos" {
  count              = var.enabled ? 1 : 0
  name               = "${local.object_name}-thanos-role"
  assume_role_policy = data.aws_iam_policy_document.thanos_assume[0].json
  tags               = module.label.tags
}

resource "aws_iam_role_policy_attachment" "thanos" {
  count      = var.enabled ? 1 : 0
  role       = aws_iam_role.thanos[0].name
  policy_arn = aws_iam_policy.thanos[0].arn
}

data "aws_iam_policy_document" "thanos_account" {
  count = var.enabled ? 1 : 0
  statement {
    sid     = "AllowBucketStoreAccess"
    effect  = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject"
    ]

    resources = ["arn:aws:s3:::${local.object_name}", "arn:aws:s3:::${local.object_name}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "thanos_cross_account" {
  count = var.enabled ? 1 : 0
  statement {
    sid    = "AllowBucketStoreAccess"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject"
    ]

    resources = ["arn:aws:s3:::${local.object_name}", "arn:aws:s3:::${local.object_name}/*"]

    dynamic "principals" {
      for_each = var.thanos_s3_access
      content {
        identifiers = formatlist("arn:aws:iam::%s:root", principals.value)
        type        = "AWS"
      }
    }
  }
}

data "aws_iam_policy_document" "thanos_account_kms" {
  count = var.enabled ? 1 : 0
  statement {
    sid    = "AllowFullKMS"
    effect = "Allow"
    #checkov:skip=CKV_AWS_111
    actions = [
      "kms:*"
    ]

    #checkov:skip=CKV_AWS_109    
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "thanos_cross_account_kms" {
  count = var.enabled ? 1 : 0
  statement {
    sid    = "AllowFullKMS"
    effect = "Allow"
    #checkov:skip=CKV_AWS_111
    actions = [
      "kms:*"
    ]

    #checkov:skip=CKV_AWS_109
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }

  statement {
    sid    = "AllowKMSEncryptDecrypt"
    effect = "Allow"
    actions = [
      "kms:GenerateDataKey",
      "kms:Encrypt",
      "kms:Decrypt"
    ]

    #checkov:skip=CKV_AWS_109
    resources = ["*"]

    dynamic "principals" {
      for_each = var.thanos_s3_access
      content {
        identifiers = formatlist("arn:aws:iam::%s:root", principals.value)
        type        = "AWS"
      }
    }
  }
}

output "thanos_s3_arn" {
  value       = module.thanos_s3.bucket_arn
  description = "Thanos S3 bucket ARN"
}

output "thanos_s3_id" {
  value       = module.thanos_s3.bucket_id
  description = "Thanos S3 bucket id (name)"
}

output "thanos_kms_arn" {
  value       = module.thanos_key.key_arn
  description = "Thanos KMS ARN"
}

output "thanos_sa_role_arn" {
  value = try(aws_iam_role.thanos[0].arn, {})
  description = "Thanos Service Account ARN"
}
