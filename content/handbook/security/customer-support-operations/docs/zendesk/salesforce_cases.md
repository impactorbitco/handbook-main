---
title: Salesforce cases
description: Operations documentation page for Salesforce cases (sync)
canonical_path: "/handbook/security/customer-support-operations/docs/zendesk/salesforce_cases"
---

## Zendesk Salesforce cases sync

This is runs at two periods of time:

- whenever a ticket with an organization associated is created
- whenever a ticket with an organization associated is closed

At either event, a pipeline is triggered at at the corresponding project:

- [For the Global Zendesks](https://gitlab.com/gitlab-support-readiness/zendesk-global/salesforce-cases)
- [For the US Government Zendesks](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/salesforce-cases)

Both trigger the `bin/run` script, which does the following:

- Gathers the ticket information (including the organization, requester, and current assignee)
- Checks in Salesforce if an existing cases exists
  - If one does, it updates it with the information
  - If one does not, it creates a case
  - If multiple somehow exist, it exists with an error code of 1

When a case is created or updated, the following information is used to populate said case:

- Account ID
- Description
- Priority
- Status
- Subject
- Ticket assignee Name
- Ticket creation time
- Ticket form name
- Ticket ID
- Ticket organization name
- Ticket requester email
- Ticket requester name
- URL to the ticket
