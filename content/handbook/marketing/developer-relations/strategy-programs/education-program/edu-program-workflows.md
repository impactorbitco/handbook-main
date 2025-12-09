---
title: "GitLab for Education Program Workflows"
description: "Details on program-specific workflows related to the GitLab for Education Program"
---

## Overview

This page contains details regarding workflows specific to issuing complimentary GitLab Ultimate licenses through the [GitLab for Education Program](/handbook/marketing/developer-relations/strategy-programs/education-program/).
Program members apply directly through the [GitLab Customers Portal](https://customers.gitlab.com/subscriptions/community_program/coupons/new?program=EDU) and are verified through a third party, [Proxi.id](https://proxi.id/).
Successfully verified users receive an email sent via `education@gitlab.com` with a coupon code and instructions to claim the subscription.

## Application workflow

Users must login or register through the [GitLab Customers Portal](https://customers.gitlab.com/subscriptions/community_program/coupons/new?program=EDU) to begin the application process.
The GitLab Customers Portal creates a unique tracking ID each time a program member attempts to start their verification with Proxi.id.
Only the tracking ID is sent to Proxi.id and no other PII is exchanged from the Customers Portal.

### Proxi.id verification workflow

Proxi.id offers several methods for verifying user identity at the academic institution.

1. Single sign on (users can log into their institutions SSO for automatic verification)
2. Email domain check (users can enter their institution email address and then confirm via a link)
    * If the institution uses a shared domain for both students and faculty, further proof of employment is required
3. Submit proof of eligibility (users can fill out a form and upload a document proving their employment at the institution)

If applicants are not successful with the first 3 automated verification options above, the Proxi.id team will offer a manual review for the applicant.
Proxi.id will send a message to the email the user provided during the proof of eligibility form submission and ask the user to upload an additional document.
Proxi.id also instructs the user to reach out to the GitLab Education Program team for any additional support using `education@gitlab.com`.

### Checking verification status

GitLab team members can view whether or not an applicant has successfully verified from the [Proxi.id Verifications page](https://customers.gitlab.com/admin/community_program~proxy_id_verification) in the Customers Portal.
A "succeeded" status indicates Proxi.id has returned a webhook to confirm back to the Customers Portal which automatically triggers the Customers Portal to email the coupon code and instructions to the applicant.
An "initialized" status indicates the user has started the verification process but may or may not have submitted anything.
GitLab team members can follow up with the Proxi.id team by emailing gitlab-support@proxi.id with the user tracking ID to inquire about current status.

### Proxi.id bypass codes

GitLab team members can email gitlab-support@proxi.id to ask the Proxi.id team for bypass codes which can be used in lieu of the SSO/email check for verification.
Bypass codes are valid for 7 days and contain a special email address and verification code to submit in the Proxi.id UI.

### Manual codes

The GitLab for Education Program team can additionally provide a manual GitLab Ultimate coupon code directly to a member at their discretion using a code available in the [internal coupon code spreadsheet](https://docs.google.com/spreadsheets/d/1kORpssdu28RS1GIeE5C-LVzrrKC1iLwEoC3x0_2OnwU/edit?usp=sharing).

## Education Service Desk

We use the GitLab Service Desk feature to automate GitLab issues for anyone who emails `education@gitlab.com`.
This helps us assist current and prospective GitLab for Education Program members with general questions or blockers when applying or renewing for the program.

* [GLQL Triage](https://gitlab.com/gitlab-com/marketing/developer-relations/meta/-/issues/61)
* [Education Program Support project](https://gitlab.com/gitlab-com/marketing/developer-relations/education-program/education-program-support/-/boards)
