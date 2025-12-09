---
title: Test quarantine quick reference
description: What to do when you encounter a test failure or quarantine merge request
---

Quarantine temporarily removes flaky or broken tests from CI execution while preserving them for fixing.
It's not about getting a green pipeline—it's about reducing noise so new failures aren't missed.
Quarantine is always temporary: tests must be fixed, removed, or moved to a lower test level.

Tests can either enter quarantine via a merge request being raised manually, or the semi automated process.

This process is part of [Phase 1 of the quarantine improvement initiative](https://gitlab.com/groups/gitlab-org/quality/-/epics/259).

## Assigned a quarantine merge request

If you have been assigned a quarantine MR, you have been identified as an appropriate DRI to review the quarantine for the failing test.
When you're assigned an automated quarantine merge request:

1. **Review within 48 hours**.
1. **Decide the best approach**:
    - **Fix immediately**: If the root cause is clear and fixable within 2 weeks.
    - **Delete the test**: If it's low-value or redundant.
    - **Convert to lower level**: If it can be tested more reliably at unit or integration level.
    - **Quarantine**: If investigation takes longer than 2 weeks.
1. **Take action within 2 weeks**:
    - Merge the merge request (test enters quarantine), OR
    - Fix the test and close the merge request, OR
    - Provide feedback on why it shouldn't be quarantined.

**If no action is taken**:

- The merge request is approved by the Pipeline DRI after 2 weeks.
- The test enters long-term quarantine.
- The 3-month deletion countdown begins.

**Your responsibilities after merging**:

- Investigate the root cause.
- Update the issue with progress weekly.
- Resolve or remove within 3 months.

For more information, see the [detailed quarantine process](test-governance/detailed-quarantine-process.md).

## How tests become quarantined

The test was identified as flaky from the associated [Test Failure Issue](https://gitlab.com/gitlab-org/quality/test-failure-issues/-/issues),
which tracked its repeated failure.

This started a semi-automated process of raising a quarantine merge request, so teams can action the test.

## Dequarantine a test

Before dequarantining:

- Verify the test passes consistently.
- Ensure the root cause is identified and fixed.
- Commit to monitoring for 1 week after dequarantine.

**Steps**:

1. Create a merge request:
    - Remove the `quarantine:` metadata attached to the spec.
    - Include evidence of verification.
1. After merge, monitor for 1 week:
    - Watch `#master-broken` for failures.
    - Check test failure issues.
    - Re-quarantine immediately if it fails again.
1. After 1 week of stable runs, close the quarantine issue.

## Related topics

- [Detailed quarantine process](test-governance/detailed-quarantine-process.md)
- [Quarantine improvement initiative epic](https://gitlab.com/groups/gitlab-org/quality/-/epics/259): Full context

## Get help

- **Process questions**: `#g_test_governance` - [Test Governance Group](../infrastructure-platforms/developer-experience/test-governance)
- **General questions**: `#s_developer_experience` - [Developer Experience Stage](../infrastructure-platforms/developer-experience)
- **Technical help**: `#development` - General development help
- **Urgent issues**: `#master-broken` - Immediate pipeline issues
