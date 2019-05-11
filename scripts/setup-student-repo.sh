#!/usr/bin/env bash

pushd ..
git clone --mirror "https://$GITHUB_API@github.com/$ASSIGNMENT_REPO_SLUG" $ASSIGNMENT_REPO_SLUG/.git
pushd $ASSIGNMENT_REPO_SLUG
git config --bool core.bare false
popd
ls -al
popd
pwd
