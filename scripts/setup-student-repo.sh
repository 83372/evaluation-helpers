#!/usr/bin/env bash
set -x

pushd ..
git clone --mirror "https://$GITHUB_API@github.com/$ASSIGNMENT_REPO_SLUG" $ASSIGNMENT_REPO_SLUG/.git
pushd $ASSIGNMENT_REPO_SLUG
git config --bool core.bare false
popd

git clone "https://$GITHUB_API@github.com/$TESTCASES_REPO_SLUG" $TESTCASES_REPO_SLUG/
pushd $TESTCASES_REPO_SLUG
ls -al
npm install
popd

popd
pwd
