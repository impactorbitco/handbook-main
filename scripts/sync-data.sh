#!/bin/sh

set -eu

PUBLIC_DATA_DIR="data/public"
WWW_GITLAB_COM_REF=${WWW_GITLAB_COM_REF:-"master"}

# Only show debug info if DEBUG_DOWNSTREAM_SYNC is true
if [[ -n "${DEBUG_DOWNSTREAM_SYNC:-}" ]]; then
  echo "=== SYNC DATA DEBUG INFO ==="
  echo "WWW_GITLAB_COM_REF: ${WWW_GITLAB_COM_REF}"
  echo "CI_COMMIT_SHA: ${CI_COMMIT_SHA:-'not set'}"
  echo "CI_PIPELINE_SOURCE: ${CI_PIPELINE_SOURCE:-'not set'}"
  echo "BUILD_AND_TEST_ONLY: ${BUILD_AND_TEST_ONLY:-'not set'}"
  echo "DEBUG_DOWNSTREAM_SYNC: ${DEBUG_DOWNSTREAM_SYNC}"
  echo "Expected: specific commit SHA (not 'master')"
  echo "============================="
fi

download() {
  url=$1
  outfile=$2

  echo "fetching ${outfile} from ${url}..."
  wget --no-verbose --output-document "${outfile}" "${url}"
}

mkdir -p "$PUBLIC_DATA_DIR"

# Download the data files from the public handbook repo
data_files="\
addressable_markets.yml \
categories.yml \
currency_conversions.yml \
data_assets.yml \
data_warehouse_sources.yml \
domain_expertise.yml \
entity_mapper.yml \
features.yml \
jobs_to_be_done.yml \
pricing_themes.yml \
projects.yml \
release_post_managers.yml \
releases.yml \
sections.yml \
service_maturity.yml \
services.yml \
stages.yml \
tech_stack.yml \
"

echo "=== DOWNLOADING FILES FROM COMMIT: ${WWW_GITLAB_COM_REF} ==="

for file in $data_files; do
  outfile=$(basename "$file")
  url="https://gitlab.com/gitlab-com/www-gitlab-com/-/raw/${WWW_GITLAB_COM_REF}/data/${file}"

  download "$url" "$PUBLIC_DATA_DIR/$outfile"

  # Only show detailed verification if DEBUG_DOWNSTREAM_SYNC is true
  if [[ -n "${DEBUG_DOWNSTREAM_SYNC:-}" ]]; then
    echo "=== FILE SOURCE VERIFICATION: $outfile ==="
    echo "Downloaded from URL: $url"
    echo "Content hash: $(sha256sum "$PUBLIC_DATA_DIR/$outfile" | cut -d' ' -f1)"
    echo "=============================================="
  fi
done

# Download the team.yml file direct from the public handbook website.
# The combined team.yml is generated, so it's not checked in the repo.
# See www-gitlab-com/doc/team_database.md for more details.
download "https://about.gitlab.com/company/team/team.yml" "$PUBLIC_DATA_DIR/team.yml"

echo "=== SYNC COMPLETE ==="
