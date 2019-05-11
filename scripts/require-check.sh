#!/usr/bin/env bash
CURRENT_DIR=$(pwd)
for branch in $(git  --git-dir ../../83372/$ASSIGNMENT_REPO_SLUG/.git  branch --list  | grep -v "^*" ) ; do (
  pushd ../../83372/$ASSIGNMENT_REPO_SLUG
  git checkout $branch
  pwd
  for d in ./*/ ; do (echo $d && node $CURRENT_DIR/scripts/require-all-files.js $(pwd)/$d); done
  popd
); done
