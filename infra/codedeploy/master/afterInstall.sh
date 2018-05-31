#!/bin/bash

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

. ./infra/codedeploy/env.sh

cd $BASE/..
mv $BASE $CURRENT
ln -nfs $CURRENT $DEPLOY
ln -nfs $CURRENT $BASE

echo "$ENVIRONMENT afterInstall" >> /tmp/result.txt
