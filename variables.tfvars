glue_job_name        = "Terraform-Test"
glue_job_description = "Testing for terraform"
glue_job_worker_type = "G1.X"
glue_job_workers     = 2
glue_script_location = "#S3"
glue_job_max_retry   = 60
glue_job_timeout     = 3600
glue_job_arguments = {
  "--job-language"          = "python"
  "--ENV"                   = "env"
  "--spark-event-logs-path" = "s3://my_bucket"
  "--job-bookmark-option"   = "job-bookmark-enable"
  "--enable-spark-ui"       = "true"
}
glue_job_command = {
  script_location = "s3://terraform-up-and-running-state-03-10/global/"
  python_version  = "3"
}


