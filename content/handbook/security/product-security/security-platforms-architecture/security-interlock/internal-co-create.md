---
title: "Internal Co-Create Process"
description: "Direct contributions of security features, paved paths, and guardrails to the GitLab platform from the Security Division."
---

## Summary

GitLab has a highly technical workforce outside of the Product/Engineering divisions who are looking to make direct product contributions. This document details a process on how to do this work so we can deliver results for customers.

## Process

### Project Phases

#### 1. Identify Core Team and Objective

* At a minimum, require a Product Manager, Engineering Manager or Tech Lead, and a Receiving Team(s)

  * **Creators**
    * **PI** = Product/ Project Initiator (Within the Product division)
      * Collaborate with non Prod/Eng division counterparts
      * Provides the objectives to be met
      * Owns the feature vision and requirements
      * Has final sign-off authority on completed feature
    * **EM** = Engineering Manager/ Tech Lead (This will most likely include a Project/Product manager outside the Prod/Eng division)
      * Responsible for building the feature according to PI and RT requirements
      * Manages the development lifecycle (design through handoff)
    * **UX/UI** = User Experience/ User Interface Team(s)
      * Translating complex security requirements into intuitive user interfaces
      * Responsible for maintaining consistency with GitLab's overall User Experience/ User Interface (UX/ UI)
  * **Receivers**
    * **RT** = Receiving Team(s) (Within the Engineering division)
      * Vets handoff information for readability and completeness
      * Will ultimately own the feature long-term with the RPM
      * Provides input during development
      * Takes over engineering ownership after handoff
    * **RPM** = Receiving Product/ Project Manager (Within the Product division)
      * May be the same as the PI
      * Will ultimately own the feature long-term with the RT
      * Provides input during development
      * Takes over product/ project ownership after handoff

#### 2. Project Scope and Objectives

* **PI** defines the goal behavior and desired business outcomes
* **PI + EM** identify what's in and out of scope
* **EM** shares the implementation plan and design proposal for the **RT**
* **UX/UI** identify complex security requirements into intuitive user interfaces
* **EM** provides timelines for development and handoff negotiated
* **RT, RPM, EM+PI** document review/approval by leadership of both teams on maintenance/feature_category association. Consider using [R and D Interlock](/handbook/product-development/how-we-work/r-and-d-interlock) process to ensure RT has enough capacity and priority alignment for the work
* **PI + EM** define key deliverables, objectives, and dependencies
* Ends with documentation of project goal(s) with sign-off from **EM, PI, and RT**

#### 3. Develop the Project Plan

* **PI + EM + UX/UI** work together to document the use cases and workflows
* **UX/UI** creates wireframes, mockups, and prototypes for security features
* **EM + PM + UX/UI** decompose functionality into Milestones, Epics, and Issues
* **PI + EM** work together to coordinate dependencies across orgs (e.g., APIs, data access, infrastructure)
* **EM + UX/UI** documents the test plan, rollout, and deployment
* **EM** estimate resources, budget, and timelines when required
* **EM** plan for Risks and provides mitigation strategies (Security Review)
* Ends with Milestones populated with the Issues/ Epics that are part of the Internal Co-Create initiative

#### 4. Execute the Project Plan

* **EM** reports project statuses and blockers according to standards set for all involved stakeholders
* **EM** works with **RT + RPM** to allocate capacity
* **UX/UI** update design system components based on new feature patterns
* **PI + EM + RT + RPM** attend demos at end of each Milestone
* **PI + EM** provide timely async feedback weekly
* **EM** deploys the deliverables internally and then to external users
  * New Services follow the documentation for Production Readiness Review
  * Monolith Services follow standard MR procedures
* Ends with the code deployed to Live

#### 5. Delivery and Handoff

* **EM** complete any Feature Flags and obvious Tech Debt prior to handover
* **UX/UI** conduct post-launch usability validation
* **EM** captures lessons learned from the project
* **EM** provide documentation for seamless and easy handoff to **RT + RPM**
* **RT + RPM** gains competency of the deliverables before accepting ownership
  * Documentation
  * Knowledge Transfer Syncs
  * Recordings of workflow and testing
  * Lunch-and-Learn Sessions
  * Demos
* **RT + RPM** responsible for monitoring and iterating on deliverables after acceptance
* Ends with **RT + RPM** signing off on receipt of the deliverables
