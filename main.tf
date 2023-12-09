terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.51.0"
        }
    }
}

variable "region" {
  default = "europe-central2"
}

variable "project" {
  default = "veteran-bot-407514"
}

variable "zone" {
  default = "europe-central2-a"
}

provider "google" {
    credentials = file("veteran-bot-407514-0c3050495775.json")

    project = var.project
    region  = var.region
    zone    = var.zone
}

resource "google_artifact_registry_repository" "veteran-bot-gateway" {
    location = var.region
    repository_id = "veteran-bot-gateway"
    format = "docker"
}

resource "google_artifact_registry_repository" "veteran-bot-telegram" {
    location = var.region
    repository_id = "veteran-bot-telegram"
    format = "docker"
}


resource "google_artifact_registry_repository" "veteran-bot-viber" {
    location = var.region
    repository_id = "veteran-bot-viber"
    format = "docker"
}


resource "google_artifact_registry_repository" "veteran-bot-crm" {
    location = var.region
    repository_id = "veteran-bot-crm"
    format = "docker"
}

resource "google_pubsub_topic" "events-user-message-sent" {
  name = "events.user_message_sent"
}

resource "google_pubsub_topic" "events-broadcast-message-requested" {
  name = "events.user_created"
}

resource "google_pubsub_topic" "events-scheduled-message-triggered" {
  name = "events.scheduled_message_triggered"
}

resource "google_cloud_run_service" "veteran-bot-gateway" {
  name = "veteran-bot-gateway"
  location = var.region


  template {
    spec {
      containers {
        image = "europe-central2-docker.pkg.dev/${var.project}/veteran-bot-gateway/veteran-bot-gateway:latest"
      }
    }
	}
}


resource "google_cloud_run_service" "veteran-bot-gateway" {
  name = "veteran-bot-gateway"
  location = var.region


  template {
    spec {
      containers {
        image = "europe-central2-docker.pkg.dev/${var.project}/veteran-bot-gateway/veteran-bot-gateway:latest"
      }
    }
	}
}


resource "google_cloud_run_service" "veteran-bot-crm" {
  name = "veteran-bot-crm"
  location = var.region


  template {
    spec {
      containers {
        image = "europe-central2-docker.pkg.dev/${var.project}/veteran-bot-crm/veteran-bot-crm:latest"
      }
    }
	}
}


resource "google_cloud_run_service" "veteran-bot-viber" {
  name = "veteran-bot-viber"
  location = var.region


  template {
    spec {
      containers {
        image = "europe-central2-docker.pkg.dev/${var.project}/veteran-bot-viber/veteran-bot-viber:latest"
      }
    }
	}
}