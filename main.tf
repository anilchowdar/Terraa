
resource "aws_glue_crawler" "Glue_Crawler" {
  database_name = var.glue_crawler_database_name
  name          = var.glue_crawler_name
  role          = var.glue_crawler_role

  s3_target {
    path = var.s3_path
  }
}





