---
title: "AI Usage Recommendations"
description: Suggestions for getting better results from LLM tools
---

AI tools can return results of varying utility depending on how and what the tool is requested to do. This guide provides strategies for Support Engineers to get more effective results when using LLMs for troubleshooting, research, and customer interactions.

## How to talk with LLMs

When doing research, be as factual and straightforward as possible. Do not provide opportunities for shortcuts, such as either-or questions or confirmations. Think of what kind of answer that is needed and formulate a request with that in mind.

Specific data (such as log messages) can be included to give the LLM context; these data give the model additional context to process. The LLM may not need an explanation of the issue; passing in a log snippet is enough to start a discussion.

## Open versus closed questions

Asking questions that are pointed at providing specific answers can be more effective than open-ended questions. This attempts to guide the machine in a direction that is more likely to be useful.

## State your goal

Combining a goal or pointed question with a pasted log snippet constrains the problem space and helps keep everything on track.

## Examples

Good:

- "Show me where authentication is handled in the API controllers"
- "This GitLab CI job fails with 'executor not found'. Here's the .gitlab-ci.yml and the runner config. What's misconfigured?" [paste configs]
- "Show me where this error is thrown in Sidekiq [paste error]" 

Bad:

- "Is this error caused by SSL or DNS? [paste error]"
- "This exception was thrown while a pipeline was running. Why did the pipeline cause the exception? [paste error]" 
- "Was this issue caused by a misconfiguration or a bug? [paste error]"

## Don't count on LLMs

LLMs are terrible with numbers and math. Do not count on their abilities to do math or understand numbers in relation to each other.

## Things to watch out for

LLMs get confused about dates easily. They can suggest versions that are older than expected, or suggest that a version is invalid because it "hasn't been released". This may also apply to _relative_ dates: something that "released last year" might not be.

The model may confidently suggest documentation, API endpoints, versions, or almost anything else. Always ground-truth verify suggestions. This can be especially insidious with API and CLI options.
