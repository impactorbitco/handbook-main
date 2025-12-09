---
title: "Automated Reporting of the most flaky specs"
---

## Overview

This document outlines the automated process for identifying, tracking, and reporting most flaky specs for [gitlab-org/gitlab](https://gitlab.com/gitlab-org/gitlab) & [gitlab-org/gitlab-foss](https://gitlab.com/gitlab-org/gitlab-foss) projects. The system runs weekly to detect the most problematic flaky specs and creates issues for investigation by development teams.

## How It Works

### Schedule

- **Frequency**: Weekly on Sundays at 10:00 UTC
- **Pipeline Schedule**: [`create-update-issues-for-top-flaky-tests` (internal)](https://gitlab.com/gitlab-org/quality/analytics/ci-alerts/-/pipeline_schedules)

### Process Overview

#### 1. Update Most Flaky Specs Job (`update-most-flaky-specs`)

This job maintains existing flaky spec issues by:

- Searching for open issues with the `automation:top-flaky-spec` label in [gitlab-org/quality/test-failure-issues (internal)](https://gitlab.com/gitlab-org/quality/test-failure-issues) project
- Querying Snowflake for new failures since each issue was created
- Adding comments with details about new failures to existing issues

#### 2. Report Most Flaky Specs Job (`report-most-flaky-specs`)

This job identifies new flaky specs by:

- Querying Snowflake for RSpec specs failure data for:
  - `gitlab-org/gitlab`
  - `gitlab-org/gitlab-foss`
- Filtering out failures related to:
  - Master broken incidents
  - Valid failures
- Identifying the **top 10 most flaky specs** based on pipeline impact
- Creating issues only for specs that don't already have existing issues

> **Note**: The filtering logic is not 100% accurate due to the difficulty of reliably identifying all master broken incidents related failures and valid failures. Manual review is required as described below in [Manual Follow-Up Steps](#manual-follow-up-steps).

### Issue Creation Details

Each automatically created issue includes:

**Labels**:

- `automation:top-flaky-spec`
- `automation:bot-authored`
- `backlog::prospective`
- `type::maintenance`

**Content**:

- Comprehensive description with test-specific details
- List of failures for up to 10 tests within a spec from the past week
- Debugging guidance and data collection instructions
- Validation steps for confirming when flakiness is fixed

## Manual Follow-Up Steps

After issues are automatically created:

1. **Review**: A development analytics engineer reviews all generated issues
2. **Validation**: Confirms that issues highlight actual flaky specs (not false positives)
3. **Tracking**: Adds `flaky-test-reviewed` label to mark the issue as reviewed
4. **Assignment**: Assigns validated issues to the appropriate stage groups for investigation and resolution

## Triage using GitLab Duo Agent

The `ci-alerts` project now includes a [duo chat template (internal)](https://gitlab.com/gitlab-org/quality/analytics/ci-alerts/-/blob/main/templates/flaky-test-triage-report-template.md) to triage and generate a structured report for flaky specs. Follow the steps below to triage an issue created for a flaky specs using duo:

[Video (internal)](https://drive.google.com/file/d/1YQtxCrZNlPXnyxzlZoJTDkc0IbPT0qd0/view?usp=sharing)

### Locally in Code editor

Open the [`ci-alerts`](https://gitlab.com/gitlab-org/quality/analytics/ci-alerts) project locally and ask duo agentic chat the following questions

1. _**"Triage this flaky test issue <issue_url> using `flaky-test-triage-report-template.md`"**_ to generate the report.
2. If satisfied with the report details, prompt duo agent "Post as a comment" to post the report as a comment on the issue.

### On browser

Open the [duo chat template](https://gitlab.com/gitlab-org/quality/analytics/ci-alerts/-/blob/main/templates/flaky-test-triage-report-template.md) on the browser, select the required duo agentic chat model (claude/chatgpt) and ask the same questions as above.

## Links

- [Reviewed open issues for the most flaky specs (internal)](https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues?sort=created_date&state=opened&label_name%5B%5D=automation%3Atop-flaky-spec&label_name%5B%5D=flaky-test-reviewed)
- [All open issues for the most flaky specs (internal)](https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues?sort=created_date&state=opened&label_name%5B%5D=automation%3Atop-flaky-spec)

## Legacy Links (Used to report failures per test, not per spec)

- [Reviewed open issues for the most flaky tests (internal)](https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues?sort=created_date&state=opened&label_name%5B%5D=automation%3Atop-flaky-test&label_name%5B%5D=flaky-test-reviewed)
- [All open issues for the most flaky tests (internal)](https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues?sort=created_date&state=opened&label_name%5B%5D=automation%3Atop-flaky-test)

## Data Source

All test failure data is sourced from **Snowflake** queries that analyze historical pipeline failures and identify patterns indicating flaky behavior.

---

_This process is maintained by the Development Analytics team. For questions or issues with the automation, please contact the team in #g_development_analytics or create an issue in [ci-alerts (internal)](https://gitlab.com/gitlab-org/quality/analytics/ci-alerts) project._
