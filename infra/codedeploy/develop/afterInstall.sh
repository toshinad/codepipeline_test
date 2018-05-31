#!/bin/bash

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

BASE=/opt/codepipeline-test
DEPLOY=$BASE-$ENVIRONMENT
CURRENT=$BASE-$ENVIRONMENT.`date '+%Y%m%d%H%M%S'`

cd $BASE/..
mv $BASE $CURRENT
ln -nfs $CURRENT $DEPLOY
ln -nfs $CURRENT $BASE

echo "$ENVIRONMENT afterInstall" >> /tmp/result.txt
