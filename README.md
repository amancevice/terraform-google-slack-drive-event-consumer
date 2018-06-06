# Slack Drive Event Consumer

Consume Slack events for Slack Drive from Google Cloud Pub/Sub using Cloud Functions.

## Quickstart

Download the credentials file from Google Cloud for your service account and rename to `client_secret.json`.


In the same directory as the credentials file, create `config.json` and `terraform.tfvars` files.

Fill `config.json` with the Slack Drive config.

Fill `terraform.tfvars` with (at minimum) the following variables:

```terraform
bucket_name = "<cloud-storage-bucket-name>"
project     = "<cloud-project-id>"
```

Then, create a [`terraform.tf`](./src/terraform.tf) file with the following contents (filling in the module version):

```terraform
provider "google" {
  credentials = "${file("client_secret.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
  version     = "~> 1.13"
}

module "slack_drive_event_consumer" {
  source      = "amancevice/slack-drive-event-consumer/google"
  version     = "<version>"
  bucket_name = "${var.bucket_name}"
  project     = "${var.project}"
}

variable "bucket_name" {
  description = "Cloud Storage bucket for storing Cloud Function code archives."
}

variable "project" {
  description = "The ID of the project to apply any resources to."
}

variable "region" {
  description = "Cloud region name."
  default     = "us-central1"
}
```

Approve & apply the infrastructure with:

```
terraform apply
```
