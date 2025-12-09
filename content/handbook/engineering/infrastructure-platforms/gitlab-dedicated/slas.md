---
title: "GitLab Dedicated SLAs"
---

## GitLab Dedicated: Service Level Availability and Disaster Recovery Plan

## Service Level Availability

For GitLab Dedicated, we use the same [Service Level Agreement](/handbook/engineering/infrastructure-platforms/service-level-agreement) as we
do on GitLab.com.

For Dedicated specifically, we base our measurements on nginx logs. Per minute we roll up the status codes for [covered experiences](/handbook/engineering/infrastructure-platforms/service-level-agreement#covered-experiences), and include wether or  not the service was undergoing scheduled maintenance at the time. No other details leave the tenant for analyzing SLA breaches.

## Disaster Recovery Plan

GitLab has developed a disaster recovery plan (the "Plan") to minimize the impact of a disaster or other emergency impacting a customer's access to and use of Dedicated

## DR Scope

The Plan is scoped to disasters or other emergency events impacting the following:

1. Partial region outage (e.g. AZ failure)
2. Complete outage to primary region

The recovery time objective ("Recovery Time Objective" or "RTO") for the Plan is based on how long it takes to re-provision the required infrastructure and restore data from the most recently available backup.

The recovery point objective ("Recovery Point Objective" or "RPO") for the Plan is based on the frequency of snapshots across the data sources.

In order to receive RPO and RTO targets, customers must specify a primary and secondary region upon onboarding and these regions must be supported by GitLab Dedicated. The list of regions that are supported by GitLab Dedicated [can be found here](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/#available-aws-regions).

If a customer uses the [Bring your own domain feature](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/#bring-your-own-domain), the customer must update its Domain Name System ("DNS") configuration to fully restore the Dedicated service ("DNS Update"). The time required to trigger and complete a DNS Update will not count towards the calculation of RTO under the Plan.

The RTO and RPO outlined in the Plan do not apply in the following circumstances:

1. If only a primary region was specified by a customer
2. If a secondary region is not supported by GitLab Dedicated
3. If the secondary region selected by a customer only provides for [limited support](https://docs.gitlab.com/subscriptions/gitlab_dedicated/data_residency_and_high_availability/#secondary-regions-with-limited-support)

In all three circumstances above, GitLab will still make a good faith effort to recover pursuant to the Plan, but the stated RTO and RPO objectives will not apply.

GitLab regularly tests the Plan and will take all commercially reasonable efforts to ensure its success within the below RTO/RPO goals.

## DR Exclusions

Events that have a more severe impact in a customer's access to and use of Dedicated, such as loss to both primary and secondary regions, global internet outages, or data corruption issues, are out of scope from the Plan. GitLab will still make a good faith effort to recover pursuant to the Plan, but the RTO and RPO goals of the Plan will not be considered.

## Current RTO Target

8 hours

## Current RPO Target

4 hours
