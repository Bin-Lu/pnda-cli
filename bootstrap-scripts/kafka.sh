#!/bin/bash -v

# This script runs on instances with a node_type tag of "kafka"
# It sets the roles that determine what software is installed
# on this instance by platform-salt scripts


# The pnda_env-<cluster_name>.sh script generated by the CLI should
# be run prior to running this script to define various environment
# variables

# Parameters:
#  $1 - node index for this kafka node - as this node type may be horizontally scaled, should start at 0.

set -e

cat >> /etc/salt/grains <<EOF
roles:
  - kafka
broker_id: $1
EOF

cat >> /etc/salt/grains <<EOF
vlans:
  pnda: $PNDA_INTERNAL_NETWORK
  ingest: $PNDA_INGEST_NETWORK
EOF
