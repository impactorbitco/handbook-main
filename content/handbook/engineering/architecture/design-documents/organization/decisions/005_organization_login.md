---
owning-stage: "~devops::tenant scale"
title: 'Organizations ADR 005: Multi-Step Authentication Flow'
status: accepted
creation-date: "2025-08-06"
authors: [ "@ayufan" ]
---

## Context

GitLab currently uses a single-step authentication process where users enter both email/username and password on the same page. This approach has several limitations:

- No organization-specific branding or authentication policies
- Limited support for organization-specific authentication methods (SAML, custom IdPs)
- No routing based on user's organizational context
- All users authenticate through the same generic endpoint

Modern enterprise applications like Google Workspace, Slack, and Microsoft 365 use multi-step authentication flows that first identify the user's organization context, then route them to organization-specific authentication experiences. This enables branded login pages, organization-specific authentication methods, and better user experience.

With the introduction of Organizations in GitLab, we need to implement a similar pattern to support organization-specific authentication while maintaining backward compatibility for existing users.

## Decision

We will implement a multi-step authentication flow that separates user identification from authentication:

### Step 1: User Identification

- Users visit `gitlab.com/users/sign_in` and enter their email address
- The system uses the Topology Service to determine which organization the user belongs to
- Users are redirected to their organization-specific login page at `gitlab.com/o/<org-path>/users/sign_in`

### Step 2: Organization-Specific Authentication

- Users authenticate using organization-configured methods (password, SAML, etc.)
- Organization branding and specific authentication policies are applied
- If 2FA is required, it appears as a separate screen after primary authentication

### Backward Compatibility

- Username-based login continues to work on the legacy `/users/sign_in` page
- All existing OAuth and SAML callback paths are preserved
- Direct organization access via `gitlab.com/o/<org-path>/users/sign_in` is supported

### Email Uniqueness

- Each email address belongs to exactly one organization across all GitLab instances
- Email domains can be restricted to specific organizations
- The Topology Service provides deterministic routing based on email domain mapping

### Alternative Access

- Users can directly access organization login pages via `gitlab.com/o/<org-path>/users/sign_in`
- Private organizations redirect anonymous users to their login page
- Public organizations show their page immediately with sign-in options

## Consequences

### Positive Consequences

- **Organization Branding**: Organizations can provide branded login experiences with custom logos and styling
- **Flexible Authentication**: Organizations can configure specific authentication methods (SAML-only, password + 2FA, etc.)
- **Scalable Architecture**: Supports distributed cell architecture with organization-specific authentication policies

### Technical Consequences

- **Legacy Cell Compatibility**: The `/users/sign_in` page continues to be served by the Legacy Cell or any Cell at later point
- **Topology Service Integration**: Rails integration required for email classification and organization routing
- **Callback Preservation**: All existing OAuth (`/oauth/callback`) and SAML (`/groups/my-group/-/saml/callback`) callback paths remain unchanged
- **Username Support**: Username-based authentication continues to work for backward compatibility

## Alternatives

### Subdomain-Based Routing

We evaluated using subdomains like `acme.gitlab.com` for organization-specific login. This was rejected because:

- Complex DNS management and SSL certificate requirements
- Not compatible with all GitLab services (SSH, API endpoints)
- Would break existing integrations and bookmarks
- Difficult to implement across all deployment models (SaaS, Self-Managed, Dedicated)

## Implementation Notes

### URL Patterns

- Organization login: `gitlab.com/o/<org-path>/users/sign_in`
- Legacy login: `gitlab.com/users/sign_in` (unchanged)
- Organization pages: `gitlab.com/o/<org-path>` (private orgs redirect to login)

### Future Enhancements

- Custom alias domains: `gitlab.company.com` routing to organization pages
- Organization-scoped SAML callbacks: `gitlab.com/o/org-path/-/saml/callback`
- Enhanced organization branding and customization options
