---
title: Tier 2 Escalations
---

## Overview

Tier 2 on-call rotations provide specialized subject matter expertise during incident response. These teams serve as escalation points when incidents require domain-specific knowledge beyond the scope of the primary Engineer On Call (EOC).

## When to Escalate to Tier 2

Escalate to a Tier 2 team when:

- The incident requires deep domain expertise in a specific service
- The EOC has identified the problem area but needs specialized assistance
- Performance issues or outages are isolated to a specific subsystem

## How to Escalate

To page a Tier 2 team:

1. Use the `/inc escalate` command in Slack or click to escalate in the right sidebar of the incident UI
2. Select the appropriate team from the "Oncall team" dropdown menu
3. Provide a clear message describing the issue and what assistance is needed

## Available Tier 2 Rotations

### Gitaly

**Expertise Areas:**

- Git repository storage, access, and replication issues
- Gitaly service performance and node failures
- Repository corruption or data integrity concerns
- Git operations (clone, fetch, push) failures

**When to Escalate:**

- High error rates on Git operations
- Repository access failures affecting multiple projects
- Gitaly node or cluster issues

**Coverage:** 24x5 (Monday-Friday, business hours)

---

### Database Operations (DBO)

**Expertise Areas:**

- PostgreSQL performance, replication, and failover
- Query performance issues, deadlocks, and connection pool problems
- Database migrations blocking deployments
- PgBouncer and database capacity issues

**When to Escalate:**

- Database performance degradation or replication lag
- Failed migrations blocking deployments
- Connection pool saturation
- Slow queries impacting application performance

**Coverage:** Best Effort - 24x5 (Monday-Friday)

---

### AI

**Expertise Areas:**

- AI Gateway and Duo feature availability
- Model serving infrastructure and AI feature performance
- Token usage, rate limiting, and AI provider integrations

**When to Escalate:**

- AI features unavailable or degraded
- High error rates from AI services
- Model serving or AI Gateway connectivity issues

**Coverage:** 24x5 (Monday-Friday, business hours)

---

### DevOps

DevOps is the name given to a group of features that are part of the Rails monolith.
They should be contacted when assistance is needed with one of the features below.

**Teams represented in DevOps Tier 2 on Call:**

CI Platform, Code Review, Container Registry, Environments, Import, Knowledge, Package Registry,Pipeline Authoring, Pipeline Execution, Product Planning, Project Management, Source Code

**Categories/Services represented in DevOps Tier 2 oncall:**

Fleet Visibility, Design Management, Environments, Deployments, Release Management, Importers, Migration, Direct Transfer, Package Registry, Virtual Registry, Dependency Proxy for Containers, Product Planning, Portfolio Management, Requirements Management, Project Management, Issue Tracking, Work Items, Boards, Workspaces, Source Code Management, Repository Management, Protected Branches, Workspaces Rails code, Container Registry Rails Code

**When to Escalate:**

Please do not escalate for general Rails concerns.

- Application-level errors (500s, 422s) with cause inside of one of these features.
- Sidekiq queue backlogs or processing failures where the worker is the responsibility of this group.
- Memory issues in Rails processes originating from this group.
- Application deployment failures requiring rollback where the failure is linked to a feature in this group.

**Coverage:** 24x5 (Monday-Friday, business hours)
*Note: APAC coverage utilizes IMOC rotation during APAC hours*

---

### Runners Platform

**Expertise Areas:**

- Runner platform infrastructure and SaaS runner managers
- Job execution issues related to runners (provisioning, startup, teardown)
- Runner registration, capacity, and scheduling concerns
- Runner manager service performance and connectivity

**When to Escalate:**

- Incidents impacting job execution attributable to runners or runner managers
- Widespread runner provisioning failures, hangs, or unexpected timeouts
- Capacity shortfalls or saturation in runner managers affecting customers
- Repeated job failures suspected to be caused by runner platform issues

**Coverage:** Best Effort - 24x5 (Monday-Friday)

---

### Fulfillment

**Expertise Areas:**

- CustomersDot application and purchasing infrastructure
- Subscription management, billing, and provisioning systems
- Usage billing flows and consumption-based pricing
- License generation and validation
- Zuora integration and order processing
- Customer portal and self-service workflows

**When to Escalate:**

- CustomersDot outages or critical errors affecting purchases
- Subscription provisioning or license generation failures
- Billing system integration issues impacting customers
- High error rates in purchase or subscription workflows

**Coverage:** 24x5 (Monday-Friday, business hours)

---

## Coverage Expectations

- **24x5 Coverage**: Monday 00:00 UTC through Friday 23:59 UTC
- **Response SLA**: 15 minutes during coverage hours
- **Weekend/Holiday Coverage**: Critical escalations go to IMOC and Infrastructure Leadership

## Related Pages

- [Incident Management](/handbook/engineering/infrastructure/incident-management/)
- [Tier 2 On-Call](/handbook/engineering/infrastructure/incident-management/on-call/tier-2.md)
