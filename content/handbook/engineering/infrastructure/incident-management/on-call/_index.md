---
title: On-Call Processes and Policies
---

{{% alert color="warning" %}}
If you're a GitLab team member working on an incident, please view the [Incident Management Handbook Pages](../_index.md)
{{% /alert %}}

## On-Call at GitLab

When production incidents occur, we must resolve them quickly and safely. To ensure that there are team-members available to respond to incidents, we maintain a set of on-call rotations.

This section of the handbook looks at how we do this and what the responsibilities are for team members involved.

The specifics of how incidents are managed are kept in the [Incident Management Handbook Pages](../_index.md).

## What is a rotation?

A rotation is a set of team members with specific knowledge and skills who are contactable to help resolve incidents.

A rotation has a leader who coordinates the rotation. They ensure that they have enough team members to provide the right level of coverage, they ensure that team members understand the requirements of the rotation, and they perform regular reviews of the rotation.

A rotation also has team members who respond to requests for help through a paging system.

A rotation has a tier and a coverage target.

## Tier and Coverage System

### Tiers

There are three tiers of rotations:

1. [Tier 1](./tier-1.md) - where a team member is paged by a system (through automated alerting)
2. [Tier 2](./tier-2.md) - where a team member is paged by a human (a human involved in an incident makes a specific decision to request more help)
3. Escalations - where leadership intervention is required or when a page is missed

### Coverage

There are several different levels of cover:

1. 24x7 - At any time there is always a named team member available to respond to a page. Tier 1 rotations are always 24x7. Tier 2 rotations can be 24x7.
2. 24x5 (full coverage) - At any time during the working week (M/T/W/T/F) there is always a named team member available to respond to a page.
3. 24x5 (partial coverage) - At most times during the working week (M/T/W/T/F) there is a named team member available to respond to a page. There are documented gaps in coverage.
4. [Best Effort Rotation](./best-effort-rotations.md) - Pages are sent to a group of team members instead of a named team member. There is no single team member with the responsibility of responding to the page at any given time.

It is important to note that team members participating in best effort rotations are not considered to be "on-call".

When someone is on-call, we are giving them a specific duty to perform. They will hold the pager and they are expected to respond in a timely fashion when it pages them. You are expected to set aside your current item and respond to the pager.

When on a best-effort rotation, there is no single team member with role responsibility for responding at any given time. If you are working you should respond to a page and this page should take priority over other work items.

The distinction is important because there are legal and HR implications for on-call cover (which differs by level) but there are no legal or HR implications for best effort rotations.

#### Coverage Periods

The 24 hour period of one day is broken up into three periods of 8 hours each. We are standardizing on 8 hour coverage periods that happen 3 times per day for rotations that are not escalation rotations.

Team members are able to choose which of the three slots best matches their ordinary working hours and they are able to move between slots with three months notice.

The recommendation is (UTC):

1. APAC 23:00 - 07:00
2. EMEA 07:00 - 15:00
3. AMER 15:00 - 23:00

Rotation leaders may choose different 8-hour periods to suit their needs.

#### Coverage on weekends and public holidays

If a rotation is 24x7, then coverage on weekends and public holidays is required. Please see the tier pages for more specific information.

##### Country specific requirements

1. New Zealand - Public holiday shifts are voluntary, if a team member chooses to work a shift on a public holiday, this requires manager approval because responding to pages on a public holiday requires compensation. It is the team member's responsibility to arrange cover or approval for public holidays. [Please see the New Zealand guide for full details](/handbook/total-rewards/benefits/general-and-entity-benefits/pty-benefits-australia/#on-call-support-engineering-only).

## Responsibilities for Rotation Leaders

Slack Channel for Rotation Leaders: [#oncall-rotation-leaders](https://gitlab.enterprise.slack.com/archives/C09M62ECHHS)

1. Define and maintain:
   1. Escalation rules
   1. Onboarding materials to help team members join the rotation
   1. Documentation and runbooks.
1. Maintain your rotation at the agreed level of coverage paying careful consideration to timezones.
1. When new team members join or existing team members depart, be sure to update the schedules accordingly. We recommend making schedule changes 60-days out so that rotations in the short term are not disrupted. Changes required inside of the 60-day periods can be done with overrides.
1. Prepare and publish a [holiday coverage plan](./holiday-coverage-planning.md) before the 4th Thursday in November each year.
   1. There are higher levels of PTO between American Thanksgiving and the end of the year than any other time of year, so we request special coverage plans.
1. Maintain an escalation path to handle unacknowledged pages.

## On-Call Responsibilities and Expectations for both Tier 1 and Tier 2

If you are on-call, you are expected to:

1. Regularly check your on-call schedule and know when you are on-call. You can use our incident management system to alert you before your on-call shifts start.
1. Check that your [notification preferences are set](https://app.incident.io/gitlab/user-preferences/on-call-notifications) and that you know how to acknowledge a page with these settings.
1. If you are assigned a shift that you cannot take due to external commitments, it is your responsibility to find cover. Use your team’s slack channel and notify your rotation leader that you are looking for cover. You can look for partial cover (a few hours), day cover, or full cover.
1. If you are sick and will not be able to work, you should not be on-call. When you inform your manager of your sick day, let them know that you are on-call and they will arrange cover.
1. If a personal emergency happens during your shift, in your message to your manager that you will be away you should let them know that you are on-call for this rotation. The manager will take responsibility for finding you cover.
1. Acknowledge a page within 15 minutes and be at your place of work shortly thereafter to assist with incident resolution.
1. If you are interviewing or part of an active interviewer pool, keeping your ModernLoop preferences up to date so you are not scheduled an interview while you are on call. If you happen to have an interview scheduled over your on-call period you should look for partial cover for that time.
1. If you will be on extended leave, (for example, parental leave), you need to contact your rotation leader to adjust the on-call schedule.

**Exceptions to the above**

1. For team members in The Netherlands, if they cannot take an assigned shift, they must notify their rotation leader with at least 2 working days notice and the rotation leader (not the team member) is responsible for finding cover. (As agreed with the Works Council).

## Practical aspects of being on-call

1. You don’t need to install anything specific on your phone. The paging system can be set to notify you by email, phonecall, sms or (if you choose to install the app) in-app notification.
1. You can take breaks during your shift. You need to ensure that you are able to acknowledge a page within 15 minutes and be back at your desk shortly thereafter.

## How to set up an on-call rotation

### Identifying participants

Identify which team members will participate in the new rotation.

### Create training and onboarding

Use LevelUp to construct and issue training for team members joining this rotation.

### How many people are needed to set up a rotation?

To provide coverage across all timezones, you should aim for a minimum of 4 people per region. This will enable a 1-in-4 week rotation pattern (where a person is on-call 1 week every 4 weeks).

If you have more than 12 team members per region, you risk having team members forgetting that they are on-call or not knowing what to do when paged. It is encouraged to have a rotation of fewer than 12 team members per region.

If you have fewer team members than this in some timezones, you can use a 24x5 and declare where you have gaps in coverage. If you have a very small team, you can look at a [Best Effort rotation](./best-effort-rotations.md).

### Defining a rotation pattern

The recommendation is to create three groups of team members: AMER, EMEA and APAC. See [coverage periods](#coverage-periods) above.

3 shifts of equal length are recommended to make it easier to manage, but the rotation leader should consider the ordinary working hours of team members and incorporate this as far as possible.

### Defining escalation paths

Define the escalation procedures for when an on-call team member doesn't respond to a page. These escalation paths will be encoded in Incident.io for each rotation. Some options are below:

Options include:

1. Setting the page to round-robin all team members after 15 minutes
2. Creating an escalation schedule of a smaller group
3. Creating a shared escalation schedule consisting of rotation leaders

Escalations are rare, but it's still important to have a plan to respond to requests for help.

### Slack Channels

Recognizing that some teams may already have effective communication channels, setting up Slack channels for each rotation is optional.  It is up to the discretion of the rotation owner whether to use an existing channel, or create one channel for the whole schedule, or create one channel per region.

The Slack channel that will be used should be added to the [Tier 2 handbook page](/handbook/engineering/infrastructure/incident-management/on-call/tier-2.md#active-tier-2-rotations).

However, if Slack channels are created, ensure that they follow this format:

- `tier-2-(team-name)-rotation-swaps`
- `tier-2-(team-name)-rotatoin-swaps-apac`
- `tier-2-(team-name)-rotatoin-swaps-emea`
- `tier-2-(team-name)-rotatoin-swaps-amer`
