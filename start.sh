#!/bin/bash

EC2_INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id )
provision=$(curl -H "Content-Type: application/json" -X POST -d '{"instance_id": $EC2_INSTANCE_ID}' $CHECKPOINT_URL)
log=$($provision)

echo $log
