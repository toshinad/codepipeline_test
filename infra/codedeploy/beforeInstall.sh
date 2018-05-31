#!/bin/bash

set -e

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

export ENVIRONMENT=$DEPLOYMENT_GROUP_NAME
export BASE=/opt/app/instagram-admin
export DEPLOY=$BASE-$ENVIRONMENT
export CURRENT=$BASE-$ENVIRONMENT-`date '+%Y%m%d%H%M%S'`

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
fi