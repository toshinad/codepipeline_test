#!/bin/bash

set -e

echo `pwd`
. /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive/infra/codedeploy/env.sh

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh
  ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh
fi