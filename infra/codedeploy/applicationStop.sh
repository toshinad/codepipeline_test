#!/bin/bash

set -e

echo `pwd`
. ./infra/codedeploy/env.sh

cd $DEPLOY

if [ -e ./infra/codedeploy/$ENVIRONMENT/applicationStart.sh ]
then
  chmod +x ./infra/codedeploy/$ENVIRONMENT/applicationStop.sh
  ./infra/codedeploy/$ENVIRONMENT/applicationStop.sh
fi
