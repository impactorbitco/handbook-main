---
title: On-Call Processes and Policies - Tier 2
---

Tier 2 Rotations refer to on-call rotations that respond to pages where a human makes a decision to page a team member for support.

## Subject Matter Experts On-Call (Tier 2 SME)

The Tier-2 SME On-Call program enhances incident response by establishing a second tier of specialized support. Subject Matter Experts (SMEs) provide domain-specific knowledge to help resolve complex incidents faster, improve MTTR (Mean Time To Recover), and increase ownership and accountability for service reliability.

This program was introduced at GitLab in 2025 with a target of providing 24x7 coverage for areas where specialised domain knowledge will improve incident response. In practise, many teams are not set up to provide this level of cover. As such, we began with a Pilot Program to understand these gaps and learn how to support these teams to achieve this level of cover.

## Active Tier 2 Rotations

A summary of currently active Tier 2 rotations is listed below.  For more detail on expertise and when to escalate to each team, see the [Tier 2 Escalations](/handbook/engineering/infrastructure/incident-management/tier2-escalations.md) page.

### Gitaly

- Rotation Leader: John Cai
- Coverage: 24x5 partial (2-hour gap)
- Schedule: [schedule](https://app.incident.io/gitlab/on-call/schedules/01JJWAE08T9WDE8T6D4VZPBNXE)
- Escalation History Link: [escalations](https://app.incident.io/gitlab/on-call/escalations?escalation_path%5Bone_of%5D=01JJWB07RXAG02RXYR4QR47J9E)
- [More Information](/handbook/engineering/infrastructure-platforms/tenant-scale/gitaly/#on-call-rotation)

### AI Powered

- Rotation Leader: Martin Wortschack
- Coverage: 24x5
- Schedule: [schedule](https://app.incident.io/gitlab/on-call/schedules/01K22BJ3V6C41NW8RJ881B08XZ)
- Escalation History Link: [escalation](https://app.incident.io/gitlab/on-call/escalations?escalation_path%5Bone_of%5D=01K22CAST6CK8Y4DVN7ET8YQZX)

### DevOps

- Rotation Leader: [see who is on call](https://app.incident.io/gitlab/on-call/schedules/01K611ZT9YX2PSA8WAMEP6A66G) (falls back to Michelle Gill)
- Coverage: 24x5
- Schedule: [schedule](https://app.incident.io/gitlab/on-call/schedules/01K611MG8T5CW874Q5JZER3H0Z)
- Escalation History Link: [escalation](https://app.incident.io/gitlab/on-call/escalations?escalation_path%5Bone_of%5D=01K6P0Q3D6B7AYV0JT41DP0VME)
- Slack Channel for Rotation Swaps: `#tier-2-devops-rotation-swaps`

### Runners Platform

- Rotation Leader: Kam Kyrala
- Coverage: Best Effort - 24x5 (Monday-Friday)
- Schedule: [schedule](https://app.incident.io/gitlab/on-call/schedules/01K7HNBCW9EN2MMS4SHAJ5B2WF)
- Escalation History Link: [escalations](https://app.incident.io/gitlab/on-call/escalations?escalation_path%5Bone_of%5D=01K7HSQ433CMD61V4RNS70BJ47)
- Primary Slack Channel: #g_runners_platform

### Fulfillment

- Rotation Leader: James Lopez
- Coverage: 24x5 (Monday-Friday, business hours)
- Schedule: [schedule](https://app.incident.io/gitlab/on-call/schedules/01K99JAT82M1D5HB1MVXX79WHR)
- Escalation History Link: [escalations](https://app.incident.io/gitlab/on-call/escalations?escalation_path%5Bone_of%5D=01K99K4HEXYB7Z7P21BTCY44BF)
- Primary Slack Channel: #s_fulfillment_engineering
- [More Information](/handbook/engineering/development/fulfillment/#escalation-process-for-incidents-or-outages)

### Dev Escalation

- This on-call process is designed for GitLab.com operational issues that are escalated by the Infrastructure team.
- Development team currently does NOT use PagerDuty or incident.io for scheduling and paging.
- No weekday schedule is maintained, the **pagerslack** app will ping available engineers for help.
- A weekend on-call schedule is maintained in this [schedule sheet](https://docs.google.com/spreadsheets/d/10uI2GzqSvITdxC5djBo3RN34p8zFfxNASVnFlSh8faU/edit#gid=0).
- Issues are escalated in the Slack channel [#dev-escalation](https://gitlab.slack.com/messages/CLKLMSUR4) by the Infrastructure team.
- On weekdays, the pagerslack app pings a new engineer every 2 minutes, and if none respond after 6 attempts, it pings all engineering managers with backend engineers to find someone.
- On weekends, first response SLO is 15 minutes. If no response within the first 5 minutes, the requesting team will call the engineer's phone number on the schedule sheet.
- Development engineers do 4-hour shifts.
- Engineering managers do monthly shifts as scheduling coordinators.
- Check out [process description and on-call workflow](/handbook/engineering/development/processes/infra-dev-escalation/process/) when escalating GitLab.com operational issue(s).
- Check out more detail for [general information](/handbook/engineering/development/processes/infra-dev-escalation/) of the escalation process.

### Pilot Program

The Pilot Program aims to cover ordinary working hours with 24x5 coverage. The Pilot was viewed as an acceptable first iteration towards full coverage because 90% of S1 and S2 incidents take place during ordinary working hours.

For the purpose of this program, ordinary working hours means:

1. _As close as possible to the 8 hours that you would ordinarily work_
2. _Not public holidays or weekends_

As described on the main on-call page, rotation leaders can choose an 8-hour cycle that meets their needs. The recommendation is (UTC):

1. APAC 23:00 - 07:00
2. EMEA 07:00 - 15:00
3. AMER 15:00 - 23:00

If you have team members that don't naturally align to these times, it is at the rotations leader's discretion for how to manage this situation. It is important to provide coverage, and to enable team members to contribute to on-call in a meaningful way. There will always be circumstances where we need to be flexible - and this flexibility goes both ways.

#### Public Holidays

It is very difficult for the rotation leader to know the public holidays for every team member in their rotation. It is the team member's responsibility to find coverage if they are scheduled for on-call on a public holiday.

If a team members would like to work on a public holiday, they may switch their public holiday to a different day in accordance with our [Public Holiday Policy](/handbook/people-group/time-off-and-absence/time-off-types/#overview-1). This is a voluntary action.

Exceptions:

1. The Netherlands - If a team member cannot take an assigned shift, they must notify their rotation leader with at least 2 working days and the rotation leader (not the team member) is reponsible for finding cover. (As agreed with the Works Council).

## How to determine if we need a specific set of Subject Matter Experts to form a Tier 2 rotation

1. Any new feature or service arriving through the Component Owner Model should have a 24x5 Tier 2 SME for at least the first six months.
2. Any feature or service that generates many incidents regardless of severity.
3. Any feature or service where frequent incidents would cause reputational damage.
4. Any feature or service where the mean time to recover from incidents is consistently high.

### Metrics that can be reviewed to assist in this decision

1. Trend analysis of incidents. This can be done by searching the [Production Incident tracker](https://gitlab.com/gitlab-com/gl-infra/production-engineering/-/issues?sort=created_date&state=opened&first_page_size=100) for the `~incident` label and narrowing your search by group.
   1. Look at how often incidents occur and see if there are any patterns.
   2. Consider incident severity.
2. Incident resolution time.

## How to create a Tier 2 rotation

Tier 2 rotations are for subject matter experts. On average, they should know more about their subject matter than engineers outside of the group. Consider providing training material to confirm that participants are subject matter experts.

See the [general information about how to set up an on-call rotation](_index.md#how-to-set-up-an-on-call-rotation).

Use the [team onboarding template](https://gitlab.com/gitlab-com/gl-infra/production-engineering/-/issues/new?description_template=onboarding-tier2-oncall) to set up a new Tier 2 rotation.

## When does Tier 2 get paged?

### Tier 1 EOC or IM requests

#### Escalation Criteria

The Tier-1 Engineer On-Call (EOC) will perform initial triage and use available documentation before escalating to Tier-2 SMEs. Pages may also be initiated by the Incident Manager (IM) supporting the incident.

##### Before Escalating to Tier-2

Tier-1 must:

1. Follow all recommendations in runbooks and playbooks for the affected area
2. Document attempted solutions and outcomes in the incident issue

###### Resource Locations

- [Runbooks](https://gitlab.com/gitlab-com/runbooks/-/tree/master/docs)
- [Playbooks](https://internal.gitlab.com/handbook/engineering/tier2-oncall/playbooks/)

#### By Severity Level

- **S1/S2 Incidents**: When the Tier-1 team cannot resolve them independently using runbooks, documentation or other sources. Due to their critical nature, Tier-2 SMEs should expect to be paged for these incidents when domain-specific expertise is needed.

- **S3/S4 Incidents**: These typically do not require escalation to Tier-2 SMEs during weekends. However, Tier-1 may escalate S3/S4 incidents in specific circumstances:
  - When the customer impact is unclear and requires domain expertise to assess
  - When there's uncertainty about whether the issue might develop into a higher severity incident
  - When multiple lower-severity incidents combined create a potentially broader impact

- If Tier-1 needs help determining whether errors or unusual behavior in a service will affect customers, they may consult with Tier-2 SMEs
