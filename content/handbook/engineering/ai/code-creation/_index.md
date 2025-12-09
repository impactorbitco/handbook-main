---
title: "Code Creation Group"
description: The Code Creation Group is responsible for all product categories that fall under the Code Creation group of the AI Engineering organization.
---

## Team Overview

The Code Creation Group develops AI-powered features that help developers write, understand, and improve code. We focus on creating intelligent tools that enhance the developer experience across GitLab.

## Our Projects

The Code Creation team owns and is actively working on the following projects:

- [Code Suggestions](/handbook/engineering/ai/code-creation/code_suggestions/) - AI-generated code completion and generation within IDEs.
- [Repository X-Ray](/handbook/engineering/ai/code-creation/repository_xray/) - Repository analysis and metadata extraction for enhanced code suggestions context.
- [Knowledge Graph](/handbook/engineering/ai/code-creation/knowledge_graph/) - Semantic understanding and relationships within codebases.
- [Codebase Semantic Indexing](/handbook/engineering/ai/code-creation/codebase_semantic_indexing/) - Advanced code search and discovery capabilities using embeddings.
- [Duo Code Review](/handbook/engineering/ai/code-creation/duo_code_review/) - AI-powered code review assistance and insights.
- [Duo Context Exclusion](/handbook/engineering/ai/code-creation/duo_context_exclusion/) - Filtering of sensitive or irrelevant code context.
- [Code-related Slash Commands](/handbook/engineering/ai/code-creation/slash_commands/) - Interactive Duo Chat commands including `/explain`, `/refactor`, `/tests`, and `/fix`.
- [AI Assisted Service](/handbook/engineering/ai/code-creation/ai_assisted_service/) - Core AI infrastructure and services supporting our features.

## Evaluation and Testing

Code Creation is responsible for evaluations across all our features, which includes:

- Creating datasets in LangSmith and registering them in the [Datasets repository](https://gitlab.com/gitlab-org/modelops/ai-model-validation-and-research/ai-evaluation/datasets/-/blob/main/doc/guidelines/register_dataset.md#registration-process). We also have some [Code Creation Datasets](https://gitlab.com/gitlab-org/code-creation).
- Creating evaluators in [Centralized Evaluation Framework](https://gitlab.com/gitlab-org/modelops/ai-model-validation-and-research/ai-evaluation/prompt-library)
- Running evaluations

## Team Handles

Use this information to connect with the Code Creation group:

| Category                 | Handle                                |
|--------------------------|---------------------------------------|
| GitLab Team Handle       | @gitlab-org/code-creation/engineers   |
| Slack Channel            | #g_code_creation                      |
| Slack Handle (Engineers) | @code-creation-engs                   |

## Team Members

The following people are permanent members of the Code Creation Team:

{{< team-by-manager-slug "mnohr" >}}

You can reach the whole team on GitLab issues/MRs by using the `@gitlab-org/code-creation/engineers` handle.

## Stable Counterparts

The following members of other functional teams are our stable counterparts:

| Category          | Counterpart                                                                          |
|-------------------|--------------------------------------------------------------------------------------|
| Product Manager   | {{< member-by-name "Jordan Janes" >}}                                                |
| Technical Writing | {{< member-by-name "Uma Chandran" >}}                                                |
| UX                | TBD                                                                                  |
| Support           | [TBD](/handbook/support/support-stable-counterparts/)                                |
| AppSec            | [TBD](/handbook/security/product-security/application-security/stable-counterparts/) |

## How We Work

For information on how the team works including onboarding, time off, issue boards, meetings, and more, please refer to the [How We Work](/handbook/engineering/ai/code-creation/how-we-work/) page.

## Dashboards and Monitoring

1. [Metrics Dashboard](https://dashboards.gitlab.net/d/stage-groups-code_creation/stage-groups3a-code-creation3a-group-dashboard?orgId=1) (Grafana)
1. [Error Budget](https://dashboards.gitlab.net/d/stage-groups-detail-code_creation/stage-groups-code-creation-group-error-budget-detail?orgId=1) (Grafana)

## Related Resources

- [Code Creation Product Categories](/handbook/product/categories/#code-creation-group)
