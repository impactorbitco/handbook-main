---
title: Field Configuration and Refresh
description: Operations documentation for SupportLogic field configuration and refresh
canonical_path: "/handbook/security/customer-support-operations/docs/supportlogic/field-configuration-and-refresh"
---

## Overview

Under `Control Center` > `Settings` > `Fields`, administrators can perform field configuration and refresh for both case or ticket fields and customer fields.

## Refreshing field values

SupportLogic synchronizes field values from Zendesk. When a new value is added to a Zendesk field or an existing field value changes, you may need to refresh the values in SupportLogic to maintain synchronization.

To refresh field values, navigate to `Control Center` > `Settings` > `Fields`. There are two refresh options available:

1. `Last Refresh` (all fields) - Refreshes all fields in the system automatically from top to bottom. Once all fields are refreshed, SupportLogic will display an updated table of field values from Zendesk. **Note:** Separate refresh required for Case fields and Customer fields.
2. `Refresh` (individual field) - Refreshes specific fields when you need to update only certain fields based on changes in Zendesk. Each field displays the timestamp indicating when it was last refreshed.

## Creating field value aliases

When field values from Zendesk should be consolidated for better usability in SupportLogic, you can create aliases to link multiple values together into a single display option. This is particularly useful when you have multiple similar values that serve the same functional purpose.

To create a field value alias:

1. Update the `Your Label` entry for all values you want to consolidate. SupportLogic will then display a bracket to the left of the linked field values to indicate they are aliased.
1. (optional) Manually re-order the list for optimal UI display.

## Configuring field display name

To customize how field names appear in the SupportLogic interface:

1. Navigate to `Control Center` > `Settings` > `Fields`
1. Locate the field you want to modify and hover over the field name to show the pencil icon
1. Click the pencil icon to open the field name editor
1. Enter the desired display name
1. Save the changes

Users will need to refresh their browser to see the updated field labels.

## Deleting/removing a field

To remove a field from the SupportLogic interface:

1. Navigate to `Control Center` > `Settings` > `Fields`
1. Locate the field you want to remove
1. Hover over the field row to show the `X` icon at the end of the line
1. Click the `X` to remove the field from the interface

**Important:** Once a field is removed, it only removes the field from the user interface. However, the data continues to be ingested from Zendesk and stored in SupportLogic. The field remains available for administrators to reconfigure and make visible again at any time.

## Mapping new fields and tags

To map new or additional Zendesk fields or tags into SupportLogic, contact `support@supportlogic.io` as this cannot be done in the `Control Center`.

## Change Management

Changes made to Fields are considered ad-hoc and take effect immediately after saving. Because these settings affect the entire platform, it is strongly recommended to:

- Test all configuration changes in the SupportLogic Sandbox environment (once it's available for use) before applying them to production.
- Consider the impact on both user experience and reporting results.
- Plan changes carefully as they affect Operational Metrics and quarterly reports.

All proposed changes must follow the [Customer Support Operations feature request process](/handbook/security/customer-support-operations/#feature-requests).
