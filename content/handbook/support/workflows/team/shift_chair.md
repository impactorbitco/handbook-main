---
title: Shift Chair Role
category: Support Team
description: Information about the Shift Chair role responsibilities and goals
---

## Overview

The EMEA Support Shift Chair role is a three-phase plan to improve ticket distribution and coordination among Support Engineers during shift hours. This role addresses queue health issues, particularly FRT breaches during regional handovers and long-unassigned Rehomed tickets, while maintaining engineer autonomy and avoiding automatic ticket routing.

**Current Status: Phase 1 - Voluntary Participation**<br>
We are currently in Phase 1 of the implementation, which focuses on voluntary shift chair positions with engineer-driven ticket selection and coordination.

This initiative stems from [Issue#6928: [EMEA RFC] EMEA Queue Health](https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/6928) and implements the solution originally proposed in [Issue#6179: [EMEA] Define the Role and Responsibilities of Engineers in Ticket Routing, Ticket Management and First Response](https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/6179), with additions based on lessons learned and observations from the Shift system put into practice.

## Problem Statement

The Shift Chair role aims to address several key challenges:

- Lack of coordination and transparency on ticket workload distribution
- Complex tickets trickling down to later shifts and regions for multiple days
- Managers having to intervene to ensure proper ticket prioritization

## Role Purpose

The Shift Chair brings queue visibility to the collaboration level (Slack), enabling engineers to coordinate ticket selection while maintaining transparency about capacity and workload. Rather than replacing individual judgment, this role creates a transparent, coordinated approach to queue management that preserves engineer choice in ticket selection without compromising customer satisfaction.

## Core Responsibilities

### 1. Curate (Queue Management)

**At shift start**, run the Shift Chair script to identify, sort, and publish a prioritized ticket list using the following criteria:

**Priority 1**: NEW tickets, breached or breaching FRT SLA within **shift hours** +1h*<br>
**Priority 2**: OPEN EMEA tickets, BREACHED or breaching NRT SLO within **shift hours** +1h*<br>
**Priority 3**: All other NEW or OPEN EMEA tickets within **EMEA hours** +1h*

*The extra hour covers shift and region handovers

**Expected Outcome**: Each ticket under Priorities 1 and 2 should have an assignee by the end of the shift, as long as sufficient engineers are available and have capacity for it.

### 2. Coordinate (Team Facilitation)

**At shift start**, facilitate coordination for ticket assignment:

- Share the curated ticket list with all shift participants
- Allow engineers to volunteer for tickets based on interest and expertise
- Enable flexible coordination formats - feel free to experiment!
- **Active Outreach**: When tickets lack immediate volunteers or SLA/SLO is endangered, ping specific individuals based on a combination of:
  - [ZenDuo's Product Category Prompt](../product_category_field.md)
  - [Skills by Subject](https://gitlab-com.gitlab.io/support/team-pages/skills-by-subject.html) page recommendations

**Transparency Requirement**: Shift members should indicate which ticket(s) they are taking from the priority list. If team members cannot take tickets or would prefer to skip ticket prioritization for the day, this should be explicitly mentioned in the coordination thread.

## Goals and Success Metrics

### Primary Goals

- **95% FRT Compliance**: First responses sent before breaching FRT SLO
- **Complete Assignment Coverage**: All open EMEA tickets, breached or breaching within EMEA hours +1 should have an assignee, ideally before breaching NRT

### Key Success Metrics to be tracked

- Reduction in FRT breaches during regional handovers
- Decreased time for Rehomed tickets to receive new assignees
- Improved workload visibility and coordination
- Reduced management intervention in queue prioritization
- Overall improvement in NRT SLO

## Ticket Selection Guidelines

### During Shift Hours

- Each engineer SHOULD strive to assign at least 1 ticket from the EMEA priority list daily. When possible, take a second ticket to be Rehomed
- FRTs, breached and near breach Rehome tickets SHOULD take precedence over any other ticket
- **Transparency**: Communicate which tickets you're taking from the priority list. If you're unable to take tickets or prefer to skip prioritization, indicate this with a brief explanation or even just an emoji - whatever level of detail feels appropriate.

### Outside Shift Hours

- Ticket assignemnt SHOULD be avoided to safeguard capacity for shift hours
- If taking tickets outside shift hours, notify the relevant shift channel

## Daily Workflows

### Shift Start Routine (First 30-60 minutes)

1. **Generate Priority List**

   - Run ticket identification script (manual initially, full automation planned)
   - Review the results and confirm that they match the defined [priorities](#1-curate-queue-management)
   - Each day must have at least (available engineers minus 2) tickets, but no more tickets than engineers present on the shift.
     - The priority conditions can always be relaxed to include less urgent tickets, but we should also avoid overwhelming any given shift.

2. **Publish and Coordinate**

   - Share curated list in shift channel
   - Allow voluntary selection period (30-45 minutes)
   - Facilitate any discussions about ticket complexity or assignment

3. **Routing Suggestions**

   - If there are unclaimed high-priority tickets:
     - Run [ZenDuo's Product Category Prompt](../product_category_field.md) on the ticket
     - Try to match the relevant Product Categories to engineers using the [Skills by Subject](https://gitlab-com.gitlab.io/support/team-pages/skills-by-subject.html) page.
     - Tag engineers with the relevant expertise as routing suggestions for each remaining unassigned ticket

4. **Update**

    - As tickets are being assigned, update the list with the name of the engineer who's taken each ticket.
    - For unassigned tickets, add a tag with the handle of engineers who are a potential skillset match for the ticket's product area

## Practical Implementation Example

Here's a practical example of this system in practice:

![Shift Chair Trial](/images/support/workflows/team/shift_chair_trial.png)

## Tools and Resources

### Current Tools

- Semi Automated Ticket Prioritization Script
- [Skills by Subject](https://gitlab-com.gitlab.io/support/team-pages/skills-by-subject.html)
- [ZenDuo's Product Category Prompt](../product_category_field.md)

### Future Automation

The curation process (identifying and sorting priority tickets) is planned for automation to reduce manual effort while maintaining the coordination and handover aspects.

## Rotation and Participation

### Participation Model

Participation as Shift Chair is open to all team members. Chairs rotate among volunteers to share the load, and increase exposure to diversity of improvement ideas.

## Common Scenarios and Solutions

### Scenario: No Volunteers for a Priority Ticket

1. Run [ZenDuo's Product Category Prompt](../product_category_field.md) on the ticket
2. Try to match the relevant Product Categories to engineers using the [Skills by Subject](https://gitlab-com.gitlab.io/support/team-pages/skills-by-subject.html) page.
3. Tag engineers with the relevant expertise as routing suggestions for each remaining unassigned ticket
4. If there's no match, or matched engineers are unable to take the ticket, leave it for the next shift

## Continuous Improvement

### Feedback Collection

- Regular input from voluntary shift chairs and the wider team on process effectiveness
- Management review of SLA/SLO performance and capacity patterns
- Documentation of successful practices and challenges

### Process Evolution

This handbook represents the initial implementation. As the system matures:

- Automation will be added for ticket curation
- Coordination methods will be refined based on team feedback
- Success metrics will be adjusted based on performance data
- Integration with other queue management tools may be developed
