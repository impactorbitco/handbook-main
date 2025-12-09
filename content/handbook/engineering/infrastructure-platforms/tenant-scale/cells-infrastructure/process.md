---
title: "Team processes"
description: "Team Decision-Making & Transparency Guidelines"
---

## Decision Authority Framework

The decision authority framework exists to accelerate the decision making process while maintaining the minimum amount of noise and distraction for engineers. It also exists to empower the engineer to make [two-way-door decisions](/handbook/values/#make-two-way-door-decisions) early on and iterate on the solution.

The [DRI (Directly Responsible Individual)](/handbook/people-group/directly-responsible-individuals/) for an epic has primary decision-making authority within their scope. For more details on DRI responsibilities, see the [DRI & Supporting contributors section](_index.md#dri--supporting-contributors) in our team overview.

When making decisions, we may not always reach consensus. In such cases, it's important to follow the principle of [disagree and commit](/handbook/values/#disagree-and-commit). The DRI should make data-driven decisions based on available information and reasoning, rather than arbitrary choices. When multiple voices are involved, it's up to the DRI to use the authority level table below to escalate and commit to a particular decision.

Use this matrix to determine when to escalate:

| Authority Level | Who Decides | When to Use |
|----------------|-------------|-------------|
| **No Escalation, No FYI** | DRI or assigned engineer | Easily reversible decisions within epic scope |
| **FYI Only** | DRI (notify team after) | Easily reversible decisions with learning value for the team |
| **Team Escalation** | DRI after team discussion | Not easily reversible and/or impacts beyond the epic |
| **Management Escalation** | DRI with Engineering Manager support | Strategic impact or unresolvable conflicts that impact delivery |

## Decision Making Principles

### 1. Say Why, Not Just What

Document the reasoning behind every decision. Consider the following when writing a summary:

- What problem we're solving
- What alternatives we considered
- Why we chose this approach
- How it affects other teams
- How we'll measure success

- [Example issue](https://gitlab.com/gitlab-com/gl-infra/tenant-scale/cells-infrastructure/team/-/issues/519)
- [Example issue (Includes ADR)](https://gitlab.com/gitlab-com/gl-infra/tenant-scale/cells-infrastructure/team/-/issues/364)

**In practice**: Document decisions in GitLab issues with clear titles, proper labels, and links to related work. For detailed guidance on issue tracking and labeling requirements, see our [Issue Tracking section](_index.md#issue-tracking). When making a decision that will impact the project in general we make an [ADR](/handbook/engineering/architecture/design-documents/cells/#decision-log)

### 2. Document Synchronous Decisions

Discussions happen in meetings, but decisions must be written down:

- Meeting summary and optionally a recording link
- Action items with owners
- The rationale (why we decided)

**In practice**: Create or update a GitLab issue after any meeting where decisions are made.

### 3. Keep Information Accessible

All decisions are searchable in GitLab. No barriers, no gatekeeping.

**In practice**:

- Use consistent labels and clear titles
- Link related issues and dependencies
- Update the [handbook](https://handbook.gitlab.com) when decisions establish new practices or architectural decisions

## Staying Informed (Pull Model)

You're empowered to seek out information rather than waiting to be told everything.

**How to stay informed**:

- Subscribe to labels for epics relevant to your work
- Search GitLab issues to find decisions and context
- Engage proactively when you have expertise or concerns

**When to engage across epics**:

- You have expertise that could help avoid problems
- You see potential integration issues
- A decision might impact your work
- You have questions about timeline or rationale

**How to engage**:

1. Comment on issues or contact the epic DRI
2. Raise concerns in team syncs if they affect timelines
3. Escalate to Management or Senior Tenant Scale staff for strategic issues
