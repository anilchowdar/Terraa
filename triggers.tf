#---------------------------------------------------
# AWS Glue trigger
#---------------------------------------------------
resource "aws_glue_trigger" "glue_trigger" {
  count = var.enable_glue_trigger ? 1 : 0

  name = var.glue_source_trigger_name
  type = upper(var.glue_trigger_type)

  description   = var.glue_trigger_description
  enabled       = var.glue_trigger_enabled
  schedule      = var.glue_trigger_schedule
  workflow_name = var.glue_trigger_workflow_name != "" && !var.enable_glue_workflow ? var.glue_trigger_workflow_name : element(concat(aws_glue_workflow.glue_workflow.*.id, [""]), 0)

  dynamic "actions" {
    iterator = actions
    for_each = var.glue_trigger_actions
    content {
      arguments = lookup(actions.value, "arguments", null)
      # Both JobName or CrawlerName cannot be set together in an action
      crawler_name = lookup(actions.value, "crawler_name", (var.enable_glue_crawler && !var.enable_glue_job ? element(concat(aws_glue_crawler.glue_crawler.*.id, [""]), 0) : null))
      job_name     = lookup(actions.value, "job_name", (var.enable_glue_job && !var.enable_glue_crawler ? element(concat(aws_glue_job.glue_job.*.id, [""]), 0) : null))
      timeout      = lookup(actions.value, "timeout", null)
    }
  }

  dynamic "predicate" {
    iterator = predicate
    for_each = var.glue_trigger_predicate
    content {
      logical = lookup(predicate.value, "logical", "AND")
      conditions {
        job_name         = lookup(predicate.value, "job_name", null)
        state            = lookup(predicate.value, "state", null)
        crawler_name     = lookup(predicate.value, "crawler_name", null)
        crawl_state      = lookup(predicate.value, "crawl_state", null)
        logical_operator = lookup(predicate.value, "logical_operator", null)
      }
    }
  }

  dynamic "timeouts" {
    iterator = timeouts
    for_each = var.glue_trigger_timeouts
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

  tags = merge(
    {
      Name = var.glue_trigger_name != "" ? lower(var.glue_trigger_name) : "${lower(var.name)}-glue-trigger-${lower(var.environment)}"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_glue_workflow.glue_workflow,
    aws_glue_crawler.glue_crawler,
    aws_glue_job.glue_job
  ]
}
