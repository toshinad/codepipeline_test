#!/bin/bash

export ENVIRONMENT=$DEPLOYMENT_GROUP_NAME
export BASE=/opt/codepipeline-test

export DEPLOY=$BASE-$ENVIRONMENT-`date
export CURRENT=$BASE-ENVIRONMENT-`date '+%Y%m%d%H%M%S'`
`
