resource "aws_glue_job" "job_name" {
  count = var.create_glue_job ? 1 : 0

  name              = var.glue_job_name
  description       = var.glue_job_description
  role_arn          = var.glue_crawler_role
  max_retries       = var.glue_job_max_retry
  timeout           = var.glue_job_timeout
  glue_version      = "2.0"
  worker_type       = var.glue_job_worker_type
  number_of_workers = var.glue_job_workers

  command = var.glue_job_command

  default_arguments = var.glue_job_arguments

  execution_property {
    max_concurrent_runs = 1
  }
}
