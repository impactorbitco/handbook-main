---
title: Organizations - Authentication - OpenID/OAuth Client
status: proposed
creation-date: "2025-08-12"
authors: [ "@skundapur" ]
coaches: [ "@ayufan" ]
dris: [ ]
owning-stage: "~devops::tenant scale"
participating-stages: ["~devops::software_supply_chain_security"]
# Hides this page in the left sidebar. Recommended so we don't pollute it.
toc_hide: true
---


{{< engineering/design-document-header >}}

## Summary

This design details how the authentication flow where GitLab acts as the OpenID/OAuth client will work with organizations.

## Motivation

With the introduction of the [Cells Architecture](../cells/_index.md) and the [Organizations](../_index.md), all features
that work at an instance level need to be adapted to be compatible with the new architecture.
Authentication is a key impacted area as several flows currently work instance-wide.

The aim of this proposal is to provide details on how the GitLab as OpenID/OAuth client flow works.

### Goals

- Define how the GitLab as an OpenID/OAuth client flow works in conjunction with Cells and Organizations.
- Specify how routing of requests will work.
- Ensure backward compatibility with no breaking changes for customers.

### Current State

Gitlab.com currently supports login with 4 OAuth providers (Google, Github, Bitbucket and Salesforce) and [self-managed GitLab](https://docs.gitlab.com/integration/omniauth/)
supports a lot more providers, both using [OmniAuth](https://github.com/omniauth/omniauth) as the base.

<details>
<summary>Current OAuth Client Flow - Sequence Diagram</summary>

~~~mermaid
sequenceDiagram
    participant User
    participant Browser
    participant GitLab as GitLab Rails
    participant DB as GitLab Postgres Database
    participant Google as Google OAuth Provider

    Note over User, Google: OpenID Connect Authorization Code Flow with Google as the OpenID provider

    User->>Browser: Navigate to GitLab Login page
    Browser->>GitLab: Request GitLab Login Page
    GitLab->>Browser: Present GitLab Login page
    Browser->>User: Display GitLab Login page

    Note over User, Google: User chooses Login with Google
    User->>Browser: Click on Login with Google
    Browser->>GitLab: Request Login with Google
    note right of Browser: POST https://gitlab.com/users/auth/google_oauth2
    GitLab->>GitLab: Generate OAuth authorization request
    Note right of GitLab: Omniauth builds authorization URL with:<br/>• client_id<br/>• response_type=code<br/>• scope=profile email<br/>• redirect_uri=/auth/google_oauth2/callback<br/>• state (CSRF protection)<br/>• access_type=offline (for refresh token)
    GitLab->>Browser: Redirect to Google authorization endpoint
    Note right of GitLab: HTTP 302 to Google OAuth URL<br/>https://accounts.google.com/oauth/authorize<br/>?client_id=...&scope=profile+email&response_type=code<br/>&redirect_uri=...&state=...&access_type=offline
    Browser->>Google: Request Google authorization endpoint
    Google->>Google: Validate authorization request
    Note left of Google: • Verify client_id<br/>• Validate redirect_uri against registered URIs<br/>• Check requested scopes<br/>• Validate state parameter format
    Google->>Google: Authenticate user, check for Consent
    Google->>Browser: Redirect to GitLab with authorization code
    Browser->>GitLab: Submit authorization code to GitLab
    Note right of Browser: GET /auth/google_oauth2/callback<br/>?code=AUTH_CODE&state=STATE_VALUE<br/>(NO user data available yet)
    GitLab->>GitLab: Validate request
    GitLab->>Google: Exchange code for access token
    Google->>GitLab: Return access token
    GitLab->>Google: Get user profile information
    Google->>GitLab: Validate access token and return user profile data

    Note over GitLab, DB: User Provisioning & Session Creation

    GitLab->>GitLab: Create Omniauth auth hash
    Note right of GitLab: Build standardized auth hash:<br/>• provider: "google_oauth2"<br/>• uid: "google-user-id-123"<br/>• info: {name, email, image}<br/>• credentials: {token, expires_at}<br/>• extra: {raw_info} - handled by OmniAuth
    GitLab->>DB: Lookup user by email or identity in the `identities` table
    alt User exists without linked Google identity
        GitLab->>DB: Get user from the users table
        GitLab->>DB: Link user to Google indentity - Insert into identities
    else User does not exist
        GitLab->>DB: Insert into users
        GitLab->>DB: Insert into identities
    end
    GitLab->>GitLab: Create Rails session
    GitLab->>Browser: Redirect to intended destination
    Note right of GitLab: HTTP 302 to originally requested resource<br/>or default dashboard
~~~

</details>

## Proposal

The OAuth client flow can be adapted quite easily if we leverage the new [multi-step authentication](login.md#new-multi-step-authentication-system)
system and display the `Login with ...` options after the user has provided their email address. However, this does mean
a slightly degraded user experience, when compared to other providers such as Slack.

### Key Changes

- GitLab's "Step 1" Login page only displays an email input field
- User is redirected to the org-specific Login page after they provide the email, where they can select `Login with` a provider
- The user owning cell handles the entire OAuth flow
- The organization id is embedded in the `state` parameter as a part of the OAuth authorization request
- The router decodes the `state` parameter and routes the callback request to the correct cell
- The decision on whether this user experience is acceptable should be taken along with Product

### Proposed Flow - Sequence Diagram

<details>
<summary>Login with Google after Email is provided</summary>

~~~mermaid
sequenceDiagram
    participant Browser as User/Browser
    participant Router as HTTP Router
    participant Cell0 as Legacy Cell
    participant TS as Topology Service
    participant Cell1 as User Owning Cell
    participant DB as GitLab Postgres Database
    participant Google as Google OAuth Provider

    Note over Browser, Google: OpenID Connect Authorization Code Flow with Google as the OpenID provider
    Note over Browser, TS: User navigates to global GitLab Login page

    Browser->>Router: Request GitLab Login page
    Router->>Cell0: Request GitLab Login page
    Cell0->>Router: Present email input page without OAuth login options
    Router->>Browser: Display email input page
    Browser->>Router: Enter email
    Router->>Cell0: Submit email
    Cell0->>TS: Classify email
    TS->>Cell0: Org info for email
    Cell0->>Router: Redirect to org-specific GitLab Login page
    note right of Router: Pass email as query param in URL
    Router->>Browser: Redirect to org-specific GitLab Login page

    Note over Browser, Google: User navigates to org-specific GitLab Login page

    Browser->>Router: Request org-specific GitLab Login page
    Router->>Cell1: Request org-specific GitLab Login page
    rect rgb(255, 255, 153)
      note right of Router: Routing based on org-path in URL
    end
    Cell1->>Router: Present org-specific GitLab Login page with email pre-filled
    Router->>Browser: Display org-specific GitLab Login page with email pre-filled

    Note over Browser, Google: User chooses Login with Google
    Browser->>Browser: Click on Login with Google
    Browser->>Router: Request Login with Google
    note right of Browser: POST https://gitlab.com/o/org-path/users/auth/google_oauth2?login_hint=...
    Router->>Cell1: Request Login with Google
    rect rgb(255, 255, 153)
      note right of Router: Routing based on org-path in URL
    end
    Cell1->>Cell1: Generate OAuth authorization request
    Note right of Cell1: Omniauth builds authorization URL with:<br/>• client_id<br/>• response_type=code<br/>• scope=profile email<br/>• redirect_uri=o/org-path/auth/google_oauth2/callback<br/>• state (CSRF protection)<br/>• login_hint=emmail
    Note right of Cell1: Add org-id to the state parameter
    Cell1->>Browser: Redirect to Google authorization endpoint
    Note right of Cell1: HTTP 302 to Google OAuth URL<br/>https://accounts.google.com/oauth/authorize<br/>?client_id=...&scope=profile+email&response_type=code<br/>&redirect_uri=...&state=...&login_hint=emmail
    Browser->>Google: Request Google authorization endpoint
    Google->>Google: Validate authorization request
    Note left of Google: • Verify client_id<br/>• Validate redirect_uri against registered URIs<br/>• Check requested scopes
    Google->>Google: Authenticate user, check for Consent
    Google->>Browser: Redirect to GitLab with authorization code
    Browser->>Router: Submit authorization code to GitLab
    Note right of Browser: GET o/org-path/auth/google_oauth2/callback<br/>?code=AUTH_CODE&state=STATE_VALUE<br/>(NO user data available yet)
    Router->>Cell1: Submit authorization code to GitLab
    rect rgb(255, 255, 153)
      note right of Router: Routing based on org-id in state parameter
    end
    Cell1->>Cell1: Validate request
    Cell1->>Google: Exchange code for access token
    Google->>Cell1: Return access token
    Cell1->>Google: Get user profile information
    Google->>Cell1: Validate access token and return user profile data

    Note over Cell1, DB: User Provisioning & Session Creation

    Cell1->>Cell1: Create Omniauth auth hash
    Note right of Cell1: Build standardized auth hash:<br/>• provider: "google_oauth2"<br/>• uid: "google-user-id-123"<br/>• info: {name, email, image}<br/>• credentials: {token, expires_at}<br/>• extra: {raw_info} - handled by OmniAuth
    Cell1->>DB: Lookup user by email or identity in the `identities` table
    alt User exists without linked Google identity
        Cell1->>DB: Get user from the users table
        Cell1->>DB: Link user to Google indentity - Insert into identities
    else User does not exist
        Cell1->>DB: Insert into users
        Cell1->>DB: Insert into identities
    end
    Cell1->>Cell1: Create Rails session
    Cell1->>Router: Redirect to intended destination
    Note right of Cell1: HTTP 302 to originally requested resource<br/>or default dashboard
    Router->>Browser: Redirect to intended destination
~~~

</details>

### Alternative Flow

To provide a better user experience more in line with other providers such as Slack, we need to display the
`Login with ...` options on the global GitLab Login page. This means that the OAuth flow is handled entirely by the
legacy cell, until the user information is available. After this point, the legacy cell transfers the information to the
user owning cell.

We could leverage the SAML IDP initiated flow for this purpose.
The legacy cell would behave as the SAML IDP and use an IDP initiated login flow with the user owning cell, which acts
as the SAML SP.

### Key Changes - Alternative Flow

- GitLab's "Step 1" Login page displays the `Login with ...` options
- The legacy cell handles the entire OAuth flow
- Once the user information is available, the legacy cell invokes the Topology service to identify the user owning cell
- The legacy cell initiates an IDP initiated SAML login flow with user owning cell
- It posts a SAML response with the user email and external identity information embedded as SAML attributes to the org
specific SAML login endpoint
- The user owning cell handles this request and establishes a session for the user

### Proposed Alternative Flow - Sequence Diagram

<details>
<summary>Login with Google on global Login page</summary>

~~~mermaid
sequenceDiagram
    participant Browser as User/Browser
    participant Router as HTTP Router
    participant Cell0 as Legacy Cell
    participant Cell0_DB as Legacy Cell Database
    participant TS as Topology Service
    participant Google as Google OAuth Provider
    participant Cell1 as User Owning Cell
    participant DB as User Owning Cell Database

    Note over Browser, DB: OpenID Connect Authorization Code Flow with Google as the OpenID provider

    Browser->>Router: Request GitLab Login page
    Router->>Cell0: Request GitLab Login page
    Cell0->>Router: Present email input page with OAuth login options
    Router->>Browser: Display email input page with OAuth login options
    Browser->>Browser: Click on Login with Google
    Browser->>Router: Request Login with Google
    note right of Browser: POST https://gitlab.com/users/auth/google_oauth2
    Router->>Cell0: Request Login with Google
    Cell0->>Cell0: Generate OAuth authorization request
    Note right of Cell0: Omniauth builds authorization URL with:<br/>• client_id<br/>• response_type=code<br/>• scope=profile email<br/>• redirect_uri=/auth/google_oauth2/callback<br/>• state (CSRF protection)<br/>
    Cell0->>Browser: Redirect to Google authorization endpoint
    Note right of Cell0: HTTP 302 to Google OAuth URL<br/>https://accounts.google.com/oauth/authorize<br/>?client_id=...&scope=profile+email&response_type=code<br/>&redirect_uri=...&state=...
    Browser->>Google: Request Google authorization endpoint
    Google->>Google: Validate authorization request
    Note left of Google: • Verify client_id<br/>• Validate redirect_uri against registered URIs<br/>• Check requested scopes
    Google->>Google: Authenticate user, check for Consent
    Google->>Browser: Redirect to GitLab with authorization code
    Browser->>Router: Submit authorization code to GitLab
    Note right of Browser: GET /auth/google_oauth2/callback<br/>?code=AUTH_CODE&state=STATE_VALUE<br/>(NO user data available yet)
    Router->>Cell0: Submit authorization code to GitLab
    Cell0->>Cell0: Validate request
    Cell0->>Google: Exchange code for access token
    Google->>Cell0: Return access token
    Cell0->>Google: Get user profile information
    Google->>Cell0: Validate access token and return user profile data
    Cell0->>Cell0: Create Omniauth auth hash
    Note right of Cell0: Build standardized auth hash:<br/>• provider: "google_oauth2"<br/>• uid: "google-user-id-123"<br/>• info: {name, email, image}<br/>• credentials: {token, expires_at}<br/>• extra: {raw_info} - handled by OmniAuth
    Cell0->>Cell0_DB: Lookup user by email or identity in the `identities` table

    Note over Browser, DB: User not found in Legacy Cell

    Cell0->>TS: Lookup user by email in TS
    TS->>Cell0: Provide org-info for email
    Cell0->>Router: Post to org-specific IDP initiated SAML login page
    note left of Cell0: POST /o/org-path/auth/saml/callback<br/>Generate SAMLResponse with <br/> email and Google identity attributes
    Router->>Cell1: Submit request to org-specific IDP initiated SAML login page
    rect rgb(255, 255, 153)
      note right of Router: Routing based on org-path in URL
    end

    Note over Cell1, DB: User Provisioning & Session Creation
    Cell1->>Cell1: Decode and validate SAML response
    Cell1->>Cell1: Extract user attributes
    Cell1->>DB: Lookup user by email or identity in the `identities` table
    alt User exists without linked Google identity
        Cell1->>DB: Get user from the users table
        Cell1->>DB: Link user to Google indentity - Insert into identities
    else User does not exist
        Cell1->>DB: Insert into users
        Cell1->>DB: Insert into identities
    end
    Cell1->>Cell1: Create Rails session
    Cell1->>Router: Redirect to intended destination
    Note right of Cell1: HTTP 302 to originally requested resource<br/>or default dashboard
    Router->>Browser: Redirect to intended destination
~~~

</details>
