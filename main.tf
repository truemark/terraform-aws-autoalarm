resource "null_resource" "download_tarball" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -L https://api.github.com/repos/truemark/autoalarm/tarball/${var.branch} -o ${path.module}/autoalarm.tar.gz
    EOT
  }
}

resource "null_resource" "unpack_tarball" {
  depends_on = [null_resource.download_tarball]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      mkdir -p ${path.module}/autoalarm
      tar -xzf ${path.module}/autoalarm.tar.gz --strip-components=1 -C ${path.module}/autoalarm
    EOT
  }
}

resource "null_resource" "autoalarm_deploy" {
  depends_on = [null_resource.unpack_tarball]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      export AWS_REGION=${var.region}
      echo "AWS_REGION set to: ${var.region}"
      cd ${path.module}/autoalarm/cdk
      pnpm install --frozen-lockfile
      cd ../handlers
      pnpm install --frozen-lockfile
      cd ../ && pnpm build
      cd cdk
      pnpx aws-cdk@2.x deploy -c prometheusWorkspaceId=${var.prometheus_workspace_id} AutoAlarm --require-approval never
    EOT
  }
}

resource "null_resource" "cleanup" {
  depends_on = [null_resource.autoalarm_deploy]

  provisioner "local-exec" {
    command = <<EOT
      rm -rf ${path.module}/autoalarm ${path.module}/autoalarm.tar.gz
    EOT
  }
}

output "autoalarm_deployed" {
  value = "AutoAlarm deployed via CDK"
}
