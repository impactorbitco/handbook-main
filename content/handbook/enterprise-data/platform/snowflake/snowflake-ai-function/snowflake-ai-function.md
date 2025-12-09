---
title: "Snowflake AI Functions: Usage and Cost Management Guide"
description: "How to use Snowflake AI Functions effectively while managing costs and token consumption in GitLab's Enterprise Data Platform"
---

## Table of Contents

- [What is Snowflake AI Functions?](#what-is-snowflake-ai-functions)
- [Purpose](#purpose)
- [Prerequisites](#prerequisites)
- [Understanding Tokens and Credits](#understanding-tokens-and-credits)
- [Available AI Functions](#available-ai-functions)
- [Snowflake AI Functions: Fixed vs Variable Pricing](#snowflake-ai-functions-fixed-vs-variable-pricing)
- [⚡ Quick Start Checklist](#-quick-start-checklist)
- [Getting Started: 3-Step Approach](#getting-started-3-step-approach)
- [Is My Token Usage Reasonable?](#is-my-token-usage-reasonable)
- [Advanced Usage & Optimization](#advanced-usage--optimization)
- [Monitoring & Support](#monitoring--support)
- [Emergency Access Control Procedures - Data Platform Team](#emergency-access-control-procedures---data-platform-team)
- [AI Functions Access Management - Standard Operations](#ai-functions-access-management---standard-operations)
- [Related Resources](#related-resources)

## What is Snowflake AI Functions?

Snowflake AI Functions are built-in machine learning capabilities that enable data analysts and engineers to perform advanced analytics directly within our [Enterprise Data Warehouse](/handbook/enterprise-data/platform/snowflake/). These functions leverage Snowflake's native AI/ML capabilities to provide insights without requiring external tools or complex model deployments.

### AI Functions in Snowflake allow GitLab team members to

- Perform sentiment analysis on text data
- Extract insights from unstructured data
- Generate predictions and classifications
- Enhance data quality through intelligent data processing
- Accelerate time-to-insight for business decisions

⚠️ Important Cost Consideration: AI Functions use token-based billing separate from standard warehouse credits. Always estimate costs before processing large datasets.

## Purpose

This guide provides comprehensive guidance on using Snowflake AI Functions effectively while maintaining cost control. Given the token-based billing model, understanding cost implications is crucial for responsible usage within GitLab's data platform.

## Prerequisites

Before using Snowflake AI Functions, ensure you have:

- **Snowflake Access**: Follow the [Warehouse Access](/handbook/enterprise-data/platform/#warehouse-access) process
- **Required Roles**: Minimum `snowflake_analyst` role or higher depending on data sensitivity
- **Warehouse Access**: Access to appropriate compute warehouses (`dev_xs`, `dev_m`, or `reporting`)
- **Cost Awareness**: Understanding of token-based billing implications

## Understanding Tokens and Credits

### What is a Token?

A token is the smallest unit of text that AI models process, roughly equivalent to 4 characters or 3/4 of an English/text word.
Examples:

- "Hello" = ~1 token
- "Analyze this text" = ~3 tokens
- A typical email (200 words) = ~270 tokens
- A GitLab issue description (500 words) = ~670 tokens

### What are Credits?

Credits are Snowflake's billing unit for AI services and compute resources

<b>Standard Rate:</b> Credits are priced based on your Snowflake edition and region (typically $2-4 per credit for On Demand)

<b>Conversion:</b> Different models charge different rates per million tokens

<b>[Current Model Rates](https://www.snowflake.com/legal-files/CreditConsumptionTable.pdf) (Credits per million tokens):</b>

- `mistral-7b:`     0.12 credits/million tokens
- `mixtral-8x7b:`    0.22 credits/million tokens
- `llama3.1-70b:`    1.21 credits/million tokens
- `llama3.3-70b:`     1.21 credits/million tokens
- `claude-4-sonnet:`  2.55 credits/million tokens
- `deepseek-r1:`      1.03 credits/million tokens
- `snowflake-arctic:` 0.84 credits/million tokens

<b>Cost Examples (Using Standard Enterprise Edition Rate)</b>

| Model | Credits per Million Tokens | Cost per Million Tokens* | Cost for 10M Tokens* |
|-------|---------------------------|--------------------------|---------------------|
| mistral-7b | 0.12 | $0.36 | $3.60 |
| llama3.1-70b | 1.21 | $3.63 | $36.30 |
| claude-4-sonnet | 2.55 | $7.65 | $76.50 |

*Based on $3.00/credit (Enterprise Edition, US regions).

### Understanding Token-Based Billing

Snowflake AI services use token-based billing, distinct from standard warehouse credit billing:

- **AI Credits**: Depend on token usage (input + output tokens)
- **Warehouse Credits**: Separate billing based on runtime and warehouse size  
- **Token Calculation**: Based on the specific model used and text length processed
- **Cost Variability**: Different models have different token consumption rates

**Example**: Running a 1-hour query on a Large warehouse costs the same warehouse credits whether you process 100 or 100,000 records. However, AI function costs scale directly with the amount of text processed

## Available AI Functions

Snowflake provides several AI functions through the CORTEX namespace:

### Text Analysis Functions

| Function | Purpose | Cost (Credits/M Tokens) | Typical GitLab Use Cases |
|----------|---------|-------------------------|--------------------------|
| `SNOWFLAKE.CORTEX.SENTIMENT` | Analyze sentiment of text | 0.08 | Customer feedback, support ticket mood |
| `SNOWFLAKE.CORTEX.EXTRACT_ANSWER` | Extract answers from text | 0.08 | Issue root cause extraction, feature requirements |
| `SNOWFLAKE.CORTEX.SUMMARIZE` | Generate text summaries | 0.10 | MR summaries, release note generation |
| `SNOWFLAKE.CORTEX.TRANSLATE` | Translate between languages | 1.50 | Internationalization analysis |
| [`SNOWFLAKE.CORTEX.COMPLETE`](https://internal.gitlab.com/handbook/enterprise-data/platform/ai_to_data/technical_documentation_ai_to_data/#snowflake-cortex-complete) | Text completion/generation | 0.05-12.00* | Content generation, categorization |

*Varies by model selected

### Available Models for COMPLETE Function

| Model Tier | Examples | Cost Range | Best For |
|------------|----------|------------|----------|
| **Budget** | `mistral-7b`, `openai-gpt-oss-20b` | 0.05-0.12 | High-volume simple tasks, categorization |
| **Balanced** | `mixtral-8x7b`, `llama4-maverick` | 0.22-0.25 | Most general-purpose tasks |
| **Performance** | `llama3.1-70b`, `snowflake-arctic` | 0.84-1.21 | Complex analysis, nuanced reasoning |
| **Premium** | `claude-4-sonnet`, `mistral-large2` | 2.55-1.95 | Customer-facing content, highest quality |

💡 **Cost Tip**: Use specialized functions (SENTIMENT, SUMMARIZE, EXTRACT_ANSWER) whenever possible - they're 3-30x cheaper than using COMPLETE for the same tasks!

## Snowflake AI Functions: Fixed vs Variable Pricing

## Fixed-Price Functions

These functions have **fixed costs** - no model selection required, consistent pricing:

**Basic Functions**  

| Function | Cost (Credits/M Tokens) | Purpose |
|----------|-------------------------|---------|
| `SNOWFLAKE.CORTEX.SENTIMENT` | 0.08 | Sentiment analysis |
| `SNOWFLAKE.CORTEX.EXTRACT_ANSWER` | 0.08 | Q&A extraction from text |
| `SNOWFLAKE.CORTEX.SUMMARIZE` | 0.10 | Text summarization |
| `SNOWFLAKE.CORTEX.GUARD` | 0.25 | Content safety filtering |

 **Advanced Functions**

| Function | Cost (Credits/M Tokens) | Purpose |
|----------|-------------------------|---------|
| `SNOWFLAKE.CORTEX.AI_TRANSCRIBE` | 1.30 | Speech to text conversion |
| `SNOWFLAKE.CORTEX.AI_CLASSIFY` | 1.39 | Advanced classification |
| `SNOWFLAKE.CORTEX.AI_FILTER` | 1.39 | Intelligent data filtering |
| `SNOWFLAKE.CORTEX.TRANSLATE` | 1.50 | Language translation |
| `SNOWFLAKE.CORTEX.AI_AGG` | 1.60 | AI-powered aggregation |
| `SNOWFLAKE.CORTEX.AI_SENTIMENT` | 1.60 | Enhanced sentiment analysis |
| `SNOWFLAKE.CORTEX.AI_SUMMARIZE_AGG` | 1.60 | Aggregated summarization |
| `SNOWFLAKE.CORTEX.ENTITY_SENTIMENT` | 1.60 | Entity-level sentiment |
| `SNOWFLAKE.CORTEX.AI_EXTRACT` | 2.55 | Advanced data extraction |

## Variable-Price Functions (Model Selection Required)

These functions require **model selection** and costs vary based on your choice:

| Function Category | Price Range (Credits/M Tokens) | Purpose |
|-------------------|--------------------------------|---------|
| `SNOWFLAKE.CORTEX.COMPLETE` | 0.05 - 12.00 | Text generation, completion, custom tasks |
| `SNOWFLAKE.CORTEX.EMBED_TEXT_768` | 0.03 | Basic text embeddings (768 dimensions) |
| `SNOWFLAKE.CORTEX.EMBED_TEXT_1024` | 0.05 - 0.07 | Advanced text embeddings (1024 dimensions) |
| `SNOWFLAKE.CORTEX.EMBED_IMAGE_1024` | 0.06 | Image and text embeddings |

## ⚡ Quick Start Checklist

Before using any AI functions:

- [ ] **Check your daily credit usage** (see monitoring query below)
- [ ] **Start with specialized functions** (SENTIMENT, SUMMARIZE) when possible - they're 3-30x cheaper
- [ ] **Use budget models** (mistral-7b) for initial testing
- [ ] **Always test on small samples** before processing full datasets

## Getting Started: 3-Step Approach

### Step 1: Test on Sample Data First

Always start with a small sample to understand function behavior and token consumption:

```sql
-- Test sentiment analysis on sample data
SELECT 
    email,
    SNOWFLAKE.CORTEX.SENTIMENT(email) as sentiment_score,
    SNOWFLAKE.CORTEX.COUNT_TOKENS('mistral-7b', email) as tokens_used
FROM RAW.AIRFLOW_STITCH.AB_USER
SAMPLE (10 ROWS)
ORDER BY tokens_used DESC;
```

- Note: For SENTIMENT, no token counting needed (fixed cost function)
- Token counting mainly applies to COMPLETE function

### Step 2: Estimate Costs Before Full Run

Calculate estimated costs before processing your entire dataset:

```sql
-- Calculate estimated cost before processing full table
WITH sample_estimate AS (
    SELECT 
        COUNT(*) as sample_rows,
        SUM(SNOWFLAKE.CORTEX.COUNT_TOKENS(
            'mistral-7b',
            'Your prompt here: ' || your_column
        )) as sample_tokens
    FROM your_table
    SAMPLE (100 ROWS)  -- Sample 100 rows
),
cost_projection AS (
    SELECT 
        sample_tokens,
        sample_rows,
        (SELECT COUNT(*) FROM your_table) as total_rows,
        sample_tokens * total_rows / sample_rows as estimated_total_tokens
    FROM sample_estimate
)
SELECT 
    estimated_total_tokens / 1000000 as estimated_million_tokens,
    estimated_million_tokens * 0.12 as estimated_credits  -- Check current rates
FROM cost_projection;
```

## Is My Token Usage Reasonable?

### Daily Usage Planning: How Much Can I Process Today?

To control costs, we have budgets assigned to Team members/named Snowflake users. We've implemented these hard budgets as a safety net because Snowflake costs can escalate quickly and unintentionally. These budget limits can be discussed and revisited if needed.

**Your Daily Budget: 250 Credits** | **Resets at 00:00 UTC**

⚠️ **DAILY LIMIT ENFORCEMENT**

When you exceed 250 credits in a single day:

1. **AI function access is revoked** *(Currently manual - Data Platform Team. Can be automated in the future)*
2. **An issue is created in the analytics project** *(Manual - Data Platform Team)*  
3. **You must contact the Data Platform Team for restoration** *(Manual - Team member should respond to the issue)*
4. **Access will only be restored after review and approval** *(Manual - Discussion and approval in issue)*

**Note**: Detailed runbook procedures for the Data Platform Team are currently in development and will be maintained by the data platform team.

**Current State vs Future Automation:**

- **Current**: All enforcement and restoration steps are manual processes
- **Future**: Access revocation can be automated, but restoration will remain manual for cost control

| Zone | Credits Used | What This Means |
|------|--------------|-----------------|
| 🟢 **Safe Zone** | 0-125 credits (0-50%) | Normal daily usage |
| 🟡 **Monitor Zone** | 126-200 credits (51-80%) | Moderate usage |
| 🟠 **Caution Zone** | 201-240 credits (81-96%) | High usage |
| 🔴 **Final Zone** | 241-249 credits (97-99%) | Nearly at limit |
| 🚫 **Limit Exceeded** | 250+ credits (100%+) | Access revoked for AI function. Contact Data Platform Team |  

💡 **Daily Limit Reminder**: Each team member has a 250 credit daily limit. Each day the limit resets. When overrun, AI function access is revoked until consultation with the Data Platform Team is completed. Plan your processing accordingly!

-- Quick check: How many credits do I have left today?

```sql
WITH daily_usage AS (
    SELECT 
        SUM(h.TOKEN_CREDITS) as credits_used_today
    FROM SNOWFLAKE.ACCOUNT_USAGE.CORTEX_FUNCTIONS_QUERY_USAGE_HISTORY h
    JOIN SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY q ON h.QUERY_ID = q.QUERY_ID
    WHERE DATE(q.START_TIME) = CURRENT_DATE 
    AND q.USER_NAME = CURRENT_USER()
)
SELECT 
    COALESCE(credits_used_today, 0) as credits_used_today,
    250 - COALESCE(credits_used_today, 0) as remaining_daily_credits,
    CASE 
        WHEN (250 - COALESCE(credits_used_today, 0)) >= 125 THEN '🟢 Plenty of capacity'
        WHEN (250 - COALESCE(credits_used_today, 0)) >= 75 THEN '🟡 Moderate capacity'  
        WHEN (250 - COALESCE(credits_used_today, 0)) >= 25 THEN '🟠 Limited capacity'
        ELSE '🔴 Very limited capacity'
    END as capacity_status,
    ROUND(((COALESCE(credits_used_today, 0) / 250) * 100), 1) as percent_of_daily_limit
FROM daily_usage;
```

### Step 3: Process in Controlled Batches

For large datasets, process data in manageable batches:

```sql
-- Process data in daily batches
SELECT 
    date_day,
    issue_id,
    SNOWFLAKE.CORTEX.COMPLETE(
        'mistral-7b',
        'Categorize this GitLab issue: ' || title || '. Categories: bug, feature, documentation'
    ) as issue_category
FROM RAW.AIRFLOW_STITCH.AB_USER
WHERE date_day = '2024-01-01'  -- Process one day at a time
ORDER BY issue_id;
```

## Advanced Usage & Optimization

### Token Counting Best Practices

- Always validate token estimates using Snowflake’s built-in functions (SNOWFLAKE.CORTEX.COUNT_TOKENS).

- Concatenate prompts and data per row to precisely calculate token usage:

```sql
SELECT
    SUM(
        SNOWFLAKE.CORTEX.COUNT_TOKENS(
            'llama3.1-70b',
            'fixed prompt text here ' || data_column
        )
    ) AS total_token_usage
FROM your_table;
```

**Critical Rule:** Count tokens on the complete concatenated string (prompt + data), not separately. This avoids ±5% estimation errors due to token boundaries, delimiters, or encoding differences.

Count tokens on this combined string per row and sum across all rows:

```sql
SELECT
    SUM(
        SNOWFLAKE.CORTEX.COUNT_TOKENS(
            'llama3.1-70b',
            'your prompt here ' || your_column
        )
    ) AS precise_token_estimation
FROM your_table;
```

### Cost Optimization Strategies

**1. Function Selection Priority**

- First choice: Use specialized functions (SENTIMENT, SUMMARIZE, EXTRACT_ANSWER) when possible
- Second choice: Budget models for COMPLETE function (mistral-7b, openai-gpt-oss-20b)
Use shorter prompts and limit input data size wherever possible.

**2. Data Preprocessing**

- Apply WHERE clauses before AI functions to reduce data volume
- Process only meaningful content (filter out empty or very short text)

**3. Smart Batching**

- Process similar data together for consistency
- Use daily batches rather than real-time processing
- Store and reuse results to avoid reprocessing

### Token Usage Comparison

Token usage varies significantly between models. Here's a practical comparison:

```sql
-- Compare token usage across models for the same text
WITH sample_text AS (
    SELECT 'Analyze customer feedback for product improvement opportunities' as text
)
SELECT 
    'mistral-7b' as model,
    SNOWFLAKE.CORTEX.COUNT_TOKENS('mistral-7b', text) as token_count
FROM sample_text
UNION ALL
SELECT 
    'llama3.1-70b' as model,
    SNOWFLAKE.CORTEX.COUNT_TOKENS('llama3.1-70b', text) as token_count
FROM sample_text
UNION ALL
SELECT 
    'mixtral-8x7b' as model,
    SNOWFLAKE.CORTEX.COUNT_TOKENS('mixtral-8x7b', text) as token_count
FROM sample_text;
```

![Token Usage Comparison](static/images/enterprise-data/snowflake-ai-function/model_comparison.png)

**Selection Strategy:** Start with mistral-7b for initial testing, then upgrade only when accuracy requirements justify the additional cost.

## Monitoring & Support

### Daily Usage Tracking

Monitor your daily credit consumption against the 250 credit limit.

For the daily usage monitoring query, see the [Daily Usage Planning](#daily-usage-planning-how-much-can-i-process-today) section above.

### High-Cost Query Identification

```sql
-- Find your most expensive queries
SELECT 
    h.QUERY_ID,
    h.FUNCTION_NAME,
    h.TOKEN_CREDITS,
    q.QUERY_TEXT,
    q.START_TIME
FROM SNOWFLAKE.ACCOUNT_USAGE.CORTEX_FUNCTIONS_QUERY_USAGE_HISTORY h
JOIN SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY q ON h.QUERY_ID = q.QUERY_ID
WHERE q.USER_NAME = CURRENT_USER()
AND q.START_TIME >= CURRENT_DATE - 30
ORDER BY h.TOKEN_CREDITS DESC
LIMIT 10;
```

### Troubleshooting Common Issues

#### High Token Consumption

**Problem: Approaching or exceeding daily credit limits**

**Diagnostic Steps:**

- Check which functions consumed the most credits
- Review prompt efficiency
- Verify model selection appropriateness

Solutions:

- Switch to specialized functions when possible
- Use budget models (mistral-7b, openai-gpt-oss-20b) for initial analysis
- Implement more aggressive data filtering
- Process in smaller, controlled batches

#### Function Timeouts

**Problem: AI function queries failing or timing out**

Solutions:

- Use larger compute warehouses (dev_m instead of dev_xs)
- Reduce batch sizes (process 1,000 records instead of 10,000)
- Simplify prompts to reduce processing complexity
- Split complex queries into multiple steps

#### Inconsistent Results

**Problem: AI functions returning variable or unexpected outputs**

Solutions:

- Use more specific, structured prompts
- Include examples in prompts for better consistency
- Consider upgrading to higher-accuracy models
- Implement result validation and retry logic

## Emergency Access Control Procedures - Data Platform Team

**Audience**: Data Platform Team administrators only.  
**Purpose**: Emergency lockdown.
**Warning**: These procedures will disable AI functions for all users.

## When to Use These Procedures

**Emergency Lockdown Triggers:**

- Security incident involving AI functions
- Compliance violation requiring immediate action
- Cost overrun emergency (>$X in single day)
- Legal requirement for immediate cessation

## Emergency Lockdown Procedures

### Phase 1: Complete Cortex Lockdown

In exceptional circumstances, you may need to completely disable Cortex functionality. Use the following commands responsibly, usually under guidance from the Data Platform Team or legal/compliance approval.

#### Step 1.1: Emergency Lockdown at Account Level

Execute these commands as ACCOUNTADMIN to immediately block all Cortex functionality:

```sql
- Switch to ACCOUNTADMIN (required for account-level changes)
USE ROLE ACCOUNTADMIN;

-- Block all models at account level (emergency shutoff)
ALTER ACCOUNT SET CORTEX_MODELS_ALLOWLIST = 'None';

-- Verify the setting
SHOW PARAMETERS LIKE 'CORTEX_MODELS_ALLOWLIST' IN ACCOUNT;
```

#### Step 1.2: Revoke All Database Roles from PUBLIC

Remove Cortex access from the PUBLIC role, which affects all users by default:  

```sql
-- Revoke primary Cortex database roles
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_USER FROM ROLE PUBLIC;
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER FROM ROLE PUBLIC;
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_AGENT_USER FROM ROLE PUBLIC;
-- Revoke imported privileges on SNOWFLAKE database
REVOKE IMPORTED PRIVILEGES ON DATABASE SNOWFLAKE FROM ROLE PUBLIC;

-- Revoke schema-level access if previously granted
REVOKE USAGE ON SCHEMA SNOWFLAKE.CORTEX FROM ROLE PUBLIC;
REVOKE USAGE ON SCHEMA SNOWFLAKE.MODELS FROM ROLE PUBLIC;
```

#### Step 1.3: Revoke Model Application Roles

Remove access to specific LLM models through application roles:

```sql
-- Initialize model RBAC system (required before revoking application roles)
CALL SNOWFLAKE.MODELS.CORTEX_BASE_MODELS_REFRESH();

-- Revoke all model access from PUBLIC
REVOKE APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-ALL" FROM ROLE PUBLIC;

-- Revoke specific model application roles that may have been granted
REVOKE APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-LLAMA3.1-70B" FROM ROLE PUBLIC;
REVOKE APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-CLAUDE-3-5-SONNET" FROM ROLE PUBLIC;
REVOKE APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-MISTRAL-LARGE2" FROM ROLE PUBLIC;
REVOKE APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-GEMMA-7B" FROM ROLE PUBLIC;
```

#### Step 1.4: Audit and Revoke from Existing Roles

Identify and clean up any existing Cortex permissions on custom roles:

```sql
-- Find all roles currently with Cortex access
SHOW GRANTS OF DATABASE ROLE SNOWFLAKE.CORTEX_USER;

-- Revoke from identified roles (replace 'role_name' with actual roles found)
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_USER FROM ROLE data_analyst;
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_USER FROM ROLE data_scientist;
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_USER FROM ROLE Engineer;

-- Check for other Cortex-related roles
SHOW GRANTS OF DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER;
SHOW GRANTS OF DATABASE ROLE SNOWFLAKE.CORTEX_AGENT_USER;

-- Revoke as needed
REVOKE DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER FROM ROLE analytic_engineer;

```

#### Step 1.5: Verification of Complete Lockdown

Verify that all Cortex access has been removed:

```sql
-- Check no roles have CORTEX_USER access
SELECT 
    name as database_role,
    grantee_name as granted_to_role
FROM SNOWFLAKE.ACCOUNT_USAGE.GRANTS_TO_ROLES
WHERE granted_on = 'DATABASE_ROLE' 
  AND name = 'SNOWFLAKE.CORTEX_USER'
  AND deleted_on IS NULL;
-- Should return no rows

-- Verify account-level model blocking
SHOW PARAMETERS LIKE 'CORTEX_MODELS_ALLOWLIST' IN ACCOUNT;
-- Should show 'None'

-- Test access with a non-admin role
USE ROLE PUBLIC;
SELECT SNOWFLAKE.CORTEX.COMPLETE('llama3.1-8b', 'test');
-- Should fail with permission error

-- Return to ACCOUNTADMIN for next phase
USE ROLE ACCOUNTADMIN;
```

Next Steps

**Document incident:** Record all actions taken and verification results.
**Notify stakeholders:** Confirm lockdown completion.  
**Plan restoration:** When incident is resolved, use "AI Functions Access Management" procedures.  
**Business approval required:** All restoration requires appropriate business stakeholder approval.

⚠️ Important: Do NOT attempt to restore access without proper incident resolution and business approval.

## AI Functions Access Management - Standard Operations

## Overview

**Purpose:** Standard procedures for setting up and managing AI Functions access.  
**Audience:** Data Platform Team for routine access provisioning.  
**Usage:** Normal business operations, user onboarding, role management.  

⚠️ Note: These procedures should only be used after proper business approval. During emergencies, use the Emergency Lockdown procedures above.

## Access Control Architecture

### Role Hierarchy Design

Create a structured approach with different roles for Cortex access:

```sql
-- Create cortex_analyst role
CREATE ROLE IF NOT EXISTS cortex_analyst 
    COMMENT = 'Full cortex access including cortex_user and cortext analyst';

-- Create role hierarchy (higher roles inherit from lower ones)
GRANT ROLE cortex_analyst TO ROLE sysadmin;
GRANT ROLE cortex_analyst TO ROLE analytic_engineer;
```

### Selective Cortex Access Grants enable Controlled Model Access

Configure the account to allow specific models for controlled access:

```sql
-- Enable specific models (replace with your organization's approved models)
ALTER ACCOUNT SET CORTEX_MODELS_ALLOWLIST = 
    'llama3.1-8b,llama3.1-70b,mistral-large2,gemma-7b,snowflake-arctic';

-- Verify the change
SHOW PARAMETERS LIKE 'CORTEX_MODELS_ALLOWLIST' IN ACCOUNT;
```

### Database Role Assignment

Assign appropriate access levels to tiers:

```sql
-- Basic users: Core AI functions only
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE cortex_analyst;
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER TO ROLE cortex_analyst;
```

### Configure Specific Model Access

```sql
-- Initialize model RBAC system (required before granting application roles)
CALL SNOWFLAKE.MODELS.CORTEX_BASE_MODELS_REFRESH();

-- Grant specific model access to the role
GRANT APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-LLAMA3.1-70B" TO ROLE cortex_analyst;
GRANT APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-MISTRAL-7B" TO ROLE cortex_analyst;
GRANT APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-MIXTRAL-8X7B" TO ROLE cortex_analyst;

-- All available models if not given restrive model name
GRANT APPLICATION ROLE SNOWFLAKE."CORTEX-MODEL-ROLE-ALL" TO ROLE cortex_analyst;
```

### Grant Additional Database and Schema Access

Provide necessary database and schema privileges:

```sql
-- Grant imported privileges on SNOWFLAKE database
GRANT IMPORTED PRIVILEGES ON DATABASE SNOWFLAKE TO ROLE cortex_analyst;

-- Grant schema usage (inherited by higher roles)
GRANT USAGE ON SCHEMA SNOWFLAKE.CORTEX TO ROLE cortex_analyst;
GRANT USAGE ON SCHEMA SNOWFLAKE.MODELS TO ROLE cortex_analyst;
```

### User role Assignment

Grant the tiered roles to specific users based on their needs:

```sql
-- Business analysts - basic summarization and analysis
GRANT ROLE cortex_analyst TO ROLE john_doe;
```

### Test Access Controls

Verify that the access controls work as expected:

```sql
-- Test basic user access (should work with limited models)
USE ROLE john_doe;
SELECT SNOWFLAKE.CORTEX.COMPLETE('llama3.1-8b', 'Hello, world!');
-- Should succeed

SELECT SNOWFLAKE.CORTEX.COMPLETE('deepseek-r1', 'Hello, world!');
-- Should fail - model not allowed for this role
```

### Getting Help

1. **Data Team Support**: Create an issue in the [analytics project](https://gitlab.com/gitlab-data/analytics/-/issues)
2. **Slack Channels**:
   - `#data-engineering` for technical issues
3. **Cost Concerns**: Contact the Data Platform Team for cost optimization guidance

## Related Resources

### Internal GitLab Resources

- [Snowflake Guide](/handbook/enterprise-data/platform/snowflake/) - Main Snowflake documentation
- [dbt Guide](/handbook/enterprise-data/platform/dbt-guide/) - Data transformation best practices
- [SQL Style Guide](/handbook/enterprise-data/platform/sql-style-guide/) - SQL coding standards
- [Data Platform Overview](/handbook/enterprise-data/platform/) - Enterprise Data Platform architecture
- [Interacting with Data Using AI](https://internal.gitlab.com/handbook/enterprise-data/platform/ai_to_data/)

### External Documentation

- [Snowflake Cortex AI Functions](https://docs.snowflake.com/en/user-guide/snowflake-cortex/llm-functions)
- [Snowflake AI Function Pricing](https://docs.snowflake.com/en/user-guide/cost-understanding-ai-features)
- [Snowflake Performance Optimization](https://docs.snowflake.com/en/user-guide/performance-query)

By consistently applying these guidelines, teams can effectively leverage Snowflake AI capabilities while maintaining control over expenses.
