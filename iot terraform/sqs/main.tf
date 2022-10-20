resource "aws_sqs_queue" "results_updates_queue" {
    name = "results-updates-queue"
    visibility_timeout_seconds = 300

    tags = {
        Environment = "dev"
    }
}