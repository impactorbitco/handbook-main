---
title: Roles and Permissions
description: Operations documentation for SupportLogic's Roles and Permissions
canonical_path: "/handbook/security/customer-support-operations/docs/supportlogic/roles-and-permissions"
---

## Overview

SupportLogic offers two ways to control what users can see and do in the platform:

1. `Roles & Permissions`: Define what actions a user is allowed to perform (For example: creating an alert, ML training, sentiment acknowledgement). For a full list of available permissions and their descriptions, refer to the [Role-Based Permissions Guide](https://support.supportlogic.com/support/solutions/articles/73000644606).

1. `User Profiles`: Control which modules, tabs, and visual dashboards are visible in the interface.

Both areas can be configured under `Settings` → `Control Center` and can be used together to ensure users have only the access they need.

## Creating a role

1. Go to `Control Center` → `Settings` → `Roles and Permissions`
1. Click `+ Add Role`
1. Define the following:
   - Role name and description
   - `Scope` (optional): Select CRM/Ticket field(s) (Example: Ticket Status) to limit which cases users with this role can access.
   - `Scope Ticket Owner` (optional): Restricts a user's access to only the cases where they are listed as the owner in the CRM system.
   - `Permissions`: Check the boxes for what the role should be able to do.
1. Click `Save`

## Editing a role

1. Navigate to `Control Center` → `Settings` → `Roles and Permissions`
1. Click the dropdown list next to the name of the `Role` you want to modify and select `Edit Role`
1. Modify the role name, scope, ticket owner visibility, and permissions as needed.
1. Save your changes

## Restricting access using `User Profiles`

To restrict access using `User Profiles`, go to `Control Center` → `Settings` → `User Profiles`.From there, you can create a new user profile or edit the user profile for each role. Alternatively, `User Profiles` can be modified at a role level through `Control Center`> `Settings` >`Roles & Permissions` then click the dropdown list next to the name of the `Role` you want to modify and select `Edit layout`.

A full step-by-step guide can be found in [SupportLogic User Profiles](https://support.supportlogic.com/support/solutions/articles/73000645076).

## Current Roles and Permissions in use

| Permission | Admin | Support Manager | Support Engineer |
|------------|-------|-----------------|------------------|
| **Accounts** |  |  |  |
| Edit Customer | ✓ | - | - |
| Create Virtual Accounts | ✓ | ✓ | ✓ |
| Delete Virtual Accounts | ✓ | ✓ | - |
| Health Score | ✓ | ✓ | ✓ |
| **Support Engineers** |  |  |  |
| Support Engineer Performance | ✓ | ✓ | - |
| Create Virtual Teams | ✓ | ✓ | - |
| Delete Virtual Teams | ✓ | ✓ | - |
| Manage Agent Skills | ✓ | ✓ | - |
| Manage Agent Capacity Limits | ✓ | ✓ | - |
| OOO events | ✓ | ✓ | ✓ |
| **Alerts** |  |  |  |
| Personal Alerts | ✓ | ✓ | ✓ |
| Shared Alerts | ✓ | ✓ | ✓ |
| **Alerts 2.0** |  |  |  |
| Create Subscriptions | ✓ | - | - |
| Manage Subscriptions | ✓ | - | - |
| **Ticket** |  |  |  |
| Manage Events | ✓ | ✓ | - |
| Edit Ticket | ✓ | ✓ | - |
| **Ticket assignment** |  |  |  |
| Manage Shifts | ✓ | ✓ | - |
| **Ticket evaluation** |  |  |  |
| Ticket Evaluation Criteria | ✓ | - | - |
| Completed Ticket Reviews | ✓ | - | - |
| Ticket Review | ✓ | - | - |
| **Escalations** |  |  |  |
| Manage Escalations | ✓ | ✓ | - |
| **AI** |  |  |  |
| Enable Gen AI upon case opening | - | - | - |
| Knowledge Search | - | - | - |
| **ML** |  |  |  |
| Train ML | ✓ | ✓ | - |
| Customize Labels | ✓ | ✓ | - |
| Acknowledge Sentiment | ✓ | ✓ | - |
| **Settings** |  |  |  |
| Settings | ✓ | - | - |
| View User Engagement | ✓ | - | - |
| View Usage & Billing | ✓ | - | - |
| **User** |  |  |  |
| Create/Edit User Profiles | ✓ | - | - |
| Add/Remove Users | ✓ | - | - |
| View as other user | ✓ | - | - |

## Change Management

Changes to `Roles & Permissions` and `User Profiles` in SupportLogic are considered ad-hoc. These updates are made directly within the platform and take effect immediately after saving. Always review changes thoroughly before applying them to prevent unintended access or visibility issues.

Any request to modify roles, permissions, or user profiles must follow the process outlined in the [Customer Support Operations handbook](/handbook/security/customer-support-operations/#feature-requests).
