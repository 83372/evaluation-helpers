#!/usr/bin/env bash
CURRENT_DIR=$(pwd)
pushd ../../83372/$ASSIGNMENT_REPO_SLUG
SOURCE_PATH=$(pwd)
git checkout $BRANCH_TO_CHECKOUT
pwd
popd


pushd ../../83372/$TESTCASES_REPO_SLUG
export SOURCE_PATH=$SOURCE_PATH/src/
ls -al
mocha
popd
