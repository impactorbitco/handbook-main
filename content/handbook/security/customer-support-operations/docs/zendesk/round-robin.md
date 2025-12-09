---
title: Round Robin
description: Operations documentation page for round robin
canonical_path: "/handbook/security/customer-support-operations/zendesk/round-robin"
---

{{% alert title="Note" color="primary" %}}

This is an informational page for the round robin. It may not reflect the way we actually manage the round robin.

If you are looking for information about maintaining round robin, please see [Round Robin workflow](../../workflows/zendesk/round-robin)

{{% /alert %}}

## How is it triggered

The round robin runs via [GitLab Scheduled pipelines](https://docs.gitlab.com/ci/pipelines/schedules/) using a specific schedule for each Zendesk instance:

- Global: N/A
- US Government: Every 10 minutes between the hours 05xx to 16xx (Pacific time) Monday through Friday (`*/10 5-16 * * 1-5`)

## How it works

### Zendesk US Government

- Ruby version: `3.2.2`
- Gem list:
  - [gitlab_support_readiness](https://rubygems.org/gems/gitlab_support_readiness)
- CI/CD Images:
  - `curlimages/curl:latest`
  - `ruby:3.2.2`

Before each job runs, it performs a few actions to setup the image to perform the needed actions:

- Clones the repo at [suppport-team](https://gitlab.com/gitlab-support-readiness/support-team) to `data/support-team`
- Output the response from running the command `ruby -v`
- Install the `bundler` gem
- Run the `bundle` command
- Put the values of the environment variable `SERVICE_CREDS` into the file `data/config.json`

After this, the `./bin/round_robin` script is executed.

Using a pre-made view, the script will get alist of tickets to round robin. If there are no tickets, the script will exit with a status code of 0.

The script will then determine the currently available agents by checking the [suppport-team](https://gitlab.com/gitlab-support-readiness/support-team) information, remove any agents on PTO, and remove any agents not currently within working hours. In the event no agents are available, it will post a notification to a Slack control via a Support controlled Slack incoming webhook (and exit with a status code of 0).

Using the list of currently available agents, it will then determine the current workloads of said agents (this is done by looking at assigned tickets with a status lower than solved) using the `Ticket Weight` field on the tickets it locates.

After gathering the tickets in need of being round robin'd (using the [Not round robined view](https://gitlab-federal-support.zendesk.com/agent/filters/360240736651)), the script will then assign them out to the agent with the lowest workload (incrementing their workload by 1).

## Source projects

- [Zendesk US Government](https://gitlab.com/gitlab-support-readiness/zendesk-us-government/tickets/round-robin)
