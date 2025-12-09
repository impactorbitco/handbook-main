---
title: "GitLab Releases"
---

Looking for product release information? See [release posts](https://about.gitlab.com/releases/categories/releases/), [releases page](https://gitlab.com/gitlab-org/gitlab/-/releases), [What's new](https://docs.gitlab.com/ee/administration/whats-new.html), [changelog](https://gitlab.com/gitlab-org/gitlab/blob/master/CHANGELOG.md), or [feature and deprecations overview](https://gitlab-com.gitlab.io/cs-tools/gitlab-cs-tools/what-is-new-since/).

## Overview

GitLab has three different release types:

1. **[Monthly release](/handbook/engineering/releases/monthly-releases/)**: A GitLab version (XX.YY.0) that [is published on the 3rd Thursday of every month](/handbook/engineering/releases/monthly-releases/#monthly-release-schedule), containing new features, bug fixes and performance improvements from many successful [deployments on GitLab.com](/handbook/engineering/deployments-and-releases/deployments/). From this monthly release, [patch releases](/handbook/engineering/releases/patch-releases/) are created as needed.
1. **[Patch release](/handbook/engineering/releases/patch-releases/)**: Patches addressing bug and vulnerabilities per the [GitLab Maintenance policy](https://docs.gitlab.com/policy/maintenance/).
1. **[Internal release](/handbook/engineering/releases/internal-releases/)**: Private releases reserved for delivering high-severity fixes to GitLab single-tenant SaaS instances like GitLab Dedicated within [remediation SLAs](/handbook/security/product-security/vulnerability-management/sla/).

## Terminology

* **[Maintenance policy](https://docs.gitlab.com/policy/maintenance/)**: Describes in detail the release pace of our major, minor and patch releases for self-managed users. The major release yearly cadence was defined [after an all stakeholder discussion](https://gitlab.com/gitlab-com/Product/issues/50).
* **Upcoming version**: [New GitLab release](/handbook/engineering/releases/monthly-releases/#monthly-release-schedule) (XX.YY.0) being developed.
* **Maintained versions**: GitLab versions covered by the [maintenance policy](https://docs.gitlab.com/policy/maintenance/#maintained-versions)
* **[Backports](/handbook/engineering/releases/backports/)**: Bug or security fixes from a recent version applied to an older version.
* **[Stable branches](/handbook/engineering/releases/stable_branches/)**: Source of the GitLab release packages delivered to GitLab customers.
* **[Auto-deploy](/handbook/engineering/deployments-and-releases/deployments/)**: GitLab process to deploy application changes to GitLab.com
* **[Release managers](https://about.gitlab.com/community/release-managers/)**: DRI's to deliver GitLab releases and performing deployments to GitLab.com

## Resources

### Monthly release

* [When do I need to have my MR merged in order for it to be included into the monthly release](/handbook/engineering/releases/monthly-releases#when-do-i-need-to-have-my-mr-merged-in-order-for-it-to-be-included-in-the-monthly-release)
* [How can I determine if my merge request will make it into the monthly release](/handbook/engineering/releases/monthly-releases#how-can-i-determine-if-my-merge-request-will-make-it-into-the-monthly-release)

### Patch release

If you're a GitLab engineer looking:

* To include a bug fix in a patch release, please follow the steps on the [patch release runbook for GitLab engineers](https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/engineers.md).
* To include a security fix in a patch release, please follow the steps on the [security runbook for GitLab engineers](https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/security/engineer.md).

### Internal release

* If you're a GitLab engineer looking to fix a high-severity via an internal release, please follow the steps on the
[internal release runbook for GitLab engineers](https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/internal-releases/engineers.md?ref_type=heads).

### Links

* [Release Manager schedule](https://about.gitlab.com/community/release-managers/)
* [How to reach the Release and Deploy team?](/handbook/engineering/infrastructure-platforms/gitlab-delivery/delivery/#reaching-our-team)
