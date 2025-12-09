#!/bin/bash

set -eu -o pipefail

echo "[]" >vale-codequality.json

# diff differently depending on if CI environment, fork, or local
# if CI_MERGE_REQUEST_SOURCE_PROJECT_PATH matches the current project, then it's not a fork
# if CI_PROJECT_ID matches the current project and CI_PIPELINE_SOURCE is not from a merge request, then it is not a fork
if [ "${CI_MERGE_REQUEST_SOURCE_PROJECT_PATH:-}" = "gitlab-com/content-sites/handbook" ] || ([ "${CI_PROJECT_ID:-}" = "42817607" ] && [ "${CI_PIPELINE_SOURCE:-}" != "merge_request_event" ]); then
    BRANCH_POINT="$(git merge-base "origin/${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}" "origin/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}")"
    MODIFIED_DEPENDENCY_FILES="$(git diff --name-only --diff-filter=d "${BRANCH_POINT}" "origin/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}" | grep -E '(^\.vale|\.gitlab-ci\.yml$)' || true)"
    MODIFIED_MD_FILES="$(git diff --name-only --diff-filter=d "${BRANCH_POINT}" "origin/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}" | grep '^content/.*\.md$' || true)"
elif [ -n "${CI_PROJECT_ID:-}" ]; then
    # assume otherwise it's a fork
    git fetch origin "${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}"
    # Add the fork as a remote and fetch the source branch
    git remote add fork "${CI_MERGE_REQUEST_SOURCE_PROJECT_URL}"
    git fetch fork "${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
    BRANCH_POINT="$(git merge-base "origin/${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}" "fork/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}")"
    MODIFIED_DEPENDENCY_FILES="$(git diff --name-only "${BRANCH_POINT}" "fork/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}" | grep -E '(^\.vale|\.gitlab-ci\.yml$)' || true)"
    MODIFIED_MD_FILES="$(git diff --name-only "${BRANCH_POINT}" "fork/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}" | grep '^content/.*\.md$' || true)"
    echo "CI_MERGE_REQUEST_TARGET_BRANCH_NAME: ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}"
    echo "CI_MERGE_REQUEST_SOURCE_PROJECT_URL: ${CI_MERGE_REQUEST_SOURCE_PROJECT_URL}"
    echo "CI_MERGE_REQUEST_SOURCE_BRANCH_NAME: ${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
    echo "BRANCH_POINT: ${BRANCH_POINT}"
    echo "MODIFIED_MD_FILES: ${MODIFIED_MD_FILES}"
elif [ -n "$1" ]; then
    # if $1 exists, locally specified a branch to check against
    if [[ -z ${STARTING_COMMIT+x} ]]; then
      STARTING_COMMIT="main..."
    fi

    MODIFIED_DEPENDENCY_FILES="$(git diff --name-only --diff-filter=d "${STARTING_COMMIT}$1" | grep -E '(^\.vale|\.gitlab-ci\.yml$)' || true)"
    MODIFIED_MD_FILES="$(git diff --name-only --diff-filter=d "${STARTING_COMMIT}$1" | grep '^content/.*\.md$' || true)"
else
    echo "No branch specified. If testing locally, specify source branch to check against main."
    exit 1
fi

MIN_ALERT_LEVEL="warning"

## lint all markdown files if .vale files or CI config are changed, otherwise only lint the changed markdown files
NON_TXT_VALE_FILES="$(echo "${MODIFIED_DEPENDENCY_FILES}" | grep '^\.vale' | grep -v '\.txt$' || true)"
if [ -n "${NON_TXT_VALE_FILES}" ] || echo "${MODIFIED_DEPENDENCY_FILES}" | grep -q '\.gitlab-ci\.yml$'; then
    echo "Vale config or dependencies changed, linting all markdown files..."
    MODIFIED_MD_FILES="$(find content -name '*.md')"
    MIN_ALERT_LEVEL="error"
elif [ -n "${MODIFIED_MD_FILES}" ]; then
    echo "Linting changed files: ${MODIFIED_MD_FILES}"
else
    echo "No Markdown files to lint."
    exit 0
fi

vale --output=.vale/vale-json.tmpl --minAlertLevel suggestion           --no-exit ${MODIFIED_MD_FILES} >vale-codequality.json
vale --output=.vale/vale.tmpl      --minAlertLevel "${MIN_ALERT_LEVEL}" ${MODIFIED_MD_FILES}
