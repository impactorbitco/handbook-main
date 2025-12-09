---
title: Organization Deletion
description: Operations documentation page for Zendesk organization deletion
canonical_path: "/handbook/security/customer-support-operations/docs/org-deletion"
---

{{% alert title="Note" color="danger" %}}

This is an informational page for Zendesk organization deletion. This should never be done manually and only as part of automations, unless specifically stated by another process.

{{% /alert %}}

This process relies heavily on the [ZD-SFDC sync](/handbook/security/customer-support-operations/docs/zendesk-salesforce-sync) and custom deletion scripts to work. Please review the following projects so you can better understand the automation/scripting aspect of all this:

- [Organization Deletion for Zendesk Global](https://gitlab.com/gitlab-support-readiness/zendesk-global/organizations/deletion)
- [Organization Deletion for Zendesk US Government](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/organizations/deletion)

## Criteria for standard deletion

As per our [Data Retention policy](https://about.gitlab.com/privacy/#data-retention) and in accordance with various governing laws/regulations, we delete an organization 3 years after their last valid subscription has expired. So if an organization's last valid subscription expired 2021-12-18, then the date it would be eligible for deletion would be 2024-12-18. For organizations within Zendesk (both instances) that are found to meet this criteria, the scripts delete them (unless they have non-closed tickets under them).

## Organizaton deletions

Once a week, the Organization Deletion project for the corresponding Zendesk instance will locate the first 500 organizations to delete.

For those without non-closed tickets:

- They are deleted via batch jobs (100 at a time)

For those with non-closed tickets:

- They are updated to indicate deletion should be ignored

## Exceptions review

Once a month, our team should review any organizations that are exempty from deletion (via a search `ignore_deletion:true`). If the org in question should be deleted, uncheck the box that says to ignore deletion. If it should still be exempt, leave it as is.
