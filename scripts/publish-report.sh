#!/usr/bin/env bash
REPORT=$(node ./scripts/format-report.js "$TRAVIS_BUILD_NUMBER" /tmp/latest_test_report.json)
BODY=$(jq --arg body "$REPORT" '{"body":$body}' <<< {})
curl -X POST -H "User-Agent: $USER_AGENT" --data "$BODY" "https://$GITHUB_API@api.github.com/repos/83372/practice_language_basics/issues/$ISSUE_NUMBER/comments" > /dev/null
