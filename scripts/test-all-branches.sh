#!/usr/bin/env bash
CURRENT_DIR=$(pwd)
for branch in $(git  --git-dir ../../83372/$ASSIGNMENT_REPO_SLUG/.git  branch --list  | grep -v "^*" ) ; do (

  pushd ../../83372/$ASSIGNMENT_REPO_SLUG
  SOURCE_PATH=$(pwd)
  git checkout $branch
  pwd
  popd


  pushd ../../83372/$TESTCASES_REPO_SLUG
  export SOURCE_PATH=$SOURCE_PATH/src/
  ls -al
  mocha
  popd

); done
