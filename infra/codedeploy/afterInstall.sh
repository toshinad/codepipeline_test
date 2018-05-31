#!/bin/bash

set -e

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

export ENVIRONMENT=$DEPLOYMENT_GROUP_NAME
export BASE=/opt/app/instagram-admin
export DEPLOY=$BASE-$ENVIRONMENT
export CURRENT=$BASE-$ENVIRONMENT-`date '+%Y%m%d%H%M%S'`

cd $BASE/..

mv $BASE $CURRENT
ln -nfs $CURRENT $DEPLOY
ln -nfs $CURRENT $BASE

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
fi
