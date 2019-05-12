#!/usr/bin/env bash
set -x

pushd ..
git clone -b $BRANCH_TO_CHECKOUT "https://$GITHUB_API@github.com/$ASSIGNMENT_REPO_SLUG" $ASSIGNMENT_REPO_SLUG
git clone --depth=1 "https://$GITHUB_API@github.com/$TESTCASES_REPO_SLUG" $TESTCASES_REPO_SLUG
pushd $TESTCASES_REPO_SLUG
npm install
npm install mocha ./mocha-json-reporter
popd
popd
pwd
