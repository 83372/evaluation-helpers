#!/usr/bin/env bash
set -x
REPORT=$(node ./scripts/format-report.js "$TRAVIS_BUILD_NUMBER" /tmp/latest_test_report.json)
BODY=$(jq --arg body "$REPORT" '{"body":$body}' <<< {})
curl -X GET   -H "User-Agent: $USER_AGENT"   "https://$GITHUB_API@api.github.com/repos/83372/practice_language_basics/issues/13/comments" | jq '.[] | .id' > comments.txt
curl -X POST -H "User-Agent: $USER_AGENT" --data "$BODY" "https://$GITHUB_API@api.github.com/repos/83372/practice_language_basics/issues/$ISSUE_NUMBER/comments" > /dev/null

cat comments.txt
for comment in $(cat comments.txt); do
  curl -X DELETE -H "User-Agent: $USER_AGENT" "https://$GITHUB_API@api.github.com/repos/83372/practice_language_basics/issues/comments/$comment" -v
done
