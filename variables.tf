variable "aws_region" {
  default = "us-east-1"
}


variable "enable_glue_crawler" {
  description = "Enable terraform-aws-glue crawler usage"
  default     = false
}

variable "glue_crawler_name" {
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

variable "glue_crawler_description" {
  description = "(Optional) Description of the crawler."
  default     = null
}

variable "glue_crawler_classifiers" {
  description = "(Optional) List of custom classifiers. By default, all AWS classifiers are included in a crawl, but these custom classifiers always override the default classifiers for a given classification."
  default     = null
}

variable "glue_crawler_configuration" {
  description = "(Optional) JSON string of configuration information."
  default     = null
}

variable "glue_crawler_schedule" {
  description = "(Optional) A cron expression used to specify the schedule. For more information, see Time-Based Schedules for Jobs and Crawlers. For example, to run something every day at 12:15 UTC, you would specify: cron(15 12 * * ? *)."
  default     = null
}

variable "glue_crawler_security_configuration" {
  description = "(Optional) The name of Security Configuration to be used by the crawler"
  default     = null
}

variable "glue_crawler_table_prefix" {
  description = "(Optional) The table prefix used for catalog tables that are created."
  default     = null
}

variable "glue_crawler_dynamodb_target" {
  description = "(Optional) List of nested DynamoDB target arguments."
  default     = []
}

variable "glue_crawler_jdbc_target" {
  description = "(Optional) List of nested JBDC target arguments. "
  default     = []
}

variable "glue_crawler_s3_target" {
  description = "(Optional) List nested Amazon S3 target arguments."
  default     = []
}

variable "glue_crawler_catalog_target" {
  description = "(Optional) List nested Amazon catalog target arguments."
  default     = []
}

variable "glue_crawler_schema_change_policy" {
  description = "(Optional) Policy for the crawler's update and deletion behavior."
  default     = []
}

variable "s3_path" {
  type    = string
  default = "s3://terraform-up-and-running-state-03-10/global/"
}


/*
variable "amiid" {
  type    = string
  default = "ami-0742b4e673072066f"
}

variable "instancetype" {
  type    = string
  default = "t3.micro"
}

variable "env" {
  type    = string
  default = "prod"
}

variable "dev" {
  type    = string
  default = "dev"
}





variable "keynamee" {
  type    = string
  default = ""
}
*/
