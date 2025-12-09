---
title: Issue Refinement and Estimation
description: "Continuous refinement process and estimation guidelines for Growth teams"
---

## Workflow And Estimation

Growth follows the GitLab [Product Development Flow](/handbook/product-development/how-we-work/_index.md), supported by a series of automations that we’ve fine-tuned to improve clarity during refinement, streamline prioritization, and speed up experiment delivery.

The refinement process reduces chaos by creating natural quality gates. Epics must be refined and broken down before issues enter the pipeline. Issues must be estimated and clarified before they're ready for development. This structured flow prevents half-baked ideas from consuming engineering time and ensures that when someone picks up work, they have everything needed to succeed. For a team running experiments with uncertain outcomes, this upfront investment in clarity pays dividends by allowing engineers to move fast on execution rather than spending cycles figuring out what to build.

The refinement process is driven by [triage bot automations and policies](https://gitlab.com/gitlab-org/quality/triage-ops/-/blob/master/policies/groups/gitlab-org/growth/refine-automations.yml) to ensure that it's smooth and consistent.

Note: The Growth team currently operates as a single, unified team following a kanban-style workflow. As a result, any process / automated workflows or nudges are designed to target the broader Growth Engineering stage rather than individual groups.

## Refinement Steps

### Epic-Level Workflow and Refinement

1. Epic is created and moved to `~"workflow::problem validation"` where we validate the problem is clear, worth solving, and has no blockers. Product Manager owns the Epic during this phase.
2. If the Epic needs UX/UI changes, it's labeled `~"workflow::ready for design"` for design work (non UX/UI focused Epics skip this step). Product designers create a UX issue under the epic to refine the designs and solicit early, informal feedback. When the designs are near-final, they are documented in the parent epic.
3. Epic moves to `~"workflow::refinement"` and triage-bot creates a refinement thread where the team discusses technical approach, risks, and dependencies. If refinement reveals significant complexity, technical constraints, or timeline concerns that conflict with other committed work, engineers should flag these immediately and negotiate scope adjustments, implementation approach, or timeline expectations with PM/Design before proceeding to breakdown. The Engineering and Product Management must acknowledge and address these concerns before the epic can move forward. When all discussions are resolved, the product designer closes the UX issue and documents the final designs in the epic.
4. Once the scope is clear, Engineers volunteer and self-assign the Epic to further breakdown the Epics into issues. If no volunteers after 3 business days from the time `~"workflow::refinement"` state, triage-bot tags EM to assign someone. Epic ownership transfers from PM to the volunteering Engineer, who becomes the [Engineering DRI](/handbook/engineering/development/growth/engineering_dri/) for the Epic.
5. The assigned engineer (now Engineering DRI) breaks the Epic into issues using [Experiment Implementation](https://gitlab.com/gitlab-org/gitlab/-/issues/new?description_template=Experiment%20Implementation) or [Implementation](https://gitlab.com/gitlab-org/gitlab/-/issues/new?description_template=Implementation) templates. Issues are labelled with `~"workflow::blocked"` with "blocking/blocked by" relationships to signal sequential execution.
6. Issues with clear scope get labeled `~"workflow::ready for development"` with weight estimates (skips issue refinement), while unclear issues get labeled `~"workflow::refinement"` to go through [issue refinement process](#issue-level-refinement).
7. Once all issues are created, labeled and refined, the Engineering DRI moves Epic to `~"workflow::ready for development"` to indicate breakdown is complete.
8. Once the issues inside the Epic are being worked on, the Engineering DRI moves the Epic to `~"workflow::in dev"`. A due date should be attached to estimate the delivery timeframe.
9. The Engineering DRI continues to own the Epic throughout the implementation phase, coordinating work across issues, managing dependencies, providing weekly status updates, and ensuring steady progress until all issues are completed.
10. When implementation is completed, Epic is moved to `~"workflow::verification"` and the Engineering DRI determines the appropriate verification level-either mentioning the PM and closing for straightforward completions, or requesting formal PM verification for complex changes.

{{% alert title="⚠️ Note" color="warning" %}}
Being the engineering DRI for an epic doesn't mean you have to implement every issue in it. The DRI is a coordinator, not a sole implementer. Other engineers pick up issues from the kanban board and contribute to the epic - the DRI ensures the work fits together and the epic reaches completion.
{{% /alert %}}

### Issue-Level Refinement

1. Issues are moved from `~"workflow::planning breakdown"` to `~"workflow::refinement"` automatically by the triage bot in order of priority (from top to bottom). The bot will only move issues to refinement if there is room in refinement column, meaning there is less issues than maximum limit for this column. This is first chance for PMs to prioritize issues by moving them higher in the `planning breakdown` column. After the issue is moved to refinement, a dedicated `refinement thread` is created, which acts as a place for discussion and weight estimation.
    - 💡 Hint: In rare case when an issue has to be expedited, it's possible to move it to refinement manually by adding the `~"workflow::refinement"` label. This will invoke a reaction from triage bot, which will add `refinement thread` for such issue instantly so the refinement can proceed the same way as with automated path.
2. During refinement the team ensures that the issue is well described and requirements are clear. They can use the `refinement thread` to discuss but they should make sure that any changes and decisions made there are also reflected in issue's description. Once each engineer is comfortable with the way the issue is described, they can vote their estimation of weight based on our [guidelines](#estimation-guidelines). The voting happens by reacting to the thread with one of few possible weight estimates: 1️⃣ 2️⃣ 3️⃣ 5️⃣ or 🚀 (indicates 5+).
3. Each day the triage bot checks all issues in `~"workflow::refinement"` column and if an issue has required minimum number of estimation votes (see `MIN_REACTIONS` constant [here](https://gitlab.com/gitlab-org/quality/triage-ops/-/blob/master/lib/growth_refine_automation_helper.rb?ref_type=heads#L16) for the current setting) it will be moved to `~"workflow::scheduling"`.
    - 💡 Hint: If there is some problem with the issue and it shouldn't be moved forward even if enough engineers estimate it, ❌ reaction can be added to the thread which will stop the bot from transitioning the issue to `~"workflow::scheduling"` as long as this reaction sticks to the thread. This means that whoever put it is also responsible for removing it once the problem is gone.
4. Once the issue is in `~"workflow::scheduling"`, it is awaiting final prioritization by PMs - it has to be manually moved to `~"workflow::ready for development"` depending on the current priorities. This part of the process is PMs responsibility. This allows for additional fine-tuning of priorities and acts as a buffer for our ready for development column.

## Estimation Guidelines

[The development estimation is the time during `~"workflow::in dev"` until moved to `~"workflow::in review"`]

| Weight | LoE (Business Days) | Description |
| ------ | ------ | ------ |
| 1 | 1-3 days | The simplest possible change. We are confident there will be no side effects. |
| 2 | 4-6 days | A simple change (minimal code changes), where we understand all of the requirements. |
| 3 | 7-9 days | A simple change, but the code footprint is bigger (e.g. lots of different files, or tests affected). The requirements are clear. |
| 5 | 10-12 days | A more complex change that will impact multiple areas of the codebase, there may also be some refactoring involved. Requirements are understood but you feel there are likely to be some gaps along the way. |
| 5+ | 2 weeks+ | A significant change that may have dependencies (other teams or third-parties) and we likely still don't understand all of the requirements. It's unlikely we would commit to this in a milestone, and the preference would be to further clarify requirements and/or break into smaller issues. |

- LoE => Level of Effort represents the total number of business days spent across both `workflow::in dev` and `workflow::review` phases.

In planning and estimation, we value [velocity over predictability](/handbook/engineering/development/principles/#velocity). The main goal of our planning and estimation is to focus on the [MVC](/handbook/values/#minimal-valuable-change-mvc), uncover blind spots, and help us achieve a baseline level of predictability without over optimizing. We aim for 70% predictability instead of 90%. We believe that optimizing for velocity (merge request rate) enables our Growth teams to achieve a [weekly experimentation cadence](/handbook/product/groups/growth/#weekly-growth-meeting).

- If an issue has many unknowns where it's unclear if it's a 1 or a 5, we will be cautious and estimate high (5).
- If an issue has many unknowns, we can break it into two issues. The first issue is for research, also referred to as a [Spike](https://en.wikipedia.org/wiki/Spike_(software_development)), where we de-risk the unknowns and explore potential solutions. The second issue is for the implementation.
- If an initial estimate is incorrect and needs to be adjusted, we revise the estimate immediately and inform the Product Manager. The Product Manager and team will decide if a milestone commitment needs to be adjusted.

## Team Participation in Refinement

Operating asynchronously means refinement can't rely on scheduled meetings where everyone shows up at the same time. Instead, the team should adopt a continuous refinement mindset where engineers regularly check the [growth Epic board](https://gitlab.com/groups/gitlab-org/-/epic_boards/2079888) and issue kanban board for items in refinement status. When an Epic appears in ~"workflow::planning breakdown", engineers should review the refinement thread, ask clarifying questions, evaluate technical feasibility, and provide feedback on the proposed direction. This isn't a passive activity - the goal is to surface concerns, suggest alternatives, and ensure the Epic is well-understood before someone volunteers to break it down.

Similarly, the issue kanban board should be monitored for issues in ~"workflow::refinement", ~"workflow::scheduling", and ~"workflow::ready for development". Issues in refinement need estimation votes and technical feedback. Issues in scheduling are waiting for final prioritization but are already well-defined and could be moved to ready for development if priorities shift. Issues in ready for development are immediately available for pickup. By regularly scanning these columns, engineers maintain awareness of upcoming work, can identify issues that align with their expertise or interests, and keep the pipeline moving.

Currently, the team should prioritize any work labeled with ~"Growth::Driving First Orders". These represent high-priority items that need immediate attention.

## Issue sequencing

In order to convey Issue implementation order and blocking concepts, we leverage the [blocking issue linking feature](https://docs.gitlab.com/ee/user/project/issues/related_issues.html#blocking-issues).

More on the discussion can be seen in https://gitlab.com/gitlab-org/growth/team-tasks/-/issues/752.

## Labelling Issues & Epics

We use workflow boards to track issue progress throughout a milestone. Workflow boards should be viewed at the highest group level for visibility into all nested projects in a group.

The Growth stage uses the `~"devops::growth"` label and the following groups for tracking merge request rate and ownership of issues and merge requests.

| Name          | Label                   | gitlab-org | All Groups |
| ----------    | -----------             | ------     | ------     |
| Growth        | `~"devops::growth"`     | [Growth Workflow](https://gitlab.com/groups/gitlab-org/-/boards/4152639) | [-](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=devops%3A%3Agrowth) |
| Acquisition   | `~"group::acquisition"` | [Acquisition Workflow](https://gitlab.com/groups/gitlab-org/-/boards/4152639) | [-](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=devops%3A%3Agrowth&label_name[]=group%3A%3Aacquisition) |
| Activation    | `~"group::activation"`  | [Activation Workflow](https://gitlab.com/groups/gitlab-org/-/boards/4152639) | [-](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=devops%3A%3Agrowth&label_name[]=group%3A%3Aactivation) |
| Engagement    | `~"group::engagement"`  | [Engagement Workflow](https://gitlab.com/groups/gitlab-org/-/boards/4152639) | [-](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=devops%3A%3Agrowth&label_name[]=group%3A%3Aengagement) |
| Experiments   | `~"experiment-rollout"` | [Experiment tracking](https://gitlab.com/groups/gitlab-org/-/boards/1352542) | [-](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=experiment-rollout) |
| Feature Flags | `~"feature flag"`       | [Feature flags](https://gitlab.com/groups/gitlab-org/-/boards/1725470?&label_name[]=devops%3A%3Agrowth&label_name[]=feature%20flag) |  |

Growth teams work across the GitLab codebase on multiple groups and projects including:

- The [gitlab.com/gitlab-org](https://gitlab.com/gitlab-org/) group
- [gitlab](https://gitlab.com/gitlab-org/gitlab)
- [GLEX](https://gitlab.com/gitlab-org/ruby/gems/gitlab-experiment)
- [customers-gitlab-com](https://gitlab.com/gitlab-org/customers-gitlab-com)
- The [gitlab.com/gitlab-com](https://gitlab.com/gitlab-com/) group
- [about.gitlab.com](https://gitlab.com/gitlab-com/marketing/digital-experience/about-gitlab-com)
