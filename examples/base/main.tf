module "auto-alarm-cdk-tf-wrapper" {
  source = "../.."
  branch = "main"
  region = "us-east-2"
  prometheus_workspace_id = ""
}
