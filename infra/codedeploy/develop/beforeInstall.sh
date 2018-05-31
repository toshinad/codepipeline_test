#!/bin/bash

BASE=/opt/codepipeline-test

cd $BASE/..
mv codepipeline-test codepipeline-test.`date '+%Y%m%d%H%M%S'`
