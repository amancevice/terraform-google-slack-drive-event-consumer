/**
 * Required Variables
 */
variable "bucket_name" {
  description = "Cloud Storage bucket for storing Cloud Function code archives."
}

/**
 * Optional Variables
 */
variable "bucket_prefix" {
  description = "Prefix for Cloud Storage bucket."
  default     = ""
}

variable "client_secret" {
  description = "Google Cloud client secret JSON filename."
  default     = "client_secret.json"
}

variable "config" {
  description = "App config JSON filename."
  default     = "config.json"
}

variable "function_name" {
  description = "Cloud Function for publishing events from Slack to Pub/Sub."
  default     = "slack-drive-event-consumer"
}

variable "memory" {
  description = "Memory for Slack event listener."
  default     = 128
}

variable "pubsub_topic" {
  description = "Pub/Sub topic name."
  default     = "slack-events"
}

variable "region" {
  description = "The region to operate under, if not specified by a given resource."
  default     = "us-central1"
}

variable "slash_command" {
  description = "Name of slash command in Slack"
  default     = "drive"
}

variable "timeout" {
  description = "Timeout in seconds for Slack event listener."
  default     = 60
}
