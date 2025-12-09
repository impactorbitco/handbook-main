---
title: "Product Security Risk Register"
aliases:
  - "/handbook/security/product-security/risk-register/"
description: "The Product Security Risk Register (PSRR) is driven by and follows the STORM process from our Security Risk Team."
---

The Product Security Risk Register (PSRR) is a centralized framework for identifying, evaluating, prioritizing, mitigating, and monitoring systemic security risks in GitLab's product.  PSRR is driven by and follows the [STORM process](/handbook/security/security-assurance/security-risk/storm-program/) and [Unified Security Risk Management (USRM)](/handbook/security/security-observations-risk-management/) methodology from our [Security Risk Team](/handbook/security/security-assurance/security-risk/).

## Objectives

The PSRR reduces product security risk through:

- **Informed Prioritization**: Leverage evidence from incidents, vulnerabilities, and operational data to enable strategic investment decisions aligned with business objectives.
- **Cross-Functional Collaboration**: Coordinate Security, Engineering, and Product teams to ensure appropriate resources for systemic risk mitigation.
- **Measurable Outcomes**: Track risk treatment progress through KRIs that demonstrate impact and enable continuous improvement.
- **Enterprise Integration**: Provide product security risk intelligence to [STORM](/handbook/security/security-assurance/security-risk/storm-program/) and [USRM](/handbook/security/security-observations-risk-management/) for enterprise-level escalation and visibility.

## Scope

The PSRR tracks systemic weaknesses, inadequate design choices, or functional logic that expose GitLab's product to compromise and data leaks, focusing on risks with cascading consequences across the platform.

**In Scope:**

- Systemic risks requiring cross-team collaboration, architectural changes, or feature development
- Risks with recurring incidents or vulnerabilities (≥5 events in 2 years)
- Security operations or product development process gaps that enable recurring vulnerabilities, incidents, or have customer-facing security impact

**Out of Scope:**

- Specific vulnerabilities (CVEs)
- Individual compliance observations
- Feature requests from security team not associated with a specific risk

## PSRR Issues and Dashboard

You can find this list in the [STORM repository](https://gitlab.com/gitlab-com/gl-security/security-assurance/security-risk-team/storm-risk-register/-/issues/?sort=created_date&state=opened&label_name%5B%5D=Department%3A%3AProduct%20Security&first_page_size=20) (internal), or [consult the dashboard here](https://gitlab.com/gitlab-com/gl-security/security-assurance/security-risk-team/storm-risk-register/-/boards/7816349?label_name[]=Department%3A%3AProduct%20Security) (internal).

To create a new issue follow this [link](https://gitlab.com/gitlab-com/gl-security/security-assurance/security-risk-team/storm-risk-register/-/issues/new?issuable_template=ProdSec%20StORM%20Risk%20Template) (internal). Make sure to reference the [guide to defining well-articulated risks](/handbook/security/product-security/security-platforms-architecture/risk-register/well-articulated-prodsec-risks).

## Roles and Responsibilities

PSRR follows the [USRM roles and Authority Matrix](/handbook/security/security-observations-risk-management/#authority-matrix). The two key roles for PSRR risks are:

| Role | Responsibility |
|------|----------------|
| **Business risk owner** | Accountable for the overall risk related to the finding. Can make decisions on whether to remediate or accept the risk. Required approval level per USRM Authority Matrix. |
| **Security risk owner** | Security team member accountable for validating the risk treatment plan and implementing risk monitoring. |

### PSRR-Specific Responsibilities

The SPA team is additionally responsible for these activities:

- Initial risk assessment, validation, and scoring
- Tracking risks through the PSRR lifecycle
- Conducting monthly reviews with Engineering and Security leadership.
- Coordinating STORM alignment and escalation

## PSRR Workflow

PSRR follows the USRM workflow with product security-specific stages:

| Stage | Entry Criteria | Key Activities | Exit Criteria |
|-------|---------------|----------------|---------------|
| **Identified** | Risk discovered through assessment, incident, or escalation | - Score risk using STORM methodology<br> - Apply risk rating and scope labels <br>- Identify Business risk owner and Security risk owner | Risk scored with owner identified |
| **Treatment plan defined** | Business risk owner acknowledged risk | - Select risk response <br>- Define KRIs and milestones<br>- Set target dates<br>- Obtain approvals (if needed)<br>- Apply health labels | Treatment plan approved with dates |
| **In progress** | Treatment plan approved, resources allocated | - Execute treatment activities <br>- Onboard Technical Program Manager (if needed) <br>- Hold regular syncs<br>- Update health labels based on progress | Remediation activities completed |
| **Blocked** | Work stopped due to dependency | - Document blocker in issue<br>- Escalate to remove blocker<br>- Update health-treatment label<br>- Set target unblock date | Blocker label removed |
| **Monitored** | Risk response is "Monitor" - no active remediation planned | - Track KRIs monthly<br>- Review risk score quarterly<br>- Assess for priority changes<br>- Update if new incidents occur | Risk priority increases OR risk accepted/closed |
| **Risk accepted** | Formal acceptance process | - Follow USRM risk acceptance procedure<br>- Set periodic review per USRM schedule<br>- Monitor for changes | Acceptance recorded, review scheduled |
| **Closed** | Remediation validated or risk eliminated | - Security risk owner validates effectiveness<br>- Document outcome<br>- Close issue | Risk within tolerance or eliminated |

## PSRR Risk Scoring

PSRR follows [STORM risk scoring methodology](/handbook/security/security-assurance/security-risk/storm-program/#risk-factors-and-risk-scoring) (Likelihood × Impact) with evidence-based adjustments using real-world data.

### Base Scoring

Start with STORM's qualitative assessment:

- **Likelihood** (1-6): Difficulty of initiating a threat event
- **Impact** (1-5): Effect on organizational objectives if event occurs

### Evidence-Based Adjustments

Evidence is collected from related security events within the past **2 years**:

- Related HackerOne reports (any severity)
- Related SIRT incidents (any severity)
- Related compliance observations

**Note:** Evidence from only one source is sufficient - the scoring methodology accounts for incomplete data across sources.

#### Likelihood Adjustment (Count-Based)

Count total evidence items across all severities:

- HackerOne reports
- SIRT incidents
- Compliance observations
- Vulnerabilities

| Total Count | Modifier |
|------------|----------|
| ≥10 items | +2 |
| ≥5 items | +1 |
| 1-4 items | 0 |
| 0 items | -1 |

**Application:** `final_likelihood = max(1, min(6, base_likelihood + modified))`

#### Impact Adjustment (Severity-Weighted)

Calculate weighted score using severity-based points:

- HackerOne and vulnerabilities `severity::1`: 3 points each
- HackerOne and vulnerabilities `severity::2`: 2 points each
- SIRT S1: 3 points each
- SIRT S2: 2 points each
- Observations Critical: 3 points each
- Observations High: 2 point each

| Weighted Score | Modifier |
|---------------|----------|
| ≥10 points | +2 |
| ≥5 items | +1 |
| 1-4 points | 0 |
| 0 points | -1 |

**Application:** `final_impact = max(1, min(5, base_impact + impact_mod))`

### Final Risk Score

`Risk Score = final_likelihood × final_impact`

This score (1-30) determines the `RiskRating::` and `psrr-risk-rating::` labels applied during the `prioritised` stage.

Manual validation of evidence and base score is applied if evidence-based modifiers and base scoring appear contradictory (for example, base likelihood=1 but ≥5 incidents, or base impact=1 but weighted score ≥10).

## Key Risk Indicators (KRIs)

Key Risk Indicators are measurable metrics that track whether a risk is increasing, decreasing, or stable over time. KRIs are defined during the `treatment-plan-defined` stage and tracked throughout the risk lifecycle.

KRIs are reviewed during monthly PSRR reviews, see health KRI definitions.

### Quick Decision Guide: Which KRI Type to Use?

| Your Situation | Primary KRI | Example Metrics | Thresholds |
|----------------|----------|-----------------|------------|
| **"New risk, zero incidents"** | **Implementation:** Measure control adoption (Leading) | **Control:** 45% of images with SLSA provenance<br>**Exposure:** 550 images without attestation<br>**Trend:** +50 unprotected images this quarter | **Green:** Coverage ≥95% OR trending down ≥20%/quarter<br>**Yellow:** Coverage 75-94% OR flat<br>**Red:** Coverage <75% OR increasing |
| **"High incident frequency (≥5/quarter)"** | **Effectiveness:** <br>Incidents (Lagging) + Predictive (Bayesian) | **Historical:** 30 leaks in 6 months, avg 500 unscoped secrets<br>**Current:** 650 unscoped secrets<br>**Predicted:** 6.5 leaks this month<br>**Actual:** 5 leaks last month | **Green:** Predicted ≤ baseline AND incidents decreasing<br>**Yellow:** Predicted 1.5-2x baseline<br>**Red:** Predicted >2x baseline |
| **"Rare but severe attack"** | **Implementation:** <br>Measure exposure (Leading) | **Exposure:** 23% of traffic on HTTP/1 protocol<br>**Critical:** 2 authentication endpoints on HTTP/1<br>**Trend:** -5% reduction from last quarter | **Green:** Trending down ≥20%/quarter<br>**Yellow:** Flat or <20% decrease<br>**Red:** Increasing |
| **"I don't have inventory"** | **Define alternative collection:**<br>Sampling or Experimentation | **Sampling:** Audit 10% of repos (50 of 500) for exposed secrets → 8% found secrets<br>**Experimentation:** Red team test of 5 critical endpoints → 2 bypassable | **Green:** Sample shows <5% issues<br>**Yellow:** Sample shows 5-15% issues<br>**Red:** Sample shows >15% issues |

**Note:** Most risks should use multiple KRI types.

**When observation is impossible or insufficient:**

**Sampling** - Analyze representative subset:

- Random sampling: Equal probability selection. Example: test 10% of container images
- Stratified sampling: Sample from each category Example: 5 repos per engineering team
- **Use when**: Large populations, resource constraints, lack of baseline or inventory

**Experimentation** - Controlled tests to measure risk exposure:

- Red team exercises: Simulate real-world attacks
- Security audits: Manual review of configurations
- Penetration tests: Validate control effectiveness
- **Use when**: No historical incidents, need to validate assumptions

## Risk Closure Criteria

A PSRR risk may be closed when **all** of the following are met:

1. **Risk Score Within Tolerance**

   - Final risk score ≤ Risk tolerance threshold
   - Reassessment shows sustained reduction (not temporary)

2. **KRI Targets Achieved**

   - Implementation KRIs: Control coverage meets minimum thresholds (typically ≥95%)
   - Effectiveness KRIs: Incident rates demonstrate sustained reduction (90+ days below baseline)
   - Efficiency KRIs: Response times meet SLA targets

3. **Security risk owner Validation**

   - Reviews all remediation evidence
   - Confirms controls are operating effectively
   - Validates that root cause has been addressed
   - Treatment outcomes documented
   - Documents closure rationale in issue

## PSRR Label Schema

PSRR extends USRM labels with product security-specific labels for risk categorization, scoring, workflow tracking, and health monitoring.

### Required Labels

#### Risk Rating (from STORM)

- `RiskRating::Critical` - Score 26-30
- `RiskRating::High` - Score 21-25
- `RiskRating::Medium` - Score 11-20
- `RiskRating::Low` - Score 1-10

#### PSRR Risk Score (numeric)

- `psrr-risk-rating::<number>` - Any score from 1-30 (such as `psrr-risk-rating::25`)

#### PSRR Scope (risk category)

- `psrr-scope::<category>` - Examples: `product-authnz`, `infrastructure`, `supply-chain`, `secrets-management`, `operational`

#### PSRR Owners

- `Department::<group>|<section>|Engineering` - Department following [product categories](/handbook/product/categories/features/)
- `Division::<team>` - Security division based on [security team structure](/handbook/security/)

#### Workflow and status

Refer to [USRM labels](/handbook/security/security-observations-risk-management/#usrm-label-reference)

#### Health Indicators

All three health labels are required for each PSRR risk:

| Health Domain | Labels | Red | Yellow | Green |
|---------------|--------|-----|--------|-------|
| Owner | `health-owner::red\|yellow\|green` | No Business risk owner assigned | Assigned but inactive/needs replacement | Regular syncs (≥quarterly) |
| Treatment Plan | `health-treatment::red\|yellow\|green` | No treatment plan or missing dates | Defined but delayed >1 quarter | On track, delays ≤1 quarter |
| KRI | `health-kri::red\|yellow\|green` | Undefined or untracked | Defined, provides partial context | Defined, linked to impact/likelihood |

### Optional Labels

#### STORM Integration

- `STORM Risk:1` through `STORM Risk:5` - Risk mapped to one of STORM's Top 5 Risks.
- `STORM::Proposed` - Risk proposed for escalation to STORM risk based on business impact and strategic alignment.

## Triage Bot Automation

PSRR adopts [GitLab Triage Bot](https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage) using recommended [USRM policies](/handbook/security/security-observations-risk-management/#required-triage-bot-policies) to:

- **Enforce PSRR labels** - Flags issues missing psrr-risk-rating, psrr-scope, or health-* labels
- **Validate health indicators** - Ensures health labels match actual risk status (example: No owner but green status).

## Reporting and Metrics

### Monthly Reviews

Product Security conducts monthly risk reviews with Engineering and Security leadership to discuss:

- **Top Risks** - Highest priority PSRR risks requiring executive action or escalation
- **Risk Distribution** - Breakdown by psrr-scope, severity, and health indicators
- **Treatment Progress** - Remediation velocity, milestone completion, blockers

Monthly reviews ensure alignment between Product Security and Engineering on risk priorities and resource allocation.

## Integration with STORM

PSRR risks may escalate to [STORM](/handbook/security/security-assurance/security-risk/storm-program/) based on business impact and strategic alignment. All PSRR risks are also linked to their STORM related risk.

## References

- [STORM Program Procedures](/handbook/security/security-assurance/security-risk/storm-program/)
- [Unified Security Risk Management (USRM)](/handbook/security/security-observations-risk-management/)
- [USRM Authority Matrix](/handbook/security/security-observations-risk-management/#authority-matrix)
- [Risk Drafting Guidance](/handbook/security/security-assurance/security-risk/storm-program/#risk-drafting-guidance)

---
