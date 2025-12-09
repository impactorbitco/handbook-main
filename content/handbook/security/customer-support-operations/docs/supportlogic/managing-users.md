---
title: Managing Users
description: Operations documentation page for Managing Users in SupportLogic
canonical_path: "/handbook/security/customer-support-operations/docs/supportlogic/managing-users"
---

## Overview

Access to SupportLogic is automatically provisioned through Lumos. When a user’s access request gets approved, Lumos creates the user account in SupportLogic and assigns the base-level role (typically `Support Engineer` role).

**Note:**

Once [Issue #1932](https://gitlab.com/gitlab-com/gl-security/corp/issue-tracker/-/issues/1932) is completed, Lumos will support role and permission selection during the access request process. At that point, users will be able to specify their required role in the initial request, and Lumos will automatically assign it within SupportLogic.

If manual user creation is required (For example: when automated provisioning fails or for non-standard access scenarios), below are the steps to manually add a user in SupportLogic:

1. Go to `Control Center` → `Manage Users`
1. Click `+ Add User`
1. Enter the user's name and email address
1. Choose the appropriate `Role`
1. Click `Create`
