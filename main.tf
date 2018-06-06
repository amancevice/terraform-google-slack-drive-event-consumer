provider "archive" {
  version = "~> 1.0"
}

locals {
  version = "0.0.1"
}

// Event Consumer archive
data "archive_file" "archive" {
  type        = "zip"
  output_path = "${path.module}/dist/${var.function_name}-${local.version}.zip"

  source {
    content  = "${file("${path.module}/index.js")}"
    filename = "index.js"
  }

  source {
    content  = "${file("${path.module}/package.json")}"
    filename = "package.json"
  }

  source {
    content  = "${file("${var.config}")}"
    filename = "config.json"
  }

  source {
    content  = "${file("${var.client_secret}")}"
    filename = "client_secret.json"
  }
}

// Event Consumer Cloud Storage archive
resource "google_storage_bucket_object" "archive" {
  bucket = "${var.bucket_name}"
  name   = "${var.bucket_prefix}${var.function_name}-${local.version}.zip"
  source = "${data.archive_file.archive.output_path}"
}

// Event Consumer Cloud Function
resource "google_cloudfunctions_function" "event_consumer" {
  name                  = "${var.function_name}"
  description           = "Slack event consumer"
  available_memory_mb   = "${var.memory}"
  source_archive_bucket = "${google_storage_bucket.slack_drive_bucket.name}"
  source_archive_object = "${google_storage_bucket_object.archive.name}"
  trigger_topic         = "${var.pubsub_topic}"
  timeout               = "${var.timeout}"
  entry_point           = "consumeEvent"

  labels {
    deployment-tool = "terraform"
  }
}
