---
title: Troubleshooting
description: Operations documentation page for troubleshooting the Zendesk-Salesforce sync
canonical_path: "/handbook/security/customer-support-operations/docs/zendesk-salesforce-sync/troubleshooting/"
---

As the sync is quite complex, troubleshooting it can be difficult. Very often if you are needing to troubleshoot it, you will need an issue or to get assistance from the Fullstack Engineer.

Here we highlight some "common" potential issues and what should be done about them.

## Runner errors

This can include runners failing completely, timing out, etc. When these occur, you have two course of action you can take:

- Restart the sync from the beginning
- Wait for the next run of the sync to occur

If the issue occurred early into the run (within the first 5-10 minutes of the hour), restarting it is an acceptable way to go. Anything later than that, and you should wait for the next run of the sync to occur.

If you see this occur repeatedly, please file an issue to notify the Fullstack Engineer.

## Long running jobs

The complete process should never take more than 45 minutes. If you encounter alerts about long running jobs, the best move is to do one of the following:

- Cancel the older pipeline
- Cancel the newer pipeline

The one left running will be able to handle this (since there is not a cache being used) and should self-correct.

If you see this occur repeatedly, please file an issue to notify the Fullstack Engineer.

## Data mismatches

These can be complex to work out, as it is either a problem in calculation or a problem in expectation. Careful review of the data in the source (Salesforce, Zendesk) will be required to determine if there is actually a data mismatch (i.e. a problem in calculation) or simply a problem in expectation.

- For problems in calculation, please file a bug report to notify the Fullstack Engineer.
- For problems in expectation, explain the difference and why it is the value it is.
  - If that conversation results in a desire to change the calculations, please have the reporter file a feature request issue.

## Script errors

The various scripts used for this have been coded in a way to try to provide as much detail as possible. When you encounter a scrpt error, you first need to conclude if it is actually a script error or simply a problem in networking (causing a script error).

The easiest way to be sure is to look at the past run of the sync and the one after it. A true script error will repeat itself every time. If you do not see it occurring every time, it is a problem in networking.

- For a problem in networking, see [Runner errors](#runner-errors)
- For a true script error, please file an issue to notify the Fullstack Engineer
