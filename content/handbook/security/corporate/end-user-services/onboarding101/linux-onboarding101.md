---
title: "GitLab Linux Onboarding 101"
---

## Welcome to the GitLab Linux Community

While MacBooks are the primary device choice for most of our members, we do offer the option for technical team members to use Linux. We expect all of our Linux users to be familiar with the platform and to be self-sufficient in setting up their work environments, while also staying compliant with our security policies. However, we also want to make sure that everyone who joins our team is able to get set-up with the basic tools needed to get started without any issues. As such, this guide is designed to address common issues that users encountered when setting up their new machines.

>**NOTE**: We generally do not provide in-depth technical support for Linux, but we can assist with making sure that users can log into Okta.

## Table of Contents

1. [Before You Begin](#before-you-begin)
1. [Security Requirements](#security-requirements)
1. [Initial Installation and Disk Encryption](#initial-installation-and-disk-encryption)
1. [Initial Okta Login](#initial-okta-login)
1. [Device Management and Endpoint Security](#device-management-and-endpoint-security)
   1. [SentinelOne Installation - Germany, the Netherlands, Italy, and Austria Only](#sentinelone-installation---germany-the-netherlands-italy-and-austria-only)
1. [Additional Resources](#additional-resources)

## Before You Begin

To get set up on your new Linux laptop, you will need to have the following:

1. Your GitLab-provided Dell laptop
1. A boot-capable USB drive (At least 8GB)
1. An up-to-date iOS or Android device with a camera OR a YubiKey
1. The Okta activation email sent to your personal email on your first day

## Security Requirements

>**Note**: Ubuntu is the standard distribution used on Linux laptops. This is to ensure GitLab meets all regulatory and compliance standards. Ubuntu has proved to be highly reliable for running the "tech stack" of required security products to meet the various industry standards.

Before being able to log into Okta, a number of security requirements must be met

1. Disk encryption must be enabled
1. The laptop's hostname must match our standard naming convention
1. Fleet Device Management must be installed
1. Endpoint Security (CrowdStrike Falcon OR SentinelOne (Germany,the Netherlands, Italy, and Austria only)) must be installed

## Initial Installation and Disk Encryption

The default version of Ubuntu that ships on Linux does not have disc encryption enabled. While it may be possible to encrypt a disk after an OS has been set up, it is not recommended and will likely result in further issues. As such, you will need to reinstall the OS before continuing.

1. Download the latest Ubuntu LTS release [here](https://ubuntu.com/download/desktop)
1. Create a bootable USB drive using [balenaEtcher](https://etcher.balena.io/) or similar
1. Follow [this guide](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview) to erase the disk and install a fresh copy of Ubuntu.
   1. Install third-party for graphics and Wi-Fi
   1. **Make sure to select `Use LVM and encryption` when prompted**
   1. Complete the installation and boot into your desktop
1. Enable the firewall:
   1. Open the terminal and run `sudo ufw status`
   1. If the response is `Status: inactive` run `sudo ufw enable`
   1. If ufw is not installed, run `sudo apt install ufw` first.
1. Update your system:
   1. Open the terminal and run `sudo apt update && sudo apt upgrade`
1. Enable fingerprint verification for fast logins - [Log in with a fingerprint](https://help.ubuntu.com/stable/ubuntu-help/session-fingerprint.html.en)
   1. Additional resources: [fprint](https://fprint.freedesktop.org/)

## Initial Okta Login

>**IMPORTANT**: As a new-hire, you will be able to perform your initial Okta login without all security requirements being met. However, all required steps must be completed on your first day or you will no longer be able log in.

Complete all required steps [here](/handbook/security/corporate/end-user-services/onboarding101/#laptop-setup-linux) before continuing.

## Device Management and Endpoint Security

We utilize Fleet to manage all of our Linux devices. Fleet will enable you to access Okta, provides a central repository for some of our most commonly used applications (e.g. Zoom), and will let you know about any  potential security issues on your laptop.

Please use [this page](https://internal.gitlab.com/handbook/security/corporate/tooling/fleet/#enrolling-in-fleet) for the installation files and guide.

Enrolling your laptop in Fleet will also automatically install CrowdStrike Falcon on your machine unless you are based in Germany, the Netherlands, Italy, or Austria.

### SentinelOne Installation - Germany, the Netherlands, Italy, and Austria Only

As CrowdStrike has not yet been approved for the above regions, users there will need to manually install SentinelOne Endpoint security in addition to Fleet.

Please click [here](/handbook/security/corporate/systems/sentinelone/setup/) for the necessary files and set-up instructions.

## Additional Resources

- [Linux tools and tips](/handbook/tools-and-tips/linux/)
- [CrowdStrike - Endpoint Detection and Response](https://internal.gitlab.com/handbook/security/corporate/tooling/crowdstrike/)
- [YubiKey Self-Service Purchasing Guide](/handbook/security/corporate/systems/yubikey/purchasing/)
- [1Password for Linux](https://1password.com/downloads/linux)
- #linux in Slack for questions and discussions

## Need Help?

If you need further assistance with setting up your laptop please join our weekly onboarding call scheduled every Tuesday (Check your Calendar!) or reach out to us in Slack in the #it_help channel or via it-help@gitlab.com.
