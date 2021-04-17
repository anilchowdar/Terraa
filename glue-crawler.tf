resource "aws_glue_crawler" "Glue_Source_Crawler" {
  count         = var.enable_source_glue_crawler ? 2 : 0
  database_name = var.glue_crawler_database_name
  name          = var.glue_source_crawler_name
  role          = var.glue_crawler_role
  description   = var.glue_source_crawler_description
  schedule      = var.glue_crawler_scheduler

  tags = var.glue_crawler_tags

  s3_target {
    path = var.scripts_s3_path
  }
}

resource "aws_glue_crawler" "Glue_Dest_Crawler" {
  count         = var.enable_dest_glue_crawler ? 2 : 0

  database_name = var.glue_crawler_database_name
  name          = var.glue_dest_crawler_name
  role          = var.glue_crawler_role
  description   = var.glue_dest_crawler_description
  schedule      = var.glue_dest_crawler_scheduler

  tags = var.glue_dest_crawler_tags

  s3_target {
    path = var.scripts_s3_path
  }
}

