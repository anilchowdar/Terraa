#----------------------------------------------------------
# AWS Glue Source& Destination crawler outputs
#----------------------------------------------------------

output "aws_source_crawler_id" {
  value = aws_glue_crawler.Glue_Source_Crawler.id
}

output "aws_dest_crawler_id" {
  value = aws_glue_crawler.Glue_Dest_Crawler.id
}

#----------------------------------------------------------
# AWS Glue S3 Bucket outputs
#----------------------------------------------------------


