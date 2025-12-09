---
title: Debug Test Failures in Merge Requests with Duo
description: Concise guide to using Duo to diagnose and suggest fixes for test failures in a merge request.
---

## 🪄 Using Duo to Debug and Fix Test Failures in Your Merge Request

When your merge request has a failing test, use Duo to quickly determine if it's related to your changes and get a suggested fix.

> **💡 Tip:** Consider retrying the job immediately in case it's a transient failure. If it fails again, proceed with the debugging steps below.

1. **Navigate to your MR pipeline** and locate the failing job
1. **Open the failing job** that displays the test failure
1. **Invoke GitLab Duo** in the job log view (press `d` or click the Duo button in the top right corner)

   > **📝 Note:** Duo will automatically truncate lengthy job logs by removing the middle section. For greater accuracy, you can copy and paste the specific stack trace and error message into your prompt.
   >
   > **🌐 For browser-based tests:** Duo cannot download artifacts automatically. If needed, you can manually download the DOM from the `/tmp/capybara` directory (feature specs) or `failure_screenshots` directory (E2E tests) in the job artifacts and paste it into your prompt to help Duo debug browser-based failures. This also applies to other artifacts such as application logs.

1. **Clear previous context** to avoid confusion with other MRs:

   ```text
      /clear
   ```

1. **Prompt: Check if the test failure is widespread:**

   ```text
      I have a test failure in this job. Can you:
      1. Check recent issues at https://gitlab.com/gitlab-org/quality/engineering-productivity/master-broken-incidents/-/issues and https://gitlab.com/gitlab-org/quality/engineering-productivity/approved-mr-pipeline-incidents/-/issues/ to see if this failure is occurring in other merge requests or in master
      2. Let me know if this appears to be related to my MR changes or a widespread issue
   ```

1. **Prompt: If the failure appears to be related to the changes in the MR, prompt for a fix:**

   ```text
      Can you analyze what's causing this failure and provide a fix? Please:
      1. Infer the test type from the test file path
      2. Explain what's causing the failure
      3. If this is a stale test (test needs updating), provide a diff to fix the test
      4. If this is a bug in the application, explain the bug and provide a diff to fix the application code
   ```

**✅ What to expect:**

- Duo will provide a diff for specific code changes required
- Always review suggestions carefully before applying them
- Test the fix locally if possible before committing

## ⚠️ When Duo Can't Help

If Duo's analysis does not resolve your issue, follow these steps in order:

   1. **🔍 Verify it's a known failure** (< 2 minutes):
      - Check the Danger bot comment on your MR under the **"Pipelines failing on master"** section for links to known master-broken issues
      - Scan [**#master-broken**](https://gitlab.enterprise.slack.com/archives/CR6QH3D7C) (master branch failures) and [**#mr-blocked-by-master-broken**](https://gitlab.enterprise.slack.com/archives/C06KFK5EE73) (approved MR failures) Slack channels
   2. **💻 Try reproducing locally** (~10 minutes):
      - Execute the test against your GDK to confirm if it's environment-specific or a genuine issue
   3. **🚧 Request quarantine if needed**:
      - If the failure is blocking `master` and is unrelated to your changes, consider the [Detailed Quarantine Process](test-governance/detailed-quarantine-process.md)

## 📚 Related Resources

- [Testing Guide](_index.md) - Complete testing overview
- [GitLab Testing Guide](https://docs.gitlab.com/development/testing_guide) - Technical implementation details
- [Detailed Quarantine Process](test-governance/detailed-quarantine-process.md) - How to quarantine tests
- [Guide to E2E Test Failure Issues](guide-to-e2e-test-failure-issues.md) - Product engineer debugging guide

**Need help?** Reach out in [**#s_developer_experience**](https://gitlab.enterprise.slack.com/archives/C07TWBRER7H) or create a [Request for Help issue](https://gitlab.com/gitlab-org/quality/test-governance/request-for-help/-/issues/new)
