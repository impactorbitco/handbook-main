---
title: Groups
description: Operations workflow page for Zendesk groups
canonical_path: "/handbook/security/customer-support-operations/workflows/zendesk/groups"
---

{{% alert title="Note" color="primary" %}}

All group creations are handled via an ad-hoc deployment.

All group updates are handled via a standard deployment.

{{% /alert %}}

## Creating a group

For these, you will need to create a corresponding group file in the sync repo.

You should also do this in a way that creates a MR. Said MR should always be peer reviewed before merging (the MR should enforce this).

## Editing a group

{{% alert title="Note" color="danger" %}}

Due to the potential downstream impact, you should _never_ edit a group. If you are looking to make changes to a group's name, you should make a new group and migrate users over to it.

{{% /alert %}}

## Deleting a group

{{% alert title="Note" color="danger" %}}

Due to the potential downstream impact, you should _never_ delete a group.

{{% /alert %}}

## Removing an agent from a group

{{% alert title="Note" color="danger" %}}

This can be a very dangerous action that can have significant downstream impacts. Exercise extreme caution in doing so.

{{% /alert %}}

When removing an agent from a group, you need to consider their assigned tickets. If they have them assigned to the group they are being removed from, the tickets will be unassigned from them.

You will make the change directly in Zendesk. Remeber to update the agent's correspoding YAML file in [gitlab-support-readiness/support-team](https://gitlab.com/gitlab-support-readiness/support-team) if they have one. If this is changing their default group, remember to make the changes accordingly in the agent syncs:

- [Zendesk Global](https://gitlab.com/gitlab-support-readiness/zendesk-global/users/agents)
- [Zendesk US Government](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/users/agents)

## Exception deployment

To perform an exception deployment for groups, navigate to the groups project in question, go to the scheduled pipelines page, and click the play button. This will trigger a sync job for the groups.

## Repo links

- [Zendesk Global sync repo](https://gitlab.com/gitlab-support-readiness/zendesk-global/groups)
- [Zendesk US Government sync repo](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/groups)
