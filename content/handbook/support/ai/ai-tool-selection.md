---
title: AI tool selection
description: Guidelines around selecting the best AI tool for the task at hand
---

GitLab Support provides access to various AI tools with different capabilities and specializations. This guide helps you select the right tool based on your specific task requirements.

> [!note]
> This guide assumes you've read the [AI and Support Work](_index.md) page and determined that AI will help with your task. If you're unsure whether to use AI, start there first.

## Quick Reference Table

| Tool | Best For | Speed | Customer Data | GitLab Access |
|------|----------|-------|---------------|---------------|
| [GitLab Duo Chat](https://docs.gitlab.com/user/gitlab_duo_chat/) | GitLab-specific questions, code analysis | Fast | ✅ Safe | Product knowledge |
| [GitLab Duo Agentic Chat](https://docs.gitlab.com/user/gitlab_duo_chat/agentic_chat/) | Complex research, multi-step analysis | Slow | ✅ Safe | Full ecosystem access |
| [Claude Sonnet 4](https://www.anthropic.com/claude/sonnet) | Fast reasoning, communication, everyday tasks | Fastest | ⚠️ Requires sanitization | None |
| [ZenDuo](../../security/customer-support-operations/docs/zendesk/apps.md#zenduo) | Summarizing Zendesk tickets, suggesting KB articles | Fast | ✅ Safe | Product knowledge (via Duo Chat) |

## Tool Comparison

### GitLab Duo Chat

**Ideal for:** Quick GitLab feature questions, code explanations, standard troubleshooting

**Data Classification:** [RED](/handbook/security/policies_and_standards/data-classification-standard/#red)

**Strengths:**

- Deep GitLab product knowledge and documentation access
- Fast responses for straightforward questions
- Safe for customer data processing
- Integrated into GitLab workflow

**Best use cases:**

- "How does GitLab feature X work?"
- "Explain this customer's configuration"
- "What could cause this GitLab error?"
- Processing logs from customer environments

### GitLab Duo Agentic Chat

**Ideal for:** Research across GitLab ecosystem, complex multi-step workflows

**Data Classification:** [RED](/handbook/security/policies_and_standards/data-classification-standard/#red)

**Strengths:**

- Only tool with direct access to GitLab projects, issues, and MRs
- Handles complex, multi-step analysis
- Can generate documentation drafts and MRs
- Safe for customer data processing

**Best use cases:**

- "Find existing issues related to this customer problem"
- "Research workarounds in long issue discussions"
- "Generate documentation updates and MRs"
- "Code contributions to GitLab codebase"
- Complex ticket analysis requiring multiple sources

### Claude Sonnet 4

**Ideal for:** Fast reasoning, communication enhancement, general problem-solving

**Data Classification:** [ORANGE](/handbook/security/policies_and_standards/data-classification-standard/#orange)

**Strengths:**

- Fastest response times among all tools
- Cost-efficient for high-volume tasks
- Excellent for communication enhancement and creative problem-solving
- Strong performance on practical coding and reasoning tasks

**Best use cases:**

- Improving response clarity and tone
- Quick analysis of complex scenarios (sanitized data)
- High-volume ticket processing
- Creative problem-solving and brainstorming
- General reasoning tasks that don't require GitLab-specific knowledge

### ZenDuo

**Ideal for:** Summarizing Zendesk ticket conversations and suggesting relevant GitLab KB articles

**Data Classification:** [RED](/handbook/security/policies_and_standards/data-classification-standard/#red)

**Strengths:**

- Built directly into the Zendesk ticket sidebar
- Safe for customer data processing
- Powered by [GitLab Duo Chat](#gitlab-duo-chat), leveraging its product knowledge to analyze ticket content
- Supports both predefined and customizable prompts
- Ticket-linked history makes it easy to continue or revisit past conversations

**Best use cases:**

- "Summarize this ticket’s conversation for a handoff"
- "Suggest a relevant KB article for this issue"
- Creating and reusing custom prompts tailored to Support workflows
- Quickly generating structured AI insights without leaving Zendesk
