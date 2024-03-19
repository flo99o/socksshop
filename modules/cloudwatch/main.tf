resource "aws_cloudwatch_log_group" "web_logs" {
  name              = "/aws/ecs/web"
  retention_in_days = 7 # Gardez les journaux pendant 7 jours
}

resource "aws_cloudwatch_log_stream" "web_log_stream" {
  name           = "web_logs_stream"
  log_group_name = aws_cloudwatch_log_group.web_logs.name
}