#!/bin/bash

export ENVIRONMENT=$DEPLOYMENT_GROUP_NAME
export BASE=/opt/codepipeline-test
export DEPLOY=$BASE-$ENVIRONMENT
