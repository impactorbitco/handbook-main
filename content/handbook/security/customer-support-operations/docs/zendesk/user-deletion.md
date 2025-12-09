---
title: User Deletion
description: Operations documentation page for Zendesk user deletion
canonical_path: "/handbook/security/customer-support-operations/docs/user-deletion"
---

{{% alert title="Note" color="danger" %}}

This is an informational page for Zendesk user deletion. This should never be done manually and only as part of automations, unless specifically stated by another process.

{{% /alert %}}

## Zendesk Global

This process relies heavily on custom deletion scripts to work. Please review the following projects so you can better understand the automation/scripting aspect of all this:

- [User Deletion for Zendesk Global](https://gitlab.com/gitlab-support-readiness/zendesk-global/users/deletion)

### Criteria for standard deletion

The following criteria is used to determine user deletion:

- The user is not associated to an organization
- The user is not suspended
- The user was created over 3 years ago
- The user has not logged in for the last 3 months
- The user is not a GitLab controlled end-user

### User deletions

Everyday at 0045 UTC, the User Deletion project will locate the first 1000 users to delete. They are deleted via batch jobs (100 at a time).

## Zendesk US Government

This process relies heavily on the [ZD-SFDC sync](/handbook/security/customer-support-operations/docs/zendesk-salesforce-sync) and custom deletion scripts to work. Please review the following projects so you can better understand the automation/scripting aspect of all this:

- [User Deletion for Zendesk US Government](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/users/deletion)

### Criteria for standard deletion

For users not controlled via the [ZD-SFDC sync](/handbook/security/customer-support-operations/docs/zendesk-salesforce-sync) and who are not protected, we delete them daily. For users within Zendesk that are found to meet this criteria, the scripts delete them (unless they have non-closed tickets under them).

### User deletions

Every day at 0045 Pacific, the User Deletion project will locate the first 500 users to delete.

For those without non-closed tickets:

- They are deleted via batch jobs (100 at a time)

For those with non-closed tickets:

- They are simply ignored for the time being
