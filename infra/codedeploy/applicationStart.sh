#!/bin/bash

set -e

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

BASE=/opt/codepipeline-test
cd $BASE

if [ -e ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh
  ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh
fi