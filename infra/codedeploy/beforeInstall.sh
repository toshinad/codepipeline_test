#!/bin/bash

set -e

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

BASE=/opt/codepipeline-test
cd $BASE

if [ -e ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
fi