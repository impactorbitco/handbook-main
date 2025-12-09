---
title: Marketo program/campaign support
description: 'Marketo campaign projects, processes, and notes'
twitter_image: /images/tweets/handbook-marketing.png
twitter_site: '@gitlab'
twitter_creator: '@gitlab'
---

## Overview
<!-- DO NOT CHANGE THIS ANCHOR -->
The Marketing Operations team provides the Integrated Marketing team with advice around execution strategy and systems set-up. In addition, this function currently supports the Field Marketing and Events teams by creating email marketing and landing page set-up, as well as other tasks in Marketo.

## Working with us

Marketo campaign/program creation and support is a function of Marketing Operations, so [follow the same guidelines](/handbook/marketing/marketing-operations/#how-to-get-help) to request assistance. **Be sure to add the `~MktgOps-Support` label to the issue.** If you submit the request through Asana, labels will be handled for you.

If you are managing a project in Asana, the required tasks for MOps support on email and landing pages are already built into the Regional Marketing template. Follow the instructions below. For corporate events, tasks for program creation already exist in Asana and should be assigned to MOps when you are ready.

### Team Members
<!-- DO NOT CHANGE THIS ANCHOR -->

| Name | Title | Details |
| ---- | ------------ | ---------- |
| Esmira Khalilova | Associate Marketing Operations Manager | Primary execution, process questions |
| Bryce Weatherford | Marketing Operations Manager | Process questions, back-up execution |
| Jenny Tiemann | Staff Marketing Operations Manager | Issue triage, complex set-ups, process questions, back-up execution |

### Process documentation shortcuts
<!-- DO NOT CHANGE THIS ANCHOR -->

- [Sales Nominated Invitations](/handbook/marketing/lifecycle-marketing/email-processes-requests/#sales-nominated-flows-in-marketo)
- [Marketo Program + Salesforce Campaigns](/handbook/marketing/marketing-operations/campaigns-and-programs/#marketo-program-and-salesforce-campaign-set-up)
- [Workshop Landing Page and Marketo Setup](/handbook/marketing/field-marketing/field-marketing-owned-virtual-events/#virtual-workshop-logistical-set-up)

## Project Management
<!-- DO NOT CHANGE THIS ANCHOR -->
All email and landing page builds are handled in Asana.

[Video Explainer (3-minute video)](https://drive.google.com/file/d/18rRtY0YUMphfY9ztPNX7PNO1z5Ju1B_7/view?usp=sharing)

**Process**

- FMM completes copy. Do not complete the next steps until copy is complete.
- FMM moves the "Write Copy" task to the appropriate section in the project. To move a task, you can either drag and drop it to the section you want, or if you are on the task, select the down arrow next to the project name and select the appropriate section.
- The system will create any necessary subtasks and assign Lifecycle and MOps. This process takes a minute, so please wait until the process is complete.
- FMM checks the due date on the main task and adjusts to the desired send date or Landing Page live date. Please be sure to stay in line with [SLAs](/handbook/marketing/marketing-operations/campaign-operations/#slas) and we do not send invite or follow-up emails on Thursday.
- Communicate via comments with Lifecycle and MOps. FMM will not have a task assigned to them, but they will need to approve and provide input when requested by the team. You will be able to find comments in your Asana Inbox.

**Sections**

- Landing Page Requests (all types) - If your "Write Copy" task is for the landing page and your copy is complete, move the task to this section.
- Email Requests (non-workshop) - Use this section if your email requires Lifecycle review. All non-workshop emails require Lifecycle review.
- Email Requests (Workshop) - Use this section if your email does not require Lifeycle review. Reminder emails and Workshop emails do not require Lifecycle review.

### Shortcut list views
<!-- DO NOT CHANGE THIS ANCHOR -->
[Marketing Operations Support board](https://app.asana.com/1/306855239930259/project/1209435555145979/board/1209446656810646)

### SLAs

#### MktgOps

Please note there is a 7 business day SLA with MktgOps, so please plan ahead accordingly. The SLA begins on the day after the issue is put into `~MktgOps::00: Triage` or the task is moved to the correct Project Section in Asana and all required information is complete. For example, if the issue goes to triage/is moved on Tuesday, day 1 is Wednesday, day 7 is the following Thursday. Day 7 is the earliest deployment/live date available. Please allow for US holidays and Family & Friends days as well. Using the same example, if day 4 is a US holiday, this will push day 7 to Friday.

Anything outside of the standard set-up does not fall under the 7 business day SLA. The most common example of this is the creation of custom forms. For more information about when custom forms are required and the timeline for this work, visit the [Marketo HB page](/handbook/marketing/marketing-operations/marketo/#forms).

If you are planning a program that requires anything outside of the standard set-up, bring MOps in early during your planning process. We can help guide you on the best way to use our available technology to reach your goals and keep your program timeline on track.

#### Regional Marketing

Please see Regional Marketing SLAs pertaining to this process [here](/handbook/marketing/field-marketing/#slas).

### Triage Steps
<!-- DO NOT CHANGE THIS ANCHOR -->

1. **Regional Marketing / Corporate Events**: Create a new project using either the Regional Marketing or Corporate Events template. For Regional Marketing, this process is automated through a sync from GitLab > Asana.
1. **Regional Marketing / Corporate Events**: If the copy references analyst reports, the FMM must open the [Analyst Citation Review issue](https://gitlab.com/gitlab-com/marketing/brand-product-marketing/product-marketing/-/issues/new?issuable_template=AR-CitationReview) and associate it to the MOps email request. You do not need to complete the entire issue, but you must link the email issue and the copy doc with your proposed copy. To expedite email approval, you can use the content found [here](https://gitlab.com/gitlab-com/marketing/brand-product-marketing/product-marketing/-/issues/7130#previously-approved-email-copy-still-requires-reapproval) as it is most likely to be approved quickly. We do not have previously approved landing page copy.
1. **Regional Marketing / Corporate Events**: For Regional Marketing, follow the steps outlined in [Project Management](/handbook/marketing/marketing-operations/campaign-operations/#project-management).
    - At this time, all details must be provided and final (including copy reviewed by relevant stakeholders, and all hyperlinks double-checked and confirmed).
    - The requested send date is the due date of the task. If the requested send date is less than 7 Business Days from the date it is passed to Mktg Ops, the date of the issue may be scheduled 7 business days out to abide by SLAs. This is at the discretion of Mktg Ops based on other work in progress and upcoming. Please note that we do not send invites or follow-up emails on Thursdays.
1. **Lifecycle**: Reviews the email copy and once final and approved, update the “Lifecycle Approval Status” custom field to `Copy approved, layout pending` and close the subtask.
1. **MktgOps**: DRI completes the setup in Marketo, and for email, completes all steps on the [Technical Email QA checklist](/handbook/marketing/lifecycle-marketing/email-processes-requests/#email-qa-checklist---technical).
1. **MktgOps**: DRI sends a test email to the FMM/FMC listed in the project and posts a screenshot of the email in the issue.
1. **MktgOps**: DRI comments into the issue tagging the reviewers/approvers and documenting that the test email was sent to their inbox and changes status label to `FM Review Required` and close the subtask.
1 **Lifecycle** Review the layout and once approved, update the “Lifecycle Approval Status” custom field to `Email fully approved` and close the subtask.
1. **Regional Marketing / Corporate Events**: The approver must complete all steps in the [Business Owner Email QA checklist](/handbook/marketing/lifecycle-marketing/email-processes-requests/#email-qa-checklist---business-owner) approve email (or provide corrections) via comment in the task
    - SLA: 24 hours *from when the test email is sent and comment added to issue). Feedback and approval in a timeley manner is critical.
1. **MktgOps**: DRI makes any necessary corrections. If no corrections needed and approval provided by reviewer and Lifecycle, DRI sets the email to send (time for send to be determined in copy doc or using the standard send times) and adds the status label `Scheduled to Send` to the task
1. **MktgOps**: DRI checks that email was sent, confirms in comments (tagging issue requester), paste a screenshot of the preliminary send report, and closes out the subtask. The main task will close automatically upon closure of the final subtask.
1. **Regional Marketing / Corporate Events** Post event reporting. To Request a full Marketo Recap reporting, please  request in the Follow Up email sub issue.

### Responsibilities of email requesters
<!-- DO NOT CHANGE THIS ANCHOR -->

- Issue (email) requesters are responsible for submitting **all details**, including **final approved copy**, reviewed by all stakeholders, PRIOR to moving the task.
- Issue (email) requesters are responsible for **timely feedback and answers**.
- Issue (email) requesters are responsible for **FINAL QA** (including spelling, grammar, readability, and checking that all links direct to the proper URLs and contain proper tracking parameters). Refer to the [QA checklist](/handbook/marketing/lifecycle-marketing/email-processes-requests/#email-qa-checklist---business-owner).

### Review Process

<!-- DO NOT CHANGE THIS ANCHOR -->
Unless otherwise stated, only **ONE** of the people listed as "Reviewer/Approver" and a Lifecycle Marketing Manager need to approve in order for the email to be set.

As stated in "responsibilities of email requesters" section above, the reviewer is responsible for final QA of all copy, grammar, readability, LINKS, tracking, and formatting.

Detailed email QA instructions can be found on the email and nurture handbook page. This checklist should be followed for each email being QAed.

### Questions

Note that if questions arise, ask in the `#mktgops` Slack channel.

### Email Send Times

Due to nurture protocols, we do not send non-operational emails (invites, follow-ups) on Thursdays.

If the Regional Marketer/Event Manager does not provide a specific time, then emails will send at the following times:

- AMER label: 9 AM ET
- EMEA label: 10 AM CET
- APAC label: 11am AEST

Should a requested send time be missed, MktgOps can schedule the email within 8 hours of the original ask, or the following day if other email sends will reduce the list size of the email. If the send time must go beyond 24 hours of the original send time, MktgOps will discuss options with the FMM in the issue.

### Technical set-up - email

- Specialized email headers (not the standard header used in templates) - Typically used for large events such as Commit or DevSecOps World Tour.
  - The images will be requested either by Lifecycle Marketing or the event DRI
  - Image dimensions can be found on the [email marketing page](/handbook/marketing/lifecycle-marketing/email-best-practices/#email-templates).
  - The requested image must be transparent. We cannot use a solid image as it will not render properly in all clients.
  - In the email code (under "Edit Code"), you should use a solid email background (the color will change depending on the design for the event). Example code from the `B - Advanced modular template - light mode` template (aka Advanced Webcast Template). The variables to edit are bgcolor=`#xxxxxx` and border-bottom: 4px solid `#xxxxxx`
     `<tr class="mktoModule" id="bgImagewText4990312b-fd20-449c-a184-d0500cdcc1aa" mktoname="Background Image with CTA">
                        <td background="${heroBackgroundImage}" bgcolor="#171321" valign="middle" style="max-width: 600px; width: 100%; text-align: center; height: 200px; background-repeat:no-repeat ;background-position: 100% !important; background-size: cover !important; border-bottom: 4px solid #171321;" width="100%" height="auto">`
    - After saving the edits in the code, you can then click on the existing header, and the Variable sidebar will appear. Add the new transparent image to the `Hero Background Image` section, and confirm the link and button Copy
    - All emails using specialized images must be [sent to Litmus](/handbook/marketing/marketing-operations/litmus/#steps-to-test-an-email) for previewing various clients. Refer to the Litmus page for details on what to check.
- When using the URL in emails or other uses with utm values, Marketo page URLs (starting with page.gitlab.com) should not have a `/` at the end of the page URL before the `?`. This will likely cause the page to redirect. (Correct example: `https://page.gitlab.com/webcast-example?{{my.utm}}`).
- When using the URL in emails or other uses with utm values, about.gitlab.com page URLs (starting with about.gitlab.com) must have a `/` at the end of the page URL before the `?`. Omitting the `/` can cause the form not to display on the page. (Correct example: `https://about.gitlab.com/webcast-example/?{{my.utm}}`).
- For localized emails, be sure to use the [Localized Email Snippet](/handbook/marketing/marketing-operations/marketo/#snippets)
- Prior to sending to the business owner review, the email creator must complete all steps in the [Technical email QA checklist](/handbook/marketing/lifecycle-marketing/email-processes-requests/#email-qa-checklist---technical)

### Technical set-up - landing pages
