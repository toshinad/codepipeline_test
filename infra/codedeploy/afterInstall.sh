#!/bin/bash

set -e

echo `pwd`
. /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive/infra/codedeploy/env.sh

if [ -e $DEPLOY ]
then
  cd $DEPLOY
else
  cd $BASE
fi

if [ -e ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
fi
