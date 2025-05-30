moved {
  from = kubernetes_manifest.this
  to   = module.addon.kubernetes_manifest.this
}

moved {
  from = helm_release.this
  to   = module.addon.helm_release.this
}

moved {
  from = helm_release.argo_application
  to   = module.addon.helm_release.argo_application
}

moved {
  from = aws_iam_role.this["query"]
  to   = module.addon-irsa["query"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["queryfrontend"]
  to   = module.addon-irsa["queryfrontend"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["bucketweb"]
  to   = module.addon-irsa["bucketweb"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["compactor"]
  to   = module.addon-irsa["compactor"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["storegateway"]
  to   = module.addon-irsa["storegateway"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["ruler"]
  to   = module.addon-irsa["ruler"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["receive"]
  to   = module.addon-irsa["receive"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_role.this["receivedistributor"]
  to   = module.addon-irsa["receivedistributor"].aws_iam_role.this[0]
}
