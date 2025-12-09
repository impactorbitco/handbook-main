---
title: Workflow Catalog Group
description: "The Workflow Catalog Group is focused on developing Workflow Catalog, a catalog of Agents, tools, and flows that can be created, curated, and shared across organizations, groups, and projects."
---

## Vision

The Workflow Catalog Group is focused on developing Workflow Catalog, a catalog of Agents, tools, and flows that can be created, curated, and shared across organizations, groups, and projects.

## Team members

**Engineering Manager & Engineers**

{{< team-by-manager-slug "sam-beckham" >}}

## How to reach us

Depending on the context here are the most appropriate ways to reach out to the Workflow Catalog group:

* Slack Channel: `#g_workflow_catalog`
* GitLab group `@gitlab-org/ai-powered/workflow-catalog/engineering` (just engineers)

## What we're working on

Right now, we're working on the first iteration of the Workflow Catalog (the MVP).
You can track this work in the [MVP epic](https://gitlab.com/groups/gitlab-org/-/epics/17989).

## How we work

We're just getting started and will be defining how we work as we settle in to the new team.
Here are some links to get us started:

* [Root Epic](https://gitlab.com/groups/gitlab-org/-/epics/11111): For grouping all the work and setting out a roadmap
* [Issue board](https://gitlab.com/groups/gitlab-org/-/boards/3871464): For all in-flight issues
* [Team tasks](https://gitlab.com/gitlab-org/ai-powered/workflow-catalog/team-tasks/-/issues): For all non-product related team issues
* [Async updates](https://gitlab.com/gitlab-org/ai-powered/workflow-catalog/team-tasks/-/issues/?label_name%5B%5D=async%20update)
* [Team Wiki](https://gitlab.com/gitlab-org/ai-powered/workflow-catalog/team-tasks/-/wikis/home): For product decisions and useful information

### DRIs

When working on a large project, we'll split it into epics and issues.
The Directly Responsible Individual (DRI) for each epic serves as the single point of accountability for that domain.
The DRI doesn't necessarily do all the work, but owns the success of their epic.

DRI responsibilities:

1. Answer questions about epic status, scope, and technical decisions
2. Maintain accurate epic and issue descriptions
3. Monitor and communicate delivery health status
4. Curate the issue list. Include what's needed and remove what isn't
5. Keep delivery dates and issue statuses current
6. Coordinate with other DRIs when work spans multiple epics

### MoSCoW Prioritization

To effectively prioritize work within our epics, we use the [MoSCoW method](https://en.wikipedia.org/wiki/MoSCoW_method).
Each issue is assigned one of three labels: [`~MoSCoW::MustHave`](https://gitlab.com/groups/gitlab-org/-/issues/?state=opened&label_name%5B%5D=MoSCoW%3A%3AMustHave&label_name%5B%5D=group%3A%3Aworkflow%20catalog), [`~MoSCoW::ShouldHave`](https://gitlab.com/groups/gitlab-org/-/issues/?state=opened&label_name%5B%5D=MoSCoW%3A%3AShouldHave&label_name%5B%5D=group%3A%3Aworkflow%20catalog), or [`~MoSCoW::CouldHave`](https://gitlab.com/groups/gitlab-org/-/issues/?state=opened&label_name%5B%5D=MoSCoW%3A%3ACouldHave&label_name%5B%5D=group%3A%3Aworkflow%20catalog).
This framework helps us distinguish between work that must ship versus features that may be deferred, and provides clear guidance on what to work on next.
You can see this prioritization on our [MoSCoW board](https://gitlab.com/groups/gitlab-org/-/boards/9470048?label_name[]=group%3A%3Aworkflow%20catalog)

#### Must Have

Issues labeled **Must Have** are critical requirements that must be completed before we can consider the feature complete.
These represent the minimum viable functionality and should always be the highest priority.

**When to pick up:** These issues should be tackled first and are never optional.

#### Should Have

Issues labeled **Should Have** are important features that we aim to ship with the main feature.
However, they can be cut if we need to reduce scope to meet deadlines.
These represent valuable functionality that significantly improves the user experience.

**When to pick up:** After Must Have issues, unless it would simplify/unblock Must Have work.

#### Could Have

Issues labeled **Could Have** are nice-to-have features that would enhance the product but aren't essential for the current release.
These are typically features where we're unsure how much work they'll require or how much value they'll provide.
They're more likely to be included in future iterations, used as onboarding tasks for new team members, or handled by community contributions.

**When to pick up:** When you need something small to fill a gap and can see a quick path to completion.

### Communication

The Workflow Catalog Team communicates based on the following guidelines:

* Always prefer async communication over sync meetings.
* Don't shy away from arranging a [sync call](/handbook/communication/#video-calls) when async is proving inefficient, however always record it to share with team members.
* By default communicate in the open.
* Prefer public channels (`#g_workflow_catalog`) over private message for work-related Slack messaging.

### Frontend-Backend collaboration

We aim to foster high levels of collaboration between frontend and backend engineers to ensure
development velocity and code quality.

* **Schema-first development**: Before implementation begins, frontend and backend engineers collaborate
  to design a GraphQL API schema based on UI requirements, user experience needs, and performance considerations.
* **Parallel development processes**: Once the schema is agreed upon, the frontend can proceed
  using mock data, mock endpoints, or API stubs that match the agreed schema. The backend can
  focus on implementing the data model, business logic, and actual API schema.
* **Maintaining alignment**: We value great communication. When requirements or schema need to change, we communicate
  early through the relevant GitLab issue or in [`#g_workflow_catalog`](https://gitlab.enterprise.slack.com/archives/C08T5J1KXKQ)
  so our frontend or backend counterparts stay informed of all changes and can provide feedback early to avoid late-stage blockers.

### AI stage collaboration

The Workflow Catalog relies on the
[Workflow Service](https://gitlab.com/gitlab-org/modelops/applied-ml/code-suggestions/ai-assist/-/tree/main/duo_workflow_service?ref_type=heads)
as a foundational backend service.
Most Workflow Catalog features require new capabilities to be developed within Workflow Service,
which means our engineers will need to contribute directly to that codebase in partnership with the
[Agent Foundations team](../agent-foundations/_index.md).

**Collaboration Requirements:**

* All Workflow Service contributions must be developed in close partnership with the Agent Foundations team
* Our implementations must align with their service architecture and vision
* We commit to supporting Workflow Service's broader goals and adhering to their technical standards

**Collaboration Process:**

* Reach out to relevant Agent Foundations contacts (listed below) during the planning phase
* Join their [`#g_duo-agent-platform`](https://gitlab.enterprise.slack.com/archives/C07035GQ0TB) channel
* Follow our [async communication preferences](#communication) by default, but schedule sync meetings
  when needed and ensure key outcomes are documented in GitLab issues

#### Primary Agent Foundations contacts

| Team Member | Expertise Area |
| ---      | ---     |
| [Mikołaj Wawrzyniak](https://gitlab.com/mikolaj_wawrzyniak) | Workflow Service architecture |
| [Frédéric Caplette](https://gitlab.com/f_caplette) | Client-side implementation |
| [Dylan Griffith](https://gitlab.com/DylanGriffith) | Workflow Executor architecture: remote execution environment and runner implementation |
| [Jessie Young](https://gitlab.com/jessieay) | Authorization and authentication |
| [Shekhar Patnaik](https://gitlab.com/shekharpatnaik)  / [Igor Drozdov](https://gitlab.com/igor.drozdov) | Duo Chat agent integration |
| [Sebastian Rehm](https://gitlab.com/bastirehm) | Engineering Manager, backup contact for any of the above |

### Our tech stack

* GraphQL [backend](https://docs.gitlab.com/development/api_graphql_styleguide/) and
  [frontend](https://docs.gitlab.com/development/fe_guide/graphql/). All new schema items must be
  [marked experimental](https://docs.gitlab.com/development/api_graphql_styleguide/#mark-schema-items-as-experiments)
  to let us making breaking changes when we need.
* GraphQL [subscriptions](https://docs.gitlab.com/development/fe_guide/graphql/#subscriptions) rather than polling.

## Team meetings

### Workflow Catalog: Group meeting

* **Time**: Every Tuesday at 05:30 UTC and 15:00 UTC. It's held twice in one day to allow APAC, EMEA, and AMER timezones to attend.
* **Purpose**: This meeting serves as a general sync meeting to bring up any current issues and blockers.
* **Agenda**: [Google Doc (internal only)](https://docs.google.com/document/d/19zrzqN37ZVwwEJ9iYhy4QBsUzVN0Hd1j1yn8J0v4dqE)
* **Recordings**: [Google Drive (internal only)](https://drive.google.com/drive/folders/1I9s96jg9knqOwDLabhn9100H-MsvG2ne)
