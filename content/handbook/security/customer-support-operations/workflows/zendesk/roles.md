---
title: Roles
description: Operations workflow page for Zendesk custom roles
canonical_path: "/handbook/security/customer-support-operations/workflows/zendesk/roles"
---

{{% alert title="Note" color="primary" %}}

Guide changes are classified as ad-hoc as the changes are made directly in Zendesk. Once changes are made in Zendesk they are live.

Changes to these can cause severe problems if you have not thoroughly tested them. Exercise extreme caution before proceeding.

{{% /alert %}}

## Creating a role

{{% alert title="Note" color="danger" %}}

Exercise extreme caution when dealing with roles. You can cause severe security incidents or severely break agent workflows.

{{% /alert %}}

You will make the change directly in Zendesk. Remember any changes should also be reflected in the [Roles documentaiton](../../docs/zendesk/roles) (as it is the single source of truth).

## Editing a role

{{% alert title="Note" color="danger" %}}

Due to the potential downstream impact, you should _never_ edit a role. If you are looking to make changes to a role, you should make a new role and migrate users over to it.

{{% /alert %}}

## Deleting a role

{{% alert title="Note" color="danger" %}}

Due to the potential downstream impact, you should _never_ delete a role.

{{% /alert %}}

## Changing the role of an agent

{{% alert title="Note" color="danger" %}}

This can be a very dangerous action that can have significant downstream impacts. Exercise extreme caution in doing so.

{{% /alert %}}

When changing the role of an agent, you need to consider what access they _currently have_ and what access _they will lose_. The system is made so that when an agent's role changes, the various items they own are modified to reflect their new access. Some important examples are:

- If an agent had the ability to publicly reply to tickets but loses it, all their assigned tickets will be unassigned from them
- If an agent had the ability to manage dashboards in Explore, they will no longer be able to do so. If no other person was given edit rights, it will effectively lock the dashboard from future edits (without the intervention of an administrator)

You will make the change directly in Zendesk. Remeber to update the agent's correspoding YAML file in [gitlab-support-readiness/support-team](https://gitlab.com/gitlab-support-readiness/support-team) if they have one.
