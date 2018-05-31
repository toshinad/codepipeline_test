#!/bin/bash

ENVIRONMENT=$DEPLOYMENT_GROUP_NAME

BASE=/opt/codepipeline-test

cd $BASE/..
mv codepipeline-test codepipeline-test-$ENVIRONMENT.`date '+%Y%m%d%H%M%S'`

echo "$ENVIRONMENT afterInstall" >> /tmp/result.txt
