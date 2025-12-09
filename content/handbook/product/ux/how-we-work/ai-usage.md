---
title: "AI usage in UX"
description: "How to use AI for UX activities. Learn when to use AI, best practices, what to avoid, and how to keep users at the center while using AI as a helper."
---

This page shows how to **use AI for user experience (UX) activities**.
It adds to our general AI guidance and is for anyone doing UX work at GitLab, regardless of their department.

If you want to know how to **work on AI experiences**, see [these resources](/handbook/product/ai/#design-and-ux-research-for-ai-features).

## Getting started

First, read the general guidance in our internal handbook:

- [AI usage requirements and FAQs](https://internal.gitlab.com/handbook/company/ai-at-gitlab/#usage-requirements-and-faqs)
- [General purpose AI tool usage requirements](https://internal.gitlab.com/handbook/ai-security-at-gitlab/ai-tool-usage-requirements/)

The information on this page adds to that general guidance with advice for anyone doing UX activities.

### About AI tools

This guide tries to work with any AI tool, but AI usage depends on what tools we can use.
This page will be updated as new tools become available.

Based on our [approved AI tools](https://internal.gitlab.com/handbook/company/ai-at-gitlab/#approved-ai-tools) (internal), the main AI tools for UX work at GitLab are:

- Claude (general purpose)
- Dovetail (interview transcriptions)
- [FigJam](https://help.figma.com/hc/en-us/articles/16822138920343-Use-AI-tools-in-FigJam) (whiteboards and diagrams)
- [Figma Design](https://help.figma.com/hc/en-us/articles/23870272542231-Use-AI-tools-in-Figma-Design) (content, images, design, and basic prototypes)
- [Figma Make](https://help.figma.com/hc/en-us/articles/31304412302231-Explore-Figma-Make) (functional prototypes and web apps)
- [GitLab Duo](https://docs.gitlab.com/user/gitlab_duo/) (GitLab and software development)
- Rally (interview transcriptions)

Our [Tech Stack](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/data/tech_stack.yml) may have other tools with AI features you can use for UX work.

### Main rule: AI helps, doesn't replace

AI works best as a creative helper that makes human skills better, not as a replacement for user-centered thinking.
[47% of UX professionals say](https://www.nngroup.com/articles/ux-reset-2025/) AI helps them, with teams working [250% faster](https://www.stepsize.com/blog/ai-adoption-strategy-for-software-teams) when they use it well.
Success comes from using AI smartly while keeping human judgment and focusing on users.

## When to use AI

### Get feedback

Use AI also as a critic, and not just as a generator.
It can help you get things done quickly, but it can also help improve your work faster.
It can be a cost-effective way to get feedback before asking a colleague for an expert review.

To get feedback on your work:

- **General**: Add documents, images, and links for Claude to review.
  Use the [Google Drive integration](https://support.anthropic.com/en/articles/10166901-using-the-google-drive-integration).
- **GitLab**: Ask [GitLab Duo Code Review](https://docs.gitlab.com/user/project/merge_requests/duo_in_merge_requests/#have-gitlab-duo-review-your-code) to review of your merge request.
- **Designing**: Add images or Figma Design links for Claude to review.
  For Figma Design, first install the [Figma Dev Mode desktop extension in Claude Desktop](https://intercom.help/anthropic-6f71807d7c3e/en/articles/10949351-getting-started-with-local-mcp-servers-on-claude-desktop#h_df27ba7397) and [enable the MCP server in Figma](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Dev-Mode-MCP-Server).

### Plan research

**Tools**: Claude.

- **Study plans**: Create research questions, survey questions, interview guides, and usability test tasks.
- **Ideation support**: Generate content for participants to use during studies.
- **Participant recruitment**: Draft recruitment emails and screeners.
- **Role-playing - be careful**: Simulate participant responses or interactions to test study plans.
  It can't predict or replace real human behavior, so always test with actual users or run a small pilot before launch.

### Collect data

**Prompts**: See [UX Research Prompts](https://gitlab.com/gitlab-com/office-of-the-ceo/ai-at-gitlab/ai-at-gitlab-usecases/-/issues/64) (internal).

**Tools**: Claude, Dovetail, GitLab Duo, Rally.

- **Transcriptions**: Turn video interviews into text (transcription) with [Dovetail](https://docs.dovetail.com/help/transcribe-and-translate) or [Rally](https://help.rallyuxr.com/en/articles/9213503-observer-rooms).
   Download the transcription to analyze in Claude.
- **Desk research**: Quickly summarize background info, related studies, and find references.
  [GitLab Duo Chat for GitLab info](https://docs.gitlab.com/user/gitlab_duo_chat/examples/), and [Claude for web search or research](https://support.anthropic.com/en/articles/11095361-when-should-i-use-web-search-extended-thinking-and-research).

### Analyze data

**Prompts**: See [UX Research Prompts](https://gitlab.com/gitlab-com/office-of-the-ceo/ai-at-gitlab/ai-at-gitlab-usecases/-/issues/64) (internal).

**Tools**: Claude (others are more often incorrect).

- **Pattern finding - be careful**: Spot trends across different data and user sessions.
  Always [review](#review) all claims and ask for sources.
- **Initial coding - be careful**: Create starting themes from research data.
  Always [review](#review) all claims and ask for sources.
- **Spreadsheet formulas**: Generate formulas for data analysis in tools like Google Sheets.
- **Reporting**: Get help with storytelling, report outlines, and summaries from research results.
- **Persona content**: Turn research insights into persona stories.
- **Proto-personas**: Draft hypothetical personas.
  Clearly mark these as "based on assumptions" and plan to test them with real users later.

### Whiteboards and diagrams

**Tools**: Claude, FigJam, GitLab Duo.

- **Whiteboards**: Prepare boards for team exercises and meetings.
- **Diagrams**: Create visual supports like diagrams, mind maps, flow charts, and timelines.
  Claude and GitLab Duo can create [diagrams for GitLab Flavored Markdown](https://docs.gitlab.com/user/markdown/#diagrams-and-flowcharts).
- **Stickies**: Quickly sift through and categorize stickies to create alignment and outline next steps.
- **Images**: Generate and edit images to go beyond text and stickies with FigJam.

### UI text

**Tools**: Claude, Figma Design.

- **UI text creation**: Create different versions of error messages, tooltips, and UI text.
- **Tone changes**: Make content clearer, shorter, or match our brand voice.
- **A/B test versions**: Generate different wordings for testing.

### Design

**Tools**: Claude, Figma Design.

- **Idea exploration**: Quickly create many design directions, use cases, or scenarios.
  Claude for ideas in text and Figma Design for visual ideas.
- **Real content**: Replace placeholder text with actual UI text.
- **Wireframe starting points**: Use as first concepts, not final designs.
- **Visual assets**: Create quick icons, illustrations, or concept art with Figma Design.
- **Fake data — be careful**: Create user input for testing (like many form entries or user profiles).
  It can't predict or replace real human behavior, so always test with actual users.

### Prototype

We are currently testing and choosing tools for AI prototyping in [this confidential issue](https://gitlab.com/gitlab-org/gitlab-design/-/issues/2816).

**Tools**: Claude, Figma Design, Figma Make.

- **Basic prototypes**: Add interactions to quickly turn designs into basic prototypes with Figma Design.
- **Functional prototypes**: Build functional prototypes that show ideas quickly.
  Figma Make can use Pajamas components, Claude uses generic UI components.

### Product documentation

**Tools**: Claude, GitLab Duo.

- **Write and improve documentation**: Create drafts, turn lists into tables, and make content easier to scan.
- **Technical tasks**: Fix broken pipelines, write scripts to analyze data, and create [Mermaid diagrams](https://docs.gitlab.com/user/markdown/#mermaid).
- **Analysis and research**: Review documentation to find improvements, summarize long documents, and organize content by topic.

For more information, see [how to use AI for GitLab documentation](https://docs.gitlab.com/development/documentation/ai_guide/).

## When not to use AI

- **Never replace real users**:
  - Don't pretend AI feedback is user feedback or create fake research data.
  - AI doesn't understand emotions and context needed for decisions that really affect user well-being.
  - No AI can accurately predict real human behavior.
- **Important decisions**: Sensitive situations, like software security or personal data, need careful human oversight that AI can't provide.
- **Production without review**:
  - Never give users AI-created outputs without human checking.
  - AI tools can create generic, template-like outputs even with specific instructions.
- **Faster to do manually**:
  - Sometimes struggling with an AI prompt takes more time than just doing the task yourself.
  - If you spend 30 minutes trying to get AI to create a very specific idea, it might be faster to sketch it by hand.
  - Use AI where it clearly helps with speed or creativity; if it's being difficult, go back to your normal way.

## Recommendations

| ✅ Do  | ❌ Don't |
| --- | --- |
| Use AI for boring work and brainstorming | Skip user research or testing |
| Pick right AI mode for task | Use same AI mode for everything |
| Keep humans involved at every step | Trust AI outputs blindly |
| Check insights with real data | Put sensitive data into unknown tools |
| Write detailed, context-rich prompts | Use AI content without editing |
| Document when and how AI was used | Hide that you used AI |
| Try different versions and experiment | Think one attempt is enough |
| Follow ethical standards | Ignore company guidelines |
| Keep developing core UX skills | Become dependent on AI |

## Best practices

To avoid common problems when using AI, learn how to apply best practices.

### Data safety and legal

**Problem**: Many lawsuits against AI companies show copyright risks.
Many AI services keep and use input data to train their models, which could expose private information.

**Best practices**:

- Follow the [general purpose AI tool usage requirements](https://internal.gitlab.com/handbook/ai-security-at-gitlab/ai-tool-usage-requirements/) (internal).
- Only use the [approved AI tools](https://internal.gitlab.com/handbook/company/ai-at-gitlab/#approved-ai-tools) (internal) and respect their data classification levels.
  Some AI features in approved UX tools, like Figma, can be used according to their data classification level in the [Tech Stack](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/data/tech_stack.yml).
- You may test other AI tools for competitive analysis if you follow the [benchmarking guidelines](https://internal.gitlab.com/handbook/legal-and-corporate-affairs/legal-product-ip/third-party-benchmarking-guidelines/) (internal) and the [public discussion guidelines](/handbook/legal/competitor-discussion-guidelines/).
- Don't send sensitive or personal information to tools that haven't been approved for this.

### Modes

**Problem**: Using the same AI mode for every task can waste time or give poor results.
Research mode for simple tasks wastes time, while standard mode for complex work can miss critical insights.

**Best practice**: Pick the right AI mode for your task.
To select a mode, you may need to turn on a setting or choose a different model.

| Mode | When to use | Examples |
|------|-------|----------|
| **Standard/small/mini**<br>Change to a smaller mode for quicker responses | Simple questions with clear answers and enough context | - Writing button text<br>- Drafting test scripts<br>- Quick brainstorming |
| **Web search**<br>Usually turned on by default | Need current info beyond AI's training | - Latest coding practices<br>- Recent security issues<br>- Competitor updates |
| **Research** | Deep analysis needing multiple sources (10+ minutes) | - Competitive analysis reports<br>- Industry best practices<br>- Strategic planning |
| **Thinking/reasoning** | Complex problems needing step-by-step work (20-60 seconds, worth the time for most UX work) | - Accessibility planning<br>- Information architecture planning<br>- User flow mapping |

### Context and requirements

**Problem**: AI doesn't know your project details, preferences, or knowledge unless you manage what information it has access to.
Without this, results can be too general and don't match your needs.

**Best practice**: Context engineering means giving AI the right information at the right time for each task.
You not only write good prompts, but you also manage the AI's knowledge.

**1. Write context**: Use files that store project knowledge so you don't repeat yourself.
Examples:

- User personas and research findings
- Design principles and guidelines
- Technical limits and requirements
- Style guides and component rules

With Claude, [create a project with knowledge and instructions](https://support.anthropic.com/en/articles/9519177-how-can-i-create-and-manage-projects). For other tools, keep a "project context" folder with key files you can reference or share with AI when starting new tasks.

**2. Select context**: Pull the right information into each conversation based on your current task.

| Include | Examples |
| --- | --- |
| Role | "You're a UX designer for developer tools with deep understanding of CI/CD workflows"<br>"Act as a DevSecOps engineer reviewing the merge request interface for security scanning results" |
| Specific task with context | "Write 3 error messages for when a CI/CD pipeline fails because security problems were found during SAST scanning"<br>"Create 5 usability test tasks for developers setting up their first GitLab Runner" |
| Complete background info | "Our users are software developers with 3–10 years experience who manage multiple repositories. They want clear feedback on build status and quick access to logs"<br>"This is for a DevSecOps platform. Users range from junior developers to senior SREs managing production deployments across multiple environments" |
| Examples | "Here's a good error message from our app: …"<br>"Follow the style of these existing personas: …" |
| Format | "Use this template format"<br>"Format as a table with columns: …" |
| Success criteria | "Include the failed stage, use standard Git terms, use clear language, give next steps"<br>"Follow GitLab's design system, be easy to scan, and include error codes" |

**3. Compress context**: When chats get long, summarize key decisions instead of repeating everything.
Examples:

- "Based on our discussion, we decided: (key points)"
- "Main user problems: slow feedback, unclear errors"
- "Using the guidelines we established earlier…"

With Claude, you can [search and reference past chats](https://support.anthropic.com/en/articles/10185728-understanding-claude-s-personalization-features#h_4afb5dcf4b).

**4. Isolate context**: Use different conversations for different types of work to avoid confusion. Approaches:

- Separate chats for research vs. design vs. testing.
- Different sessions for each user type or feature.
- Switch AI "roles" between conversations (researcher vs. designer vs. writer).

### Improvement

**Problem**: Taking the first AI response misses the chance for better results.
AI can create many variations, but teams often don't use this ability.

**Best practices**:

- Ask for multiple options (3–10 variations is usually enough).
- Combine the best parts (phrases, structures, or concepts).
- Improve through conversation: ask follow-ups and refinements to previous responses.
- Always apply human editing and expertise before sharing.

**Example**:

1. Round 1: "Create tooltip for CI/CD pipeline status".
1. Round 2: "Make it shorter and mention the last commit".
1. Round 3: "Use GitLab's specific terms for job artifacts".
1. Round 4: Combine best parts, add team's style guide requirements.
1. Final: Human polish for clarity and brand consistency.

### Review

**Problem**: Even with context, AI results can be incorrect, inappropriate, or incomplete.
AI explanations can actually make people rely more on AI recommendations instead of strengthening human judgment.

**Best practices**:

- Fact-check all claims and ask for sources.
- Double-check counts, percentages, and other numbers.
- Compare with established UX principles.
- Test with real users when possible.
- Review for bias in personas and recommendations.
- Treat AI like an intern: helpful, but needs oversight.
- Build review time into your process for any AI contribution.

### Biases

**Problem**: AI can reflect and make worse biases present in its training data.
This creates recommendations that aren't representative or that put specific groups at a disadvantage.

**Best practices**:

- Do an "inclusivity check" on all AI outputs.
- Ask: Could any group be misrepresented or hurt by this?
- Ask for diversity when creating personas or user scenarios.
- Test outputs with diverse user groups.
- Watch for cultural assumptions in language and images.
- Consider asking AI to self-check: "Does this contain any biased assumptions?"

### Transparency

**Problem**: Stakeholders and team members may not know when or how AI was used in research and design work, leading to trust issues and inability to properly judge the quality of insights.
This lack of openness can also create ethical concerns about hidden AI involvement in user-facing decisions.

**Best practices**:

- Note which parts of deliverables used AI help.
- [Disclose AI involvement in published content](https://internal.gitlab.com/handbook/ai-security-at-gitlab/ai-tool-usage-requirements/#attribution-of-published-content), like research reports and user-facing decisions.
  Examples:
  - "Analysis for these interviews was done using Claude, checked by @username"
  - "UI text variations created by Figma, reviewed and edited by @username"
- Keep copies of successful prompts in shared documentation.
- Share both AI successes and failures with the team to build group knowledge.
  See [documentation and knowledge sharing](#documentation-and-knowledge-sharing).

## What's next

### Staying current

The AI world changes quickly, with new abilities and tools appearing constantly.
You should invest in continuous learning to stay current with AI developments relevant to your work.
See the [UX Department learning page](/handbook/product/ux/learning-and-development/) and [company learning resources](/handbook/people-group/learning-and-development/#team-member-resources) available to you, and discuss this with your manager.

### Documentation and knowledge sharing

We want to learn from both successes and failures in AI usage for UX work at GitLab.

Check and contribute to these resources:

- [AI at GitLab Tips](/handbook/tools-and-tips/ai/)
- [UX Research Prompts](https://gitlab.com/gitlab-com/office-of-the-ceo/ai-at-gitlab/ai-at-gitlab-usecases/-/issues/64) (internal)
- [AI use cases and prompts project](https://gitlab.com/gitlab-com/office-of-the-ceo/ai-at-gitlab/ai-at-gitlab-usecases)
- Improve this page!

### Tool evaluation and selection

To help you successfully use AI for UX work, we need ongoing assessment of new AI abilities against existing workflows.
If you have an idea or suggestion, create an issue in the [GitLab Design project](https://gitlab.com/gitlab-org/gitlab-design/issues/).
