#!/usr/bin/env bash
CURRENT_DIR=$(pwd)

pushd ../../83372/$ASSIGNMENT_REPO_SLUG
SOURCE_PATH=$(pwd)
popd

pushd ../../83372/$TESTCASES_REPO_SLUG
export SOURCE_PATH=$SOURCE_PATH/src/
mocha
npm test
# cat /tmp/latest_test_report.json
popd
