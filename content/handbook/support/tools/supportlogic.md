---
title: SupportLogic
description: How GitLab Customer Support uses SupportLogic
---

[SupportLogic](https://www.supportlogic.com/) is a support experience management platform that uses
predictive and generative AI to help companies improve their customer support operations and
maximize revenue retention.

Currently, at GitLab we use SupportLogic for:

- Ticket notifications and alerts.
- Sentiment analysis.
- Identifying tickets that are likely to escalate.

We are still exploring and identifying other use cases for SupportLogic.

## Getting access

Access to SupportLogic can be requested using [Lumos](../../security/corporate/systems/lumos/_index.md). Refer to [Create an Access Request](../../security/corporate/systems/lumos/ar/_index.md#create-an-access-request).

## Getting started

Training to get started will be made available soon.

## Use cases

### Ticket notifications and alerts

{{% alert title="Applicable for" color="primary" %}}

- Support engineers
- Support managers

{{% /alert %}}

[My Alerts](https://gitlab.supportlogic.io/support/alerts) (GitLab SupportLogic) can be configured
to send notifications and alerts based on conditions you define. Some example use cases are:

- Notification when a new ticket is submitted by specific customers.

<details>
  <summary markdown="span">New ticket submitted alert configuration</summary>

The new ticket alert can be configured to notify you of new tickets submitted by specific customers.

To set up this alert:

1. Go to My Alerts in SupportLogic
1. Click on + New Alert
1. Select Standard Alert and press Create
1. Give the Alert a name by clicking on the pencil beside the default `Alert x` name. Choose an identifiable name that includes your name, as this alert will appear in the SHARED list visible to other Support Engineers when you configure Slack alerts or add additional recipients
1. Leave the Trigger configuration set to `all` conditions
1. Click on the **Ticket Events** Alert Condition and drag the `Created` condition into the box for the 1st trigger condition
1. Click on the **Customer** Alert Condition on the right hand side panel, search for and select the customer you want to monitor using their exact Zendesk organization name. You can select multiple customers for the same alert
1. In Notification Method, you can alert using email and/or Slack by selecting the option under **Notify the following recipients** and specify your Slack username and email. You can add other recipients for the alerts

NOTE: Notifications typically arrive 10-15 minutes after a ticket is created.

The following image shows the configuration.

![New ticket submitted alert configuration](/images/support/supportlogic-new-ticket-alert.png)

</details>

- Alerts when a customer uses profanity in a ticket assigned to one of your direct reports.
- Alert for tickets where the customer has responded and we have taken no action after 5 days

<details>
  <summary markdown="span">Stale NRT alert configuration</summary>

A "stale NRT" alert can be configured for any tickets where the customer has responded, 5 days have passed and we have not responded to them.

NOTE: The following instructions assume you have already set up appropriate virtual teams of Support Engineers in SupportLogic.

To set up this alert:

1. Go to My Alerts in SupportLogic
1. Click on + New Alert
1. Select Standard Alert and press Create
1. Give the Alert a name by clicking on the pencil beside the default `Alert x` name
1. Leave the Trigger configuration set to `all` conditions
1. Click on the Support Engineer Alert Condition on the right hand side panel and find your virtual team, or the virtual team you want to monitor. Click on that team and it will be added as condition 1
1. Click the Last Ticket Activity Alert Condition on the right hand side panel and select Inbound
1. Populate the `and was __ hours ago` section with 120 (this is 5 days)
1. Drag that condition into the box for the 2nd trigger condition
1. In Notification Method - we only have the ability to alert using email, so select Send alerts to me via Email
1. You can add additional recipients if desired
1. Choose whether you also want to alert the ticket owner (assignee) or not
1. The default Payload gives sufficient information in the email alert, but if you want to add additional details, you can add these

The following image shows the configuration.

![Stale NRT Alert configuration](/images/support/supportlogic-stale-nrt-alert.png)

</details>

- Alert for Escalated or Likely to escalate tickets

<details>
  <summary markdown="span">Escalation alert configuration</summary>

The escalation alert can be configured for any ticket that is already escalated or it is likely to.

NOTE: The following instructions assume you have already set up appropriate virtual teams of Support Engineers in SupportLogic.

To set up this alert:

1. Go to My Alerts in SupportLogic
1. Click on + New Alert
1. Select Standard Alert and press Create
1. Give the Alert a name by clicking on the pencil beside the default `Alert x` name
1. Leave the Trigger configuration set to `all` conditions
1. Click on the Support Engineer Alert Condition on the right hand side panel and find your virtual team, or the virtual team you want to monitor. Click on that team and it will be added as condition 1
1. Click the Likely to Escalate and the Escalated Escalation Activity on the right hand side panel and drag them to the left
1. Choose any of the Sentiments you would like to be alerted about (e.g Urgency, Critical Issue, CAll request, Confusion) from the right hand side and drag them to the left
1. In Notification Method - we only have the ability to alert using email, so select Send alerts to me via Email
1. You can add additional recipients if desired
1. Choose whether you also want to alert the ticket owner (assignee) or not
1. The default Payload gives sufficient information in the email alert, but if you want to add additional details, you can add these

The following image shows the configuration.

![Escalation Alert configuration](/images/support/escalation_alert_supportlogic.png)

</details>

SupportLogic KB: https://support.supportlogic.com/support/solutions/articles/73000566779-my-alerts

### Ticket sentiment analysis and management

{{% alert title="Applicable for" color="primary" %}}

- Support managers

{{% /alert %}}

The [Console](https://gitlab.supportlogic.io/support/console) (GitLab SupportLogic) provides an
overview of tickets highlighted by SupportLogic through sentiment analysis.

The [Backlog](https://gitlab.supportlogic.io/support/tickets) (GitLab SupportLogic) page helps with
ticket management by showing a list of tickets based on the filters you set.

### Tracking ticket escalations

{{% alert title="Applicable for" color="primary" %}}

- Support managers

{{% /alert %}}

SupportLogic offers an [Escalations Board](https://gitlab.supportlogic.io/support/escalations-board)
(GitLab SupportLogic) that tracks tickets which have been marked as:

- **Likely to Escalate**: Predicted by sentiment analysis as likely to lead to a customer escalation.
- **Escalation Request**: Customer has used language requesting for some form of escalation.
- **Active Escalation**: Tickets which have been [STARred](/handbook/support/internal-support/support-ticket-attention-requests/).
