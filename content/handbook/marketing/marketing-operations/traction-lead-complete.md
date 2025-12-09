---
title: Traction Lead Complete
description: Traction Lead Complete Overview
twitter_image: /images/tweets/handbook-marketing.png
twitter_site: '@gitlab'
twitter_creator: '@gitlab'
---

- Overview
- Lead Routing Workflow
- Partner lead management
- Contact routing workflow
- Account routing workflow
- Lead routing request or question?
- How to Reassign a lead
- Traction Lead Flow update process

## Overview

Traction Lead Complete is an application within Salesforce to process and assign lead records, as well as matching those leads to accounts.

Traction assigns each MQL (Marketing Qualified Lead) to the member of the Sales Development organization who is responsible for engagement and qualification of that individual dependant on the workflow. Currently we are only using Traction for lead routing.

## Lead Routing Workflow

To read in more detail how our lead routing logic is set up, please visit the internal handbook page on [Traction](https://internal.gitlab.com/handbook/marketing/marketing-strategy-and-platforms/marketing-operations/traction/).

## Partner Lead Assignment

In the first stage of the main lead assignment flow, Traction runs through its assignment rules to filter for Channel Partner and Distributor leads. They are assigned using campaign member based routing and primarily fields on the campaign member object. Most Channel related records are assigned to `Partner Queue` and passed to Channel Partners via [Impartner](/handbook/marketing/marketing-operations/impartner/), where they can accept, assign and qualify the leads.

Note: Alliance partner leads will be assigned to members of the Sales Development team for qualification.

GitLab collaborates with Channel Partners to develop co-marketing campaigns including Partner sponsored, MDF funded, free trial and joint partner campaigns.

### Partner Sponsored Event

GitLab allows Channel Partners to sponsor our owned events. Traction completes the following steps when it recognizes a new campaign member is associated with a [partner sponsored event](/handbook/marketing/channel-marketing/#partner-sponsored-events):

1. Reviews the lead fields for  `Lead Acquisition Source` = `Partner Sponsored Event` and `Impartner Partner Account` is not empty
1. Checks the lead fields for  `Partner Recalled Date` is empty and `Partner Recalled` equals `False`
1. Updates `Partner Share Status` = `Pending` and `Partner Lead Status` = `Qualifying` which enables the lead to be synced into the Impartner Prospects (Lead Sharing).
1. Assigns the lead to `Partner Queue`.

### MDF and Free Trial Campaign

Traction completes the following steps when it recognizes a new campaign member is associated with a [MDF campaign](/handbook/marketing/channel-marketing/#mdf-campaigns) and trial campaign:

1. Reviews the campaign field for `Will there be MDF funding` = `Yes`, campaign name if it starts with  `Partner - Trial`and lead field for `Impartner Partner Account` is not empty.
1. Checks the lead fields for  `Partner Recalled Date` is empty and `Partner Recalled` equals `False`
1. Updates `Prospect Share Status` = `Sending to Partner` and `Partner Prospect Status` = `Qualifying` which enables the lead to be synced into Impartner.
1. Assigns the lead to `Partner Queue`.

### Joint Partner Campaign

Traction completes the following steps when it recognizes a new campaign member is associated with a [joint partner campaign](/handbook/marketing/channel-marketing/#joint-gitlab-and-partner-campaigns):

1. Reviews the campaign fields for `Is a Channel Partner Involved?` = `Yes` and  `Campaign Member Status` with regards to partner engagement, and the lead field for `Impartner Partner Account` is not empty.
1. Verifies the campaign member is not actively worked by GitLab, thus `Person Status` is not `Accepted`, `Qualifying` nor `Qualified`, or `Actively Being Sequenced` = `False`. <br>
If all above is
   1. True, then Traction updates the `Partner Prospect Status` to `Qualifying`, `Prospect Share Status` = `Sending to Partner`, then assigns the lead to `Partner Queue`
   1. False, then Traction assigns to appropriate SDR.

### Exceptions to This Rule

When a lead/contact engages with GitLab in any shape or form, for example, via an inbound marketing request, the lead/contact owner is responsible for following up with the partner lead, regardless of their stage within the partner lead lifecycle.

## Contact Routing

The scope of the contact assignment flow is very limited. Records are only processed by the lead assignment flow if they are meant to be managed by partners via Impartner.

Traction works to ensure all regional SMB Sales owned accounts and their associated contacts are owned by AMER/EMEA/APJ SMB Sales. When leads are converted, contact ownership consistently update to the appropriate regional SMB Sales owner. We implemented a change in October of 2025 to fix contact ownership reassignment; If there's an open opportunity, Traction will now update all contacts associated to the Account (not just Primary Owner) to the SMB account owner (rather than the opportunity owner).

All other [SFDC contact ownership rules](/handbook/sales/field-operations/gtm-resources/#changing-contact-ownership-in-salesforce) are maintained through [Traction](/handbook/marketing/marketing-operations/traction-lead-complete/#contact-routing). If you have questions or concerns about contact routing outside of partner record management processes, please reach out to [Sales Systems](/handbook/sales/field-operations/sales-systems/).

## Account Routing

All account routing is handled by Enterprise Territory Management (ETM). If you wish to learn more about this, please visit the sales operation handbook.

## Traction Complete view on the account object

We have custoized the lead section of the Traction Complete view on the account object. To navigate to this section in Salesforce Lightning, click `Traction Complete` on the top of the account page (same rown you find `Details`). This will open the view where you can see all leads matched to the account with useful information like Full Name, Title, Email, Last Activity, Last Flow Name, and Active Flows Count. This information can be valuable to Sales Development and Sales to collaborate on reaching out to high value leads associated with their accounts.

## Lead routing request or question?

### Request an SDR alignment update

New hire? Territory change needed? Have an SDR on your team who's going to be out of the office? If requesting a proactive update to the lead routing workflow, open an issue using the [LeanData change request issue template](https://gitlab.com/gitlab-com/marketing/marketing-operations/-/issues/new?issuable_template=leandata_change_sdralignment).

### Experiencing a lead routing problem?

Lead volume low? Receiving leads from an account or territory you're not assigned to? If you think you've found a bug :bug: in existing lead routing logic, open an issue using the [bug request issue template](https://gitlab.com/gitlab-com/marketing/marketing-operations/-/issues/new?issuable_template=bug_request).

### General questions

Open a [Marketing Operations issue](https://gitlab.com/gitlab-com/marketing/marketing-operations/-/issues/new) following the format in the issue template.

### How to reassign a lead step by step

1. Update [Admin] Company Address Country. You will need to update the [Admin] Company Address Source field before the country field will save.
2. Check the box for Re-run Traction Complete. Save the lead.
3. Refresh - the lead should now be reassigned.

Notes:

- The lead will be assigned based on round robins for that region.
- This will only work for MQL reassignment- it will not work for HP leads.
- This will not work if the lead is matched to an account where there is a BDR assigned ( in APJ) and marked as Actively Working (EMEA & AMER).
- Remember that the '[Admin] Company Address Country' also affects account and opportunity routing so don’t update the country unless you are sure of where it is.

## Traction Lead Flow Update Process

- For any updates in logic needed, we will first build the logic in the Staging SFDC environment, test appropriately and then upload the new graph to production.

- To make sure you are working off the latest flow, please export the live graph from production and import it into staging before making your edits.

## Schedule Routing Jobs

There are a number of scheduled and/or clean up jobs on the lead and contact object to help ensure records are in the proper ownership.

1. Daily lead ownership to Queues. This job runs nightly on leads in Inquiry, Ineligible, and Disqualified status to the corresponding status queue. Other filters include: Lead is not actively being sequenced, Matched account is not Actively Working, Lead is not converted, AI Email in Progress is false, Owner Profile is Sales Development Rep OR Marketo Integration with a Last Interesting Moment Date greater than May 1, 2025

2. Weekly lead ownership to Queues. This job runs weekly on Saturday on leads in Raw and Recycle status. Other filters include: Lead created date is greater than 7 days ago, High Priority is false, AI Email in Progress is false, Actively Being Sequenced is false, Matched Account is not Actively Working, Is Converted is false, Owner Profile is Sales Development Rep OR Marketo Integration with LIM Date after May 1, 2025.

3. Daily Recycle, No Action flow. This job moves leads that have been in MQL status for more than 30 days to Recycle, No Action.

4. BDR Actively Working Reassignment. This job moves leads matched to an account that has been marked as Actively Working to the BDR Assigned on the account. The leads must be in Recycle, Raw, or Inquiry status. The job is scheduled to look at BDR Prospecting Status changes that occured the previous day.

5. Inactive User Lead Assignment: When the owner of a lead goes inactive in Salesforce, the lead will be reassigned based on our routing rules.

6. Account Owner/BDR Assigned Change Contacts Assignment: When the Owner or BDR Assigned on an account is changed, contacts associated with that account will run based on our contact assignment rules.
