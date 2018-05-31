#!/bin/bash

set -e

. ./infra/codedeploy/env.sh

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/beforeInstall.sh
fi