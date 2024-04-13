resource "aws_sns_topic" "sns" {
  name                        = "${var.name}-sns"
  fifo_topic                  = false
  content_based_deduplication = false
}
