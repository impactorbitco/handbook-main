---
title: "Optimizely"
description: "Optimizely is an experimentation tool managed by the Digital Experience team to conduct A/B tests across [about.gitlab.com](http://about.gitlab.com)."
---

## Process

### Step 1: Ideation

Anyone at GitLab can contribute an experiment idea.

1. [Create an issue using the "experiment" issue template](https://gitlab.com/gitlab-com/marketing/digital-experience/about-gitlab-com/-/issues/new?description_template=experiment) and complete the hypothesis section.

2. The issue will be automatically assigned to the DEx Design Manager and Marketing Analyst to complete the remaining sections and experiment setup.

   - **UX Designers**: Responsible for initial experiment setup and variation design using the visual editor.
   - **DEx Engineers**: Handle experiments requiring advanced configurations beyond the visual editor's capabilities. This may require using their [utilities](https://docs.developers.optimizely.com/web-experimentation/reference/utilities)
   - **Marketing Analysts**: Manage audience targeting, traffic allocation, roll-out strategy, and success metrics definition.

3. **Localization Considerations**: When determining if separate experiments are needed for localized paths:
   - **Text-based variants**: Consult the Localization team to verify if translated text maintains the intended message. If the meaning differs significantly, create separate experiments for localized pages.
   - **Non-text variants**: Experiment only on the default English page.

### Step 2: Prioritization

The [DEx Experimentation Roadmap Google Sheet](https://docs.google.com/spreadsheets/d/1WWL40CEV8ZIi8uBSorbGg-uZWUty8tx2/edit?gid=1692352114#gid=1692352114) contains planned experiments and priority scoring.

### Step 3: Design Experiment

1. The DEx Designer will create mockups in Figma, which require review and approval by the Design Manager.

2. The Marketing Analyst will define:

   - Audience targeting
   - Traffic allocation
   - Roll-out strategy
   - Success metrics
   - Estimated duration

### Step 4: Optimizely Configuration

#### Experiment Setup

**Naming Convention**: `[Page Path] - [Experiment Name]`

Examples:

- Home - Hero Trial CTA
- /pricing/premium/ - Anchor Links Blue vs Green
- /why-gitlab/ - Sticky CTA vs Fixed

**Description**: Include your hypothesis, design changes, and a link to the GitLab issue.

**Target By (Page)**:

1. Search for existing pages under "Saved Pages" first
2. If the page doesn't exist, click "Create New Page"
3. Use the page path as the Name (excluding the Home page)

Examples:

- Home
- /pricing/
- /sales/
- /solutions/supply-chain/

**Variation Naming Convention**:

- Control: [element name] (e.g., "Control: Get Started")
- Variant: [element name] (e.g., "Variant: Free Trial")

#### Audience Targeting

> "Targeted experiments can generate 41% higher impact on specific audiences than general experiences"

Optimizely offers multiple targeting options:

- **Standard attributes**: Device type, location, browser
- **Behavioral targeting**: Based on web browsing behaviors
- **Third-party integrations**: Google Analytics and 6Sense audiences, including Sales Segments (SMB, MM, ENT)

#### Traffic Allocation

Default to 100% unless the experiment is considered high risk; in such cases, gradually roll out to 100%.

#### Traffic Distribution

- **High-traffic pages**: Use manual 50/50 traffic split
- **Low-traffic pages**: Consider "Stats Accelerator" distribution mode, which allocates more traffic to the currently winning variant to reach statistical significance faster
- **General rule**: Traffic distribution should always be an even split

#### Metrics

**Before creating new metrics**: Verify if the event already exists to avoid duplication.

**Metric Types**:

- **Click Event Metric**: For click-based metrics
- **Page View Metric**: Based on page hits (e.g., confirmation page)
- **Custom Event Metric**: For all other events (requires Google Tag Manager integration)

**Naming Convention**: `[Metric Type] - [Page/Area Name] - [Element Name]`

Examples:

- Click - Home - Free Trial
- Custom - /sales/ - Form
- Click - Navigation Menu - Platform

### Step 5: QA and Publishing

**QA Checklist**:

- Designer: Verify desktop and mobile layouts
- Designer: Verify visual requirements are met based on mockups
- Analyst: Verify tracking for all variants
- Analyst: Confirm metrics are tracking correctly on Optimizely and Google Analytics

**Approval Process**: All experiments require approval from the Design Manager, Engineering Manager, Director of DEx, or Marketing Analyst before launching to production.

**Launch Times**: Tuesday through Thursday are often preferred for launches, avoiding Monday (when user behavior can be irregular after the weekend) and Friday (to avoid weekend monitoring issues). And early in the day (morning hours of targeted audience) gives us time to monitor for issues and make adjustments if needed.

**Note**: If an experiment needs to be edited after its published, you must create a new experiment, otherwise the data can be skewed.

### Step 6: Analysis and Next Steps

Once the experiment reaches statistical significance (ideally 95% confidence), the Marketing Analyst will provide final results and declare a winner in the issue.

**Optional**: Share results in the #digital-experience-team Slack channel.

**Next steps based on results**:

- **If the variant wins**: The Designer will:

  - Roll out the variant to 100% of traffic
  - Create a new Engineering issue to implement the winning design permanently
  - Turn off the experiment after the permanent implementation goes live

- **If the control wins or data is inconclusive**: The Designer will turn off the experiment.

### Step 7: Announcement

Once the experiment launches, announce it in the #digital-experience-team Slack channel for team visibility. The Designer will update the  issue with next steps based on results.
