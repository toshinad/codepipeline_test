#!/bin/bash

set -e

export ENVIRONMENT=$DEPLOYMENT_GROUP_NAME
export BASE=/opt/codepipeline-test
export DEPLOY=$BASE-$ENVIRONMENT
export CURRENT=$BASE-$ENVIRONMENT-`date '+%Y%m%d%H%M%S'`

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh
  ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh
fi