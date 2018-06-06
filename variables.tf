/**
 * Required Variables
 */
variable "bucket_name" {
  description = "Cloud Storage bucket for storing Cloud Function code archives."
}

variable "channel" {
  description = "Slack channel ID for logging messages."
}

variable "client_secret" {
  description = "Google Cloud client secret JSON."
}

variable "project" {
  description = "The ID of the project to apply any resources to."
}

variable "web_api_token" {
  description = "Slack Web API token."
}

/**
 * Optional Variables
 */
variable "bucket_prefix" {
  description = "Prefix for Cloud Storage bucket."
  default     = ""
}

variable "color" {
  description = "Default color for slackbot message attachments."
  default     = "good"
}

variable "function_name" {
  description = "Cloud Function for publishing events from Slack to Pub/Sub."
  default     = "slack-drive-event-consumer"
}

variable "memory" {
  description = "Memory for Slack event listener."
  default     = 512
}

variable "pubsub_topic" {
  description = "Pub/Sub topic name."
  default     = "slack-events"
}

variable "slash_command" {
  description = "Name of slash command in Slack"
  default     = "drive"
}

variable "region" {
  description = "The region to operate under, if not specified by a given resource."
  default     = "us-central1"
}

variable "timeout" {
  description = "Timeout in seconds for Slack event listener."
  default     = 60
}

variable "users" {
  description = "Users to include/exclude"
  type        = "map"

  default {
    included = []
    excluded = [
      "USLACKBOT"
    ]
  }
}
