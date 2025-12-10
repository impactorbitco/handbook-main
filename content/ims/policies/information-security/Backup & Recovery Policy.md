---
title: Backup & Recovery Policy
Owner: Ryan Laird
Company Handbook: false
Created time: 22 June 2025 08:01
ID: POL-124
IMS: IT Service Management System (https://www.notion.so/IT-Service-Management-System-1b5d6625c67980c9a30bd487bffe9a47?pvs=21),
  Quality Management System (https://www.notion.so/Quality-Management-System-132d6625c67980ffa524f05f5d52ad89?pvs=21),
  Documentation and Records Management (https://www.notion.so/Documentation-and-Records-Management-1b5d6625c6798087831bf44f4c4550a4?pvs=21),
  Business Continuity Management System (https://www.notion.so/Business-Continuity-Management-System-1b5d6625c679800480a2c3ef20abba4f?pvs=21)
Last edited time: 7 October 2025 18:45
Parent item: Information Governance and Data Security Policy (Information%20Governance%20and%20Data%20Security%20Policy%201c0d6625c679813f8302fe82c5e67869.md)
Status: Not started
Version Number: 1.1
weight: 10
---
# Backup & Recovery Policy

## 1. Purpose

The purpose of this Backup Policy is to ensure that information and critical systems at [Organisation Name] are protected against loss, corruption, or destruction through the implementation of effective and consistent backup and recovery procedures.

This policy supports the organisation’s compliance with ISO/IEC 27001 requirements for information security and business continuity.

## 2. Scope

This policy applies to:

- All information assets, systems, servers, databases, applications, cloud services, and network devices owned, operated, or managed by [Organisation Name].
- All employees, contractors, and third parties who are responsible for data handling or backup operations.
- All data classified as Critical, Confidential, or Internal under the Information Classification Policy.

## 3. Definitions

- **Backup**: A copy of data stored separately from the original to enable recovery in case of loss or corruption.
- **Critical Data**: Data necessary for the organisation’s operational continuity, compliance, or financial obligations.
- **Recovery Point Objective (RPO)**: The maximum acceptable amount of data loss measured in time.
- **Recovery Time Objective (RTO)**: The maximum acceptable amount of time to restore systems after disruption.

## 4. Policy

### 4.1 Backup Responsibilities

- The **Information Security Manager** and **IT Department** are responsible for implementing, maintaining, monitoring, and testing backups.
- Data Owners must ensure that critical business data within their remit is identified and included in backup plans.

### 4.2 Data to be Backed Up

- Critical business data, including databases, document management systems, user files, configurations, and cloud service data.
- System configuration files and documentation necessary for system recovery.
- Logs required for audit, compliance, and forensic investigations.

### 4.3 Backup Frequency and Retention

- Daily incremental backups must be performed for all critical systems.
- Full backups must be performed at least weekly.
- Backup retention periods must be defined according to the data classification and legal, regulatory, or contractual requirements:
    - **Critical Systems**: Retain full backups for a minimum of 90 days.
    - **Standard Business Data**: Retain backups for a minimum of 30 days unless otherwise required.
    - **Audit and Compliance Data**: Retention periods must meet regulatory requirements (e.g., 7 years for financial records).

### 4.4 Backup Storage

- Backups must be stored securely using encryption, both at rest and during transmission.
- At least one backup copy must be stored offsite or in a separate cloud region to protect against physical disasters.
- Access to backup media must be restricted to authorised personnel only.
- Backup media must be labelled clearly, and media rotation schedules must be established.

### 4.5 Backup Security

- All backups must be protected from unauthorised access, alteration, theft, or destruction.
- Backup encryption keys must be securely stored and managed according to the Key Management Policy.
- Media disposal must be performed securely, using methods appropriate to the sensitivity of the information (e.g., shredding, degaussing, secure wiping).

### 4.6 Testing and Verification

- Backups must be tested at least quarterly to verify the ability to restore data and systems successfully.
- Recovery testing must include both partial (file-level) and full-system recovery tests.
- Testing results must be documented and reviewed by the Information Security Manager.

### 4.7 Cloud and SaaS Backup

- Data stored in Software-as-a-Service (SaaS) platforms must be protected by verified backup processes, either through the provider's backup services or independent solutions.
- Cloud services must be evaluated for their backup and disaster recovery capabilities during procurement and vendor assessment.

### 4.8 Incident Response

- In the event of data loss, backups must be used to restore information to meet RPO and RTO targets defined in the Business Continuity Plan.
- Backup failures must be logged as security incidents and investigated.

### 4.9 Documentation

- Detailed backup schedules, procedures, media inventories, recovery procedures, and backup testing results must be maintained and regularly reviewed.
- A Backup Register must be maintained, listing all systems and data included in backups, backup locations, frequency, and responsible persons.

### 4.10 Training and Awareness

- Staff involved in backup operations must receive appropriate training to understand backup processes, security requirements, and recovery procedures.
- General security awareness training for all employees must include the importance of data protection and backup integrity.

## 5. Exceptions

Any exceptions to this policy must be formally documented and authorised by the Information Security Manager following a risk assessment.

## 6. Enforcement

Violations of this policy may result in disciplinary action, up to and including termination, and may involve legal penalties where applicable.

## 7. Related Documents

- Information Security Policy
- Business Continuity and Disaster Recovery Plan
- Information Classification and Handling Policy
- Access Control Policy
- Encryption and Key Management Policy

## 8. Policy Review

This policy must be reviewed at least annually or following significant changes to the organisation’s infrastructure, backup technologies, or business operations.

---

System / Data Type: What you're backing up (system, data set, application).

Data Owner: Responsible person for ensuring backups are happening.

Backup Frequency: How often backups occur.

Backup Type: Full, incremental, differential, or snapshots.

Retention Period: How long backups are kept before they are deleted.

Storage Location: Where backups are physically or virtually stored.

Encryption Applied: Whether data is encrypted at rest/in transit.

Backup Verified (Y/N): Whether backup integrity and restoration have been tested.

[Backup verification schedule](Backup%20&%20Recovery%20Policy/Backup%20verification%20schedule%201e2d6625c6798073b530c1ac820d2177.csv)

# 1. Purpose and Scope

This policy establishes guidelines for the secure destruction, retention, and backup of media at Green Orbit Digital to protect sensitive information and ensure business continuity. It applies to all employees, contractors, and third parties who handle company data.

# 2. Media Destruction

When media is no longer needed, it must be securely destroyed to prevent unauthorized access to sensitive information.

## 2.1 Digital Media Destruction

- All digital data must be permanently deleted from systems and devices using secure deletion methods
- Physical storage devices must be destroyed or wiped using approved methods
- Records of disposal must be maintained, including details of the data disposed, method of disposal, and date

## 2.2 Physical Media Destruction

- Paper documents containing sensitive information must be shredded using cross-cut shredders
- Physical storage devices must be securely locked away until destruction

# 3. Data Retention

Data must only be stored for as long as necessary to fulfill its purpose, based on business, legal, or regulatory requirements.

## 3.1 Retention Guidelines

- Regular audits will be conducted to identify unused or redundant data that can be deleted or archived
- Retention periods will be established for different categories of data
- Retention periods will be regularly reviewed and updated as needed

# 4. Backup Strategy

Green Orbit Digital implements a 3-2-1 backup strategy:

- 3 copies of data
- 2 copies stored onsite
- 1 copy stored offsite

## 4.1 Onsite Backups

Regular backups must be performed to ensure data can be restored in case of loss or corruption.

- All backups must be encrypted
- Access to backup systems must be restricted based on user roles
- Backup systems must be regularly tested to ensure data can be recovered

## 4.2 Offsite Backups

- Offsite backups must be stored in geographically separate locations
- Cloud storage providers must be evaluated for compliance with data protection regulations
- Encryption must be used for data in transit and at rest

# 5. Roles and Responsibilities

The following roles are responsible for implementing this policy:

- Information Governance Officer (IGO): Oversees policy implementation and ensures compliance
- IT Department: Implements and maintains secure backup systems and performs regular backups
- Employees: Follow policy guidelines and report any security incidents immediately

# 6. Review and Updates

This policy will be reviewed annually or when significant changes occur. Updates will be made as needed to reflect changes in business requirements or regulatory environment.

# 7. Contact Information

For questions or clarification about this policy, contact:

Policy Owner: Ryan Laird

Management Function: Security
