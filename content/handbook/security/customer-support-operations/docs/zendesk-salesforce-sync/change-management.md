---
title: Change Management
description: Operations documentation page for the Zendesk-Salesforce sync change management
canonical_path: "/handbook/security/customer-support-operations/docs/zendesk-salesforce-sync/change-management/"
---

{{% alert title="Note" color="primary" %}}

Zendesk-Salesforce sync changes are classified as ad-hoc as once the changes are made, the next sync run will utilize them.

{{% /alert %}}

{{% alert title="Note" color="danger" %}}

The Zendesk-Salesforce sync is very, very complex. It is also very, very vital to the very core of GitLab's support systems. You should always exercise caution in making any changes. Test thoroughly, plan accordingly, ask for assistance often.

{{% /alert %}}

At its core, there are really only 4 types of changes that should occur on the Zendesk-Salesforce sync. Anything not listed here should be considered on a case by case basis.

## Modifying the plans file

Projects potentially impacted:

- [gitlab-support-readiness/zd-sfdc-sync/processor](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/processor)

This should occur due to changes in SKUs, and primarily be driven by announcements from the Billing and/or enterprise apps team. When notified of changes to the SKUs via their issue, create an administrative issue detailing the changes needed to the `plans.yaml` file.

From there, you need to modify the file itself to add/remove the product charge names as needed. If adding or removing an entire subscription, do note it is very likely to require work in many other areas (organization fields, ticket processor, etc.).

## Adding or removing object attributes

Projects potentially impacted:

- [gitlab-support-readiness/zd-sfdc-sync/salesforce-accounts](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/salesforce-accounts)
- [gitlab-support-readiness/zd-sfdc-sync/zendesk-orgs](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/zendesk-orgs)
- [gitlab-support-readiness/zd-sfdc-sync/processor](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/processor)
- [gitlab-support-readiness/zd-sfdc-sync/global-org-compare](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/global-org-compare)
- [gitlab-support-readiness/zd-sfdc-sync/us-gov-org-compare](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/us-gov-org-compare)
- [gitlab-support-readiness/zd-sfdc-sync/zendesk-global-org-sync](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/zendesk-global-org-sync)
- [gitlab-support-readiness/zd-sfdc-sync/zendesk-us-government-org-sync](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/zendesk-us-government-org-sync)
- [gitlab-support-readiness/zd-sfdc-sync/partner-sync](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/partner-sync)
- [gitlab-support-readiness/zd-sfdc-sync/zendesk-us-gov-user-sync](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/zendesk-us-gov-user-sync)

The cause of these can vary wildly. It could be due to changes in subscriptions, changes in calculations, etc. This is hard one to put much detail in, as it can vary so very much. This should involve ample planning and communication before being done (as it will likely result in substantial changes to Zendesk organizations).

## Changing entitlement calculations

Projects potentially impacted:

- [gitlab-support-readiness/zd-sfdc-sync/processor](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/processor)

This should occur very rarely. When it does need to occur, it will likely be due to a bug or substantial change in the support offerring logic. This will take ample testing and debugging. It is also very likely to result in substantial changes to Zendesk organizations.

## Modifying the pipeline schedule

Projects potentially impacted:

- [gitlab-support-readiness/zd-sfdc-sync/salesforce-accounts](https://gitlab.com/gitlab-support-readiness/zd-sfdc-sync/salesforce-accounts)

This should only occur when/if we get to a point where amount of customer's has grown to such a point the current timing is no longer viable. To do this, you would simply login as the correct bot account, navigate to the project, and modify the existing scheduled pipeline.
