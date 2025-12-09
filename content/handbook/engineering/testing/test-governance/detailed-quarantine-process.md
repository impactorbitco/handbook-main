---
title: Detailed quarantine process
description: Detailed overview of GitLab's test quarantine process
---

The quarantine process helps maintain pipeline stability by temporarily removing flaky or broken tests
from CI execution while preserving them for future fixing. Quarantine is intended to be a temporary state,
with the test either fixed or removed from the test suite.

## Prerequisites

Before you quarantine a test, you must have a relevant issue. Test failure and flaky issues are created automatically when a test fails on a scheduled pipeline. Issues such as bug defects may have been manually created.

The pipeline job retries failed tests. When the test fails again, a test failure issue is either updated (if it is found to exist) or created.
If environment issues are found on an end-to-end test pipeline, a test environment issue is raised instead.
You can also create a test failure issue manually in the
[Test Failure Issues](https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues/new) project.

The issue must include:

- The correct `group::*` label (for example, `group::code_review`). For failure issues created due to
  a failing pipeline test, these labels are applied automatically by the labeler.
- A link to the failing pipeline or job.
- The stack trace and failure pattern.
- The `~"failure::flaky-test"` label.

A long-term quarantine merge request is created and assigned to an appropriate DRI (Engineering Manager or code owner based on
the `feature_category` metadata).

The DRI should review the merge request and decide whether to:

- Merge it (test enters long-term quarantine).
- Fix the test immediately.
- Delete the test as low-value.
- Move it down a level on the test pyramid (for example, from an end-to-end spec to a frontend spec).

NOTE:
This classification process is part of Phase 1 and uses ClickHouse data to identify truly flaky tests,
reducing false-positive quarantines. See below.

## Flaky Test Failure Tracking Systems

### 1. Test Failure Issues

**Backend:** GitLab issues
**Data pushed from:** CI jobs
**Code lives in:** https://gitlab.com/gitlab-org/ruby/gems/gitlab_quality-test_tooling

**How it works:**

Takes an RSpec JSON report, parses it, and creates/updates a test failure issue with new test case failures found in the JSON report. It manages the labels it adds to the issue when certain test case failure thresholds are crossed (e.g., flakiness labels, or group/category labels). Those issues are closed after 30 days of inactivity by triage-ops.

See [Flaky tests tracking for non-E2E tests issue](https://gitlab.com/gitlab-org/quality/engineering-productivity/team/-/issues/581) for more information.

### 2. ci-alerts and ClickHouse

🚧 **Under active development.** Mentioned for additional context.

**Backend:** ClickHouse
**Data pushed from:** CI jobs
**Code lives in:** https://gitlab.com/gitlab-org/ruby/gems/gitlab_quality-test_tooling (in an RSpec formatter)

**How it works:**

Test case failures are pushed to ClickHouse from CI jobs. ci-alerts fetches the test case failures data from ClickHouse, filters master-broken incidents from it, and creates issues for the top flaky tests it could find (see issues).

The "raw" data for test case failures can be viewed in the DevEx Grafana instance.

The "flaky tests data" (i.e., test case failures classified between flaky or master-broken) can also be viewed from Grafana:

- Flaky Tests Overview dashboard
- Single Test File Failure Overview

Both dashboards currently live in our Grafana sandbox folder (which is currently experimental 🧪).

## Quarantine types

### Long-term quarantine

Use long-term quarantine when:

- The root cause is unknown and requires extensive investigation.
- You don't have immediate bandwidth available for this specific test.
- Investigation is expected to take longer than 3 days.

To use long-term quarantine:

1. Ensure the test has valid `feature_category` metadata.
1. Create a quarantine merge request with `quarantine: '<issue-url>'` metadata.
1. Add the `~"quarantine"` label to the merge request.
1. Link the merge request to the test failure issue.

The maximum duration for long-term quarantine is 3 months (3 milestones or releases).
The owner or Engineering Manager is alerted by the Quarantine Notification System that the test
is to be deleted. The Quarantine Cleanup System then creates the deletion merge request to be actioned by the Pipeline DRI within a week.

### Fast quarantine

Use fast quarantine when:

- A test failure is blocking critical development work and needs immediate quarantine.
- The root cause is known or easily identifiable.
- You can commit to providing an update within 3 days.

To use fast quarantine:

1. Follow the [fast quarantine automation](https://gitlab.com/gitlab-org/quality/engineering-productivity/fast-quarantine) process.
1. Create or update the test failure issue.
1. Add the correct labels and feature category.

Within 3 days, you must do one of the following:

- Fix the test and dequarantine it.
- Remove the test if it's unfixable.
- Convert the test to a lower level spec.
- Convert to long-term quarantine with an investigation plan.

WARNING:
If you don't take action within 3 days, the test enters long-term quarantine.

#### Quarantine metadata types

When you quarantine a test, use one of the following quarantine types. If the reason for quarantine
is not listed, consider contributing to this list.

| Quarantine type | Description |
|-----------------|-------------|
| `:flaky` | This test fails intermittently. |
| `:bug` | This test is failing due to a bug in the application. |
| `:stale` | This test is outdated due to a feature change in the application and must be updated to fit the new changes. |
| `:broken` | This test is failing because of a change to the test code or framework. |
| `:waiting_on` | This test is quarantined temporarily due to an issue or merge request that is a prerequisite for this test to pass. |
| `:investigating` | This test is a `:flaky` test but it might be blocking other merge requests and should be quarantined while it's under investigation. |
| `:test_environment` | This test is failing due to problems with the test environment and will not be fixed within 24 hours. |
| `:dependency` | This test is failing due to an external dependency the test is reliant on, but is outside of GitLab's control. |

NOTE:
Be sure to attach an `issue` to the quarantine metadata. This issue is used for tracking the average age
of quarantined tests.

#### Examples

```ruby
it 'is flaky', quarantine: { issue: 'https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues/12345', type: :flaky }

it 'is due to a bug', quarantine: {
  issue: 'https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues/12345',
  type: :bug
}

context 'when these tests rely on another MR', quarantine: {
  type: :waiting_on,
  issue: 'https://gitlab.com/gitlab-org/gitlab/-/merge_requests/12345'
}
```

#### Nested contexts

You should apply the quarantine tag to the outermost `describe` or `context` block that has tags
relevant to the test being quarantined.

```ruby
# Good
RSpec.describe 'Plan', :smoke, quarantine: { issue: 'https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues/12345', type: :flaky } do
  describe 'Feature' do
    before(:context) do
      # This before(:context) block is only executed in smoke quarantine jobs
    end
  end
end

# Bad
RSpec.describe 'Plan', :smoke do
  describe 'Feature', quarantine: { issue: 'https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues/12345', type: :flaky } do
    before(:context) do
      # This before(:context) block could be mistakenly executed in quarantine jobs that don't have the smoke tag
    end
  end
end
```

## Quarantine lifecycle

### Timeline expectations

| Phase | Duration | Action required |
|-------|----------|-----------------|
| Fast quarantine | 3 days | Fix, remove, or convert to long-term |
| Long-term quarantine | 3 months maximum | Investigation and resolution |
| Deletion warning | 1 week | Final opportunity to resolve |
| Automatic deletion | After 3 months | Test permanently removed |

### Automated quarantine merge requests

The process creates automated quarantine merge requests for consistently failing flaky tests.

When you're assigned a quarantine merge request:

1. Review it within 48 hours (optional for test changes, mandatory for test framework changes).
1. Decide the best approach:
    - **Fix immediately**: If the root cause is clear and fixable within 2 weeks.
    - **Delete the test**: If it's low-value or redundant.
    - **Convert to lower level**: If it can be tested more reliably at unit or integration level.
    - **Quarantine**: If investigation takes longer than 2 weeks.
1. Merge it or provide feedback within 2 weeks.
1. Create a follow-up issue for investigation or fix.
1. Update the issue when the fix is scheduled.

If you don't take action:

- The merge request is approved by the Pipeline DRI after 2 weeks.
- The test enters long-term quarantine.
- The 3-month deletion timeline begins.

Throughout the quarantine period, you receive:

- **Weekly reminders**: To encourage progress updates and resolution.
- **One week before deletion**: Final warning notification.
- **At deletion**: Confirmation that the test has been removed.

## Dequarantine a test

### Prerequisites

Before you dequarantine a test, ensure that one of the following is true:

- The test passes consistently (more than 100 local runs), and the root cause is identified and fixed.
- The test is removed or replaced with better coverage.

You must also have a plan to monitor the test for 1 week after dequarantine, and commit to
re-quarantine immediately if failures occur.

### Dequarantine the test

To dequarantine a test:

1. Verify the fix locally by running the test multiple times without failure.
1. Create a merge request:
    1. Remove the `quarantine: 'issue-url'` metadata from the test.
    1. Link to the original quarantine issue.
    1. Include evidence of your verification.
1. After the merge request is merged, monitor the test for 1 week:
    1. Watch `#master-broken` for failures.
    1. Check test failure issues for new reports.
    1. Be prepared to re-quarantine immediately if needed.
1. After 1 week of stable runs, close the quarantine issue:
    1. Document the root cause and fix.
    1. Add the `~"quarantine::resolved"` label.

### If the test fails again

If a dequarantined test fails again:

1. Re-quarantine immediately using fast quarantine.
1. Update the original issue with new failure information.
1. Reassess whether the test should be:
    - Moved to a lower test level.
    - Removed entirely.
    - Subject to deeper investigation.

If a test is quarantined 3 or more times:

- The test is a candidate for permanent removal.
- Discuss with the Test Governance team in `#g_test_governance`.
- Consider alternative testing approaches.

## Ownership and accountability

### Who owns a quarantined test

Ownership is determined by `feature_category`. Each feature category maps to a specific engineering group,
which is responsible for all tests with their feature category.

### Ownership responsibilities

When your test is quarantined:

1. Acknowledge within 48 hours.
1. Investigate the root cause.
1. Provide a timeline for resolution.
1. Update the issue with progress weekly.
1. Resolve or remove within 3 months.

If you don't maintain ownership:

- The test is automatically deleted after 3 months.
- Your team's test health metrics might be impacted.
- Repeated issues might require Test Governance intervention.

## Automated cleanup process

### Three-month deletion timeline

- **Months 1-2**: Active quarantine period. Teams are expected to investigate and resolve.
  Weekly progress updates are encouraged.
- **Month 3**: Final warning period. One week advance notification is sent to test owners.
  A deletion merge request is created and assigned to the team. This is the last opportunity
  to resolve or justify an extension.
- **After 3 months**: Automatic deletion. The test is permanently removed from the codebase.
  The quarantine issue is closed with a deletion note. The team is notified of removal.

### Notification process

Throughout the quarantine lifecycle, owners receive automated notifications:

- **Weekly reminders**: While test is in quarantine, to encourage progress updates.
- **One week before deletion**: Final warning with link to deletion merge request.
- **At deletion**: Notification that test has been removed.

The deletion merge request:

- Is assigned to the relevant Engineering Manager or code owners.
- Is tagged with mentions.
- **Requires manual approval by the Pipeline DRI** (semi-automatic process, not fully automatic).
- Provides one final opportunity to resolve or justify an extension.

## Quarantine reporting

To maintain visibility and accountability:

- **Weekly summaries**: Sent to engineering teams with current quarantine status and encouragement to resolve tests.
- **Monthly rollups**: Provided to senior management on test health metrics.
- **Team dashboards**: Available to track your team's quarantined tests by feature category.

These reports help ensure quarantine remains a temporary state, not a backlog.

For more information, see the [quarantine improvement initiative epic](https://gitlab.com/groups/gitlab-org/quality/-/epics/259).

## Special cases

### Environment-specific issues

For staging environment problems:

- Tests might be marked as `~"failure::investigating"` instead of quarantine.
- Infrastructure team involvement is required.
- Different SLA expectations apply.

### Backport support

Support for fast quarantine in backport scenarios is planned for a future phase. Currently, if you need
to quarantine a test in a backport:

1. Use the standard long-term quarantine process.
1. Coordinate with Release Managers in `#releases`.
1. Document the backport context in the quarantine issue.

## Tools and resources

### Fast quarantine tool

The [fast-quarantine](https://gitlab.com/gitlab-org/quality/engineering-productivity/fast-quarantine)
repository automates merge request creation for immediate quarantine.

## Glossary

- **Test Failure Issue**: Failure issues raised when a test fails in a pipeline. They can also be manually created. See the [Test Failure Issue project](https://gitlab.com/gitlab-org/quality/test-failure-issues/).
- **Quarantine merge request**: A merge request that quarantines a test such that it is ignored on test pipeline executions. The metadata includes the type of failure and the Test Failure Issue.
- **Flaky test**: An unreliable test that occasionally fails but passes eventually if you retry it enough times. See [Flaky Tests handbook page](../flaky-tests/automated-reporting-of-the-most-flaky-specs.md).

## Get help

For process questions:

- `#g_test_governance` - Test Governance team
- `#s_developer_experience` - Developer Experience team

For technical issues:

- `#development` - General development help
- `#master-broken` - Immediate pipeline issues

For ownership questions:

- Check the feature category mapping.
- Ask in relevant team channels.
- Escalate to `#g_test_governance`.
