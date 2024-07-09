variable "prometheus_workspace_id" {
  description = "AWS managed prometheus workspace ID used for alarm creation"
  type        = string
  default = ""
}

variable "region" {
  description = "The AWS region to bootstrap"
  type        = string
}

variable "branch" {
  description = "The branch to download the tarball from"
  type        = string
  default = "main"
}
