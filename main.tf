terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8"
    }
  }
}

provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

resource "aws_msk_configuration" "msk_cluster_configuration" {
  kafka_versions = ["2.4.1.1"]
  name           = "demo-cluster-configuration"

  server_properties = <<PROPERTIES
auto.create.topics.enable = false
delete.topic.enable = true
compression.type = producer
default.replication.factor = 3
min.insync.replicas = 2
num.io.threads = 8
num.network.threads = 5
num.partitions = 1
num.replica.fetchers = 2
replica.lag.time.max.ms = 30000
socket.receive.buffer.bytes = 102400
socket.request.max.bytes = 104857600
socket.send.buffer.bytes = 102400
unclean.leader.election.enable = false
zookeeper.session.timeout.ms = 18000
PROPERTIES
}
