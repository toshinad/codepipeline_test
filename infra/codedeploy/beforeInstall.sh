#!/bin/bash

set -e

echo `pwd`
if [ -e /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive/infra/codedeploy/env.sh ]
then
  . /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive/infra/codedeploy/env.sh
fi

if [ -e $DEPLOY ]
then
  cd $DEPLOY

  if [ -e ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh ]
  then
    chmod +x ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
    ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
  fi
fi
