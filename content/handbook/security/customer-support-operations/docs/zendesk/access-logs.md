---
title: Access logs
description: Operations documentation page for Zendesk access logs
canonical_path: "/handbook/security/customer-support-operations/docs/zendesk/access-logs"
---

## Monitored endpoints

For Zendesk Global (production), we send access log entries for specific endpoints to Devo.

This is done via the [Access logs](https://gitlab.com/gitlab-support-readiness/zendesk-global/access-logs) project.

This runs every 10 minutes using scheduled piplines and the data stored in the `data/endpoints.yaml` to keep track of what to monitor (and where it last checked).

Currently, the endpoints monitored are:

- `/admin/api/private/accounts/current/remote_authentications`
- `/admin/api/private/accounts/current/security_settings`
- `/admin/api/private/team_members`

### Looking at add more endpoints?

If you wish to request more endpoints are monitored, please file a [feature request issue](https://gitlab.com/gitlab-com/gl-security/corp/cust-support-ops/issue-tracker/-/issues/new?issuable_template=Feature) with the Customer Support Operations team.
