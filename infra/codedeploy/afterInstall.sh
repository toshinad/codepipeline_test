#!/bin/bash

set -e

. ./infra/codedeploy/env.sh

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
  ./infra/codedeploy/$ENVIRONMENT/afterInstall.sh
fi
