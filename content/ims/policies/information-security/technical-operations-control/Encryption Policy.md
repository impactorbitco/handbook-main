---
title: Encryption Policy
Verification: Expired
Owner: Ryan Laird
Company Handbook: false
Created time: 22 April 2025 18:21
ID: POL-2
IMS: Information Security Management System 
Last edited time: 7 October 2025 18:46
Parent item: Data Handling & Security Policy 
Status: Not started
Sub-item: Secure Use of Cryptography 
Version Number: 1.1
weight: 10
---
## 1. Purpose and Scope

This policy establishes requirements for cryptographic controls to protect the confidentiality, integrity, and authenticity of Green Orbit Digital's information assets. It applies to all employees, contractors, and systems that utilize cryptographic technologies.

## 2. Approved Cryptographic Standards

### 2.1 Encryption Algorithms

- Symmetric Encryption: AES-256 or higher
- Asymmetric Encryption: RSA (minimum 2048 bits), ECC (minimum 256 bits)
- Hash Functions: SHA-256 or higher

### 2.2 Transport Layer Security

- TLS 1.2 or higher required for all secure communications
- Weak cipher suites and protocols (SSL, TLS 1.0, TLS 1.1) are prohibited

## 3. Key Management

### 3.1 Key Generation

- Cryptographic keys must be generated using approved random number generators
- Keys must meet minimum length requirements as specified in section 2.1
- Key generation must occur in secure environments

### 3.2 Key Storage

- Keys must be stored in secure, encrypted formats
- Access to cryptographic keys must be restricted based on the principle of least privilege
- Master keys must be stored in hardware security modules (HSMs) where available

### 3.3 Key Rotation

- Encryption keys must be rotated at least annually
- Keys must be immediately rotated if compromise is suspected
- Deprecated keys must be securely archived or destroyed

## 4. Data Protection Requirements

### 4.1 Data at Rest

The following data must be encrypted at rest:

- All confidential and restricted information as defined in the Data Classification Policy
- Personal data subject to GDPR and UK DPA 2018
- Authentication credentials and security tokens
- Encryption keys and certificates

### 4.2 Data in Transit

The following must be encrypted during transmission:

- All data transmitted over public networks
- Remote access connections (VPN)
- Email containing sensitive information
- File transfers containing confidential or restricted data

## 5. Implementation Requirements

- All cryptographic implementations must be performed using validated cryptographic modules
- Custom cryptographic implementations are prohibited without security review and approval
- Third-party cryptographic services must be evaluated and approved before use
- Regular testing of cryptographic implementations must be conducted

## 6. Roles and Responsibilities

Information Security Officer:

- Maintains and updates cryptographic standards
- Approves cryptographic implementations
- Oversees key management processes

IT Team:

- Implements approved cryptographic controls
- Manages key rotation and storage
- Monitors cryptographic systems

## 7. Compliance and Monitoring

- Regular audits of cryptographic implementations
- Annual review of cryptographic standards and algorithms
- Monitoring of encryption key usage and rotation
- Documentation of all cryptographic assets and processes

## 8. Version History

| **Version** | **Date** | **Changes** | **Approved By** |
| --- | --- | --- | --- |
| 1.0 | 2025-04-22 | Initial policy creation | Pending |

# Data Masking and Encryption Policy

## Purpose

The purpose of this policy is to establish a framework for data masking and encryption practices within the organization. This ensures the confidentiality, integrity, and availability of sensitive information, in alignment with the ISO/IEC 27001: Information Security Management System standards.

## Scope

This policy applies to all employees, contractors, and third-party entities who have access to the organization’s data. It covers all data storage, processing, and transmission activities, regardless of the platform, system, or environment.

## Objectives

- Protect sensitive and confidential data from unauthorized access.
- Ensure compliance with ISO/IEC 27001 standards for information security.
- Support the organization’s strategic direction (Level 1 – Strategic Direction) on data protection and information security.

## Definitions

- **Data Masking**: A process of obscuring specific data within a database to protect sensitive information while maintaining usability for testing or training.
- **Encryption**: The process of converting data into a coded format to prevent unauthorized access.

## Policy Statement

The organization is committed to the following principles for data masking and encryption:

1. **Data Masking**: Sensitive data used in non-production environments (e.g., testing and development) must be masked to ensure that it cannot be traced back to real individuals or systems.
2. **Encryption**: The organization requires the use of strong encryption techniques for all sensitive data at rest and in transit. This includes compliance with the Encryption & Key Management Policies.
3. **Key Management**: Encryption keys must be managed securely and in alignment with the organization's Encryption & Key Management Policies to prevent unauthorized decryption of data.

## Responsibilities

- **Policy Owner**: Ryan Laird is responsible for maintaining and updating this policy.
- **All Employees**: Employees must adhere to this policy and ensure data handling practices comply with the organization’s standards and guidelines.
- **IT Department**: Responsible for implementing encryption and masking technologies, as well as ensuring compliance with ISO/IEC 27001 requirements.

## Compliance and Verification

This policy aligns with ISO/IEC 27001: Information Security Management System standards and is classified under A.5.1 - Policies for Information Security. Verification has been completed, and the policy is currently in review.

## Related Documents

For additional guidance, refer to the following documents:

- [Encryption & Key Management Policies]
- [Data Handling Guide]

## Policy Review and Maintenance

This policy will be reviewed annually or as needed based on changes in regulatory requirements, standards, or organizational priorities. The last review and edits were made by Ryan Laird on May 1, 2025.

## Version Control

- Version: 1.1
- Status: In Review
- Publishing Status: In Progress
- Priority Level: Low

## Contact

For more information or clarification regarding this policy, please contact Ryan Laird.

---

This document serves as a preliminary draft and is subject to final approval.
