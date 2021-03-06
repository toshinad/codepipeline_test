#!/bin/bash

set -e

export ENVIRONMENT=$DEPLOYMENT_GROUP_NAME
export BASE=/opt/codepipeline-test
export DEPLOY=$BASE-$ENVIRONMENT
export CURRENT=$BASE-$ENVIRONMENT-`date '+%Y%m%d%H%M%S'`

if [ -e $DEPLOY ]
then
  cd $DEPLOY
fi

if [ -e ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
fi