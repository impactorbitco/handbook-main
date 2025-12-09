---
title: Deletion Schedules
description: Operations workflow page for Zendesk deletion schedules
canonical_path: "/handbook/security/customer-support-operations/workflows/zendesk/deletion-schedules"
---

{{% alert title="Note" color="primary" %}}

All deletion schedules creations and updates are handled via a standard deployment.

{{% /alert %}}

## Creating a deletion schedule

For these, you will need to create a corresponding deletion schedule file in the sync repo.

You should also do this in a way that creates a MR. Said MR should always be peer reviewed before merging (the MR should enforce this).

## Editing a deletion schedule

For these, you will need to update the corresponding deletion schedule file in the sync repo.

You should also do this in a way that creates a MR. Said MR should always be peer reviewed before merging (the MR should enforce this).

### Changing the title

If you need to update the title of a deletion schedule:

1. Locate the corresponding file
1. Rename the file to the new title
1. Copy the `title` value in the file to the `previous_title` value
1. Update the `title` value in the file to the new title

Doing it in this way will ensure the sync still locates the correct deletion schedule to update.

## Exception deployment

To perform an exception deployment for deletion schedules, navigate to the deletion schedules project in question, go to the scheduled pipelines page, and click the play button. This will trigger a sync job for the deletion schedules.

## Repo links

- [Zendesk Global sync repo](https://gitlab.com/gitlab-support-readiness/zendesk-global/deletion-schedules)
- [Zendesk US Government sync repo](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/deletion-schedules)
