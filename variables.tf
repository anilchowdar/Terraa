#----------------------------------------------------------
# Global or default variables
#----------------------------------------------------------

variable "aws_region" {
  default = "us-east-1"
}

#----------------------------------------------------------
# AWS Glue Source Crawler variables
#----------------------------------------------------------

variable "enable_source_glue_crawler" {
  description = "Enable terraform-aws-glue crawler usage"
  default     = false
}

variable "glue_source_crawler_name" {
  description = "Name of the crawler."
  type        = string
  default     = "Terraform-Test"
}

variable "glue_crawler_database_name" {
  description = "Glue database where results are written."
  type        = string
  default     = "Terraform-Test"
}

variable "glue_crawler_role" {
  description = "(Required) The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources."
  default     = ""
}

variable "glue_source_crawler_description" {
  description = "(Optional) Description of the crawler."
  default     = ""
}

variable "glue_crawler_configuration" {
  type    = string
  default = ""
}

variable "glue_crawler_scheduler" {
  type    = string
  default = ""
}

variable "glue_crawler_tags" {
  type = map
  default = {
    Name = "Test"
    Date = "04/17/2021"
  }
}

variable "scripts_s3_path" {
  type    = string
  default = "s3://terraform-up-and-running-state-03-10/global/"
}

#----------------------------------------------------------
# AWS Glue dest Crawler
#----------------------------------------------------------

variable "enable_dest_glue_crawler" {
  description = "Enable terraform-aws-glue crawler usage"
  default     = false
}


variable "glue_dest_crawler_name" {
  description = "Name of the crawler."
  type        = string
  default     = "Terraform-Test"
}

variable "glue_dest_crawler_description" {
  description = "(Optional) Description of the crawler."
  default     = ""
}

variable "glue_dest_crawler_configuration" {
  type    = string
  default = ""
}

variable "glue_dest_crawler_scheduler" {
  type    = string
  default = ""
}

variable "glue_dest_crawler_tags" {
  type = map
  default = {
    Name = "Test-2"
    Date = "04/17/2021"
  }
}

#----------------------------------------------------------
# AWS Glue Job variables
#----------------------------------------------------------

variable "glue_job_name" {
  type    = string
  default = ""
}

variable "glue_job_description" {
  type    = string
  default = ""
}


variable "glue_job_worker_type" {
  type    = list(string)
  default = ["G.1X, G.2X"]
}

variable "glue_job_workers" {
  type    = any
  default = ""
}

variable "glue_job_command" {
  type    = string
  default = ""
}


variable "glue_script_location" {
  type    = string
  default = ""
}

variable "glue_job_max_retry" {
  type    = number
  default = 2
}

variable "glue_job_timeout" {
  type    = number
  default = 3600
}

variable "glue_job_arguments" {
  type = map(string)
  default = {
  }
}

variable "create_glue_job" {
  type    = bool
  default = true
}

#----------------------------------------------------------
# AWS Glue Source Trigger
#----------------------------------------------------------

variable "source_trigger_actions" {
  type    = list
  default = []
}

variable "glue_trigger_type" {
  type    = list(string)
  default = [""]
}

variable "glue_source_trigger_name" {
  type    = string
  default = ""
}

variable "enable_glue_trigger" {
  type    = bool
  default = true
}



#----------------------------------------------------------
# AWS Glue Source Trigger
#----------------------------------------------------------







