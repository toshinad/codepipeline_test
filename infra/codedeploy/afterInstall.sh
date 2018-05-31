#!/bin/bash

set -e

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

BASE=/opt/codepipeline-test
cd $BASE

if [ -e ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
fi
