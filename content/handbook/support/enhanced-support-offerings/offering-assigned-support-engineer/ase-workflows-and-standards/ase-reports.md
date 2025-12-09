---
title: Reports and Dashboards for ASEs
description: Descriptions of each standard report and dashboard available to ASEs
---

## Introduction

## Reports and dashboards for ASE accounts

### Fetching ticket data from Snowflake

As an ASE, you [can request access](/handbook/security/corporate/systems/lumos/ar/) to the GitLab [SnowFlake](/handbook/enterprise-data/platform/snowflake) instance, and this can be quite useful in preparing reports or keeping documentation on your assigned customer's environments up to date.

There are a few steps required to generate data for each customer, and these notes will assume that you already have working access to Snowflake and Zendesk.

As we do not have access to the Zendesk API, you will first need to manually scrape the list of ticket IDs that you'd like to include in your report.

To start, you will need to go to the appropriate organization page for your customer, in Zendesk, and then open the Chrome Developer tools panel, and paste either of the following blocks of code;

#### Single page

To get only the tickets visible on the current Zendesk page - so filtered by your chosen customer, but this could be extended to only include open tickets or a specific requester, part of this information is not easily available in Snowflake - use this code:

```javascript
copy(Array.from(document.querySelectorAll('[data-test-id="generic-table-cells-id"]'))
        .map(cell => cell.textContent.trim().replace('#', ''))
        .join(', '));
```

Will copy a comma seperated list of the ticket numbers from that page.

#### All of the customer's tickets

If you need to fetch more than 30 tickets, you can use this js to fetch all of the tickets for your specific customer:

```javascript
window.allTicketIds = [];

async function collectAllPages() {
  let pageCount = 0;

  while (true) {
    pageCount++;

    // Wait for content to load
    await new Promise(resolve => setTimeout(resolve, 1500));

    // Collect current page
    const ids = Array.from(document.querySelectorAll('[data-test-id="generic-table-cells-id"]'))
.map(cell => cell.textContent.trim().replace('#', ''));

    if (ids.length === 0) {
console.log('Waiting longer for page to load...');
await new Promise(resolve => setTimeout(resolve, 2000));
continue;
    }

    window.allTicketIds.push(...ids);
    console.log(`Page ${pageCount}: Collected ${ids.length} IDs. Total: ${window.allTicketIds.length}`);

    // Find next button
    const nextButton = document.querySelector('button[aria-label="Next page"]');

    // Check if button is hidden (last page indicator)
    if (!nextButton || nextButton.disabled || nextButton.hasAttribute('hidden') ||
  nextButton.getAttribute('aria-disabled') === 'true') {
console.log('No more pages');
break;
    }

    nextButton.click();
  }

  console.log(`\n✓ Collected ${window.allTicketIds.length} ticket IDs total:`);
  console.log(window.allTicketIds.join(', '));
}

collectAllPages();
```

This will output the array to the console window.

#### Querying Snowflake

You are now ready to use fetch the ticket data from Snowflake.

Using [this](https://app.snowflake.com/ys68254/gitlab/w3cd6hFh6KvV#query) Snowflake worksheet as an example, you can query the summarized data, using the ticket IDs you retrieved earlier:

```sql
SELECT TICKET_ID,AI_INSPECTED_SUMMARY,AI_INSPECTED_FEATURES,AI_INSPECTED_PRODUCT_GROUP,AI_INSPECTED_CURRENT_VERSION FROM PROD.COMMON_PREP.PREP_ZENDESK_PROCESSED_TICKETS WHERE
TICKET_ID IN ( #TICKET_ARRAY_GOES_HERE ) ORDER BY TICKET_ID DESC;
```

Do note that this is not an exhaustive list of the fields available, that the ```CREATED_AT``` and ```SYNCED_AT``` fields _do not_ reflect the date of the ticket, and that Snowflake uses a reasonably standard SQL query format so this query could easily be extended.

## Reports and dashboards for ASEs
