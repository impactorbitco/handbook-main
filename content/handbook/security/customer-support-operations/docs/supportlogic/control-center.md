---
title: Control Center
description: Operations documentation page for SupportLogic Control Center
canonical_path: "/handbook/security/customer-support-operations/docs/supportlogic/control-center"
---

## Overview

The Control Center is the central administrative console in SupportLogic used to manage platform-wide settings. From here, administrators can configure user access, customize the user experience, manage data visibility, and integrate with external systems such as Zendesk and messaging platforms.

The Control Center is divided into two primary configuration categories: General Settings and Pages.

### General Settings

The General section provides foundational configuration tools that allow administrators to tailor the platform to organizational needs. Key capabilities include:

- Defining site-wide defaults, such as user interface `branding`, enabling `CRM writeback` and `in-app tooltips`
- Creating and managing `User Profiles` to control layout and feature visibility by user group
- Configuring `Scope` to restrict case visibility based on CRM (Zendesk) field values
- Enabling or disabling specific `Fields` for use in filters, views, and reports
- Setting `service level objectives (SLOs)`, including response and resolution time targets

### Pages

The Pages section allows administrators to customize the layout and functionality of specific pages within SupportLogic.

For a detailed overview of each setting and its purpose, refer to SupportLogic's documentation about [Control Center > Settings](https://support.supportlogic.com/support/solutions/articles/73000569815).

## Change Management

Changes within `Control Center > Settings` in SupportLogic are considered ad-hoc and take effect immediately after saving. Because these settings affect platform-wide functionality, it is strongly recommended to test all configuration changes in the SupportLogic Sandbox environment first (once available) before applying them to production.

All proposed changes must follow the [Customer Support Operations feature request process](/handbook/security/customer-support-operations/#feature-requests).
