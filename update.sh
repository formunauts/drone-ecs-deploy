#!/bin/bash

if [ -z ${PLUGIN_CLUSTER} ]; then
  echo "missing cluster"
  exit 1
fi

if [ -z ${PLUGIN_IMAGE_NAME} ]; then
  echo "missing image"
  exit 1
fi

if [ -z ${PLUGIN_SERVICE} ]; then
  echo "missing service"
  exit 1
fi

if [ -z ${PLUGIN_AWS_REGION} ]; then
  PLUGIN_AWS_REGION="us-east-1"
fi

if [ -z ${PLUGIN_TIMEOUT} ]; then
  PLUGIN_TIMEOUT="300"
fi

if [ -z ${PLUGIN_MAX} ]; then
  PLUGIN_MAX="200"
fi

if [ -z ${PLUGIN_MIN} ]; then
  PLUGIN_MIN="100"
fi

if [ ! -z ${PLUGIN_AWS_ACCESS_KEY_ID} ]; then
  AWS_ACCESS_KEY_ID=$PLUGIN_AWS_ACCESS_KEY_ID
fi

if [ ! -z ${PLUGIN_AWS_SECRET_ACCESS_KEY} ]; then
  AWS_SECRET_ACCESS_KEY=$PLUGIN_AWS_SECRET_ACCESS_KEY
fi

args=()
args+=(
  "--region ${PLUGIN_AWS_REGION}"
  "--cluster ${PLUGIN_CLUSTER}"
  "--image ${PLUGIN_IMAGE_NAME}"
  "--service-name ${PLUGIN_SERVICE}"
  "--timeout ${PLUGIN_TIMEOUT}"
  "--min ${PLUGIN_MIN}"
  "--max ${PLUGIN_MAX}"
)

if [ ! -z ${PLUGIN_ROLE} ]; then
  args+=( "--aws-assume-role ${PLUGIN_ROLE}" )
fi

if [[ -z ${PLUGIN_AWS_ACCESS_KEY_ID} || -z ${PLUGIN_AWS_SECRET_ACCESS_KEY} ]]; then
  args+=( "--aws-instance-profile" )
fi

ecs-deploy ${args[@]}
