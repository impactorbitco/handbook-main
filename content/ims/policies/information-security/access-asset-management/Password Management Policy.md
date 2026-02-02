---
title: Password Management Policy
Verification: Expired
Owner: Ryan Laird
Company Handbook: No
Created time: 24 March 2025 10:40
ID: POL-60
IMS: Information Security Management System (https://www.notion.so/Information-Security-Management-System-1b5d6625c67980228168d60bad8c1c14?pvs=21)
Last edited time: 16 October 2025 21:14
Parent item: Data Handling & Security Policy (Data%20Handling%20&%20Security%20Policy%201c0d6625c679812a8c51c544b53c58b7.md)
Purpose/Scope: Specifies authentication requirements.
Status: Not started
Version Number: 1.1

---

## 1. Introduction

At Impact Orbit Creative Group, the protection of our sensitive business data and personal information relies heavily on secure password practices. With the increasing threat of cybercrime, particularly the harvesting of usernames, passwords, and financial details, strong password management is essential. Criminals exploit weak passwords to launch attacks, steal identities, and disrupt operations.

This Password Policy outlines our approach to creating, managing, storing, and sharing passwords securely. It combines best practice guidelines with our mandatory use of **1Password**, our trusted password management platform.

## 2. Purpose

This policy is designed to:

- Ensure strong, secure password practices are consistently followed.
- Protect Impact Orbit Creative Group’s digital assets, systems, and sensitive information.
- Establish clear guidelines for generating, managing, storing, and sharing passwords.
- Promote secure behaviours that mitigate the risk of password-related breaches.

## 3. Scope

This policy applies to all employees, contractors, consultants, and third parties who access Impact Orbit Creative Group’s systems, networks, and data—whether using company-issued or personal devices for work purposes.

## 4. Understanding the Importance of Password Security

Passwords are valuable targets for criminals. Stolen credentials can be used for:

- Fraudulent purchases and identity theft.
- Unauthorised access to systems.
- Launching additional attacks.
- Selling on criminal marketplaces.

**Statistics**:

According to Breach Alarm, over **one million passwords are stolen every week**. Cybercriminals use automated systems to rapidly attempt combinations of usernames and passwords across many platforms ("credential stuffing").

To defend against these threats, we must adopt robust password hygiene practices.

## 5. Password Creation Guidelines

When creating passwords:

- **Length and Complexity**: Passwords must be at least **12 characters** long, including uppercase and lowercase letters, numbers, and special characters.
- **Avoid Personal Information**: Never include identifiable information (e.g., names, birthdays, favourite sports teams).
- **Use Passphrases**: Prefer longer passphrases (e.g., combinations of random words) that are easy to remember but difficult to guess.
- **Unique Passwords for Each Account**: Never reuse passwords across multiple accounts, especially critical or sensitive ones.
- **Change Default Credentials**: Always replace manufacturer-default usernames and passwords immediately.

## 6. Password Storage and Management

- **Use of 1Password**: All work-related credentials must be securely stored in **1Password**, our designated password manager.
- **Password Vaults**: Every employee must maintain a secure vault for storing passwords. Personal accounts used for work purposes should also be stored securely.
- **Master Password**: Your 1Password master password must be strong and must never be shared.

## 7. Password Sharing Practices

- **Secure Sharing**: If passwords must be shared, only 1Password’s secure sharing function must be used.
- **No Unencrypted Transmission**: Passwords must never be shared via email, text messages, or unencrypted methods.
- **Access Control**: Share access only with those who require it. Permissions must be reviewed regularly.

**Remember**: Sharing usernames and passwords outside secure systems undermines accountability and increases risk.

## 8. Password Maintenance and Updates

- **Regular Updates**: Update passwords at least **every 90 days** for critical accounts.
- **Immediate Changes for Compromised Accounts**: If you suspect a password has been compromised, change it immediately and report the incident to IT.
- **1Password Prompts**: Follow prompts from 1Password suggesting when to change weak or reused passwords.

## 9. Multi-Factor Authentication (MFA)

- **Mandatory MFA**: MFA must be enabled wherever possible, especially on critical systems and high-risk accounts.
- **1Password Support**: 1Password supports MFA, and all employees are encouraged to activate it for all supported accounts.

MFA significantly strengthens account security by requiring a second method of verification beyond just the password.

## 10. Password Recovery and Emergency Access

- **Lost Passwords**: Employees should follow 1Password’s secure recovery procedures if they forget their master password or experience access issues.
- **Emergency Procedures**: IT has established a secure process for emergency access to critical accounts, with full documentation of any access provided.

## 11. Account Lockout and Monitoring

- **Lockout Protocol**: Multiple unsuccessful login attempts will trigger account lockouts. Contact IT to regain access.
- **Monitoring**: Login attempts and account activities are regularly monitored to detect suspicious behaviour and protect our systems.

## 12. Training and Awareness

- **Employee Training**: All employees must complete training on secure password creation, 1Password usage, and overall password hygiene.
- **Continuous Awareness**: Impact Orbit Creative Group will provide regular updates, reminders, and best practice guidance regarding password security.

## 13. Compliance and Auditing

- **Regular Audits**: The IT department will perform regular audits of password practices and 1Password usage.
- **Non-Compliance**: Breaches of this policy may result in disciplinary action, including loss of system access or, in serious cases, termination of employment.

## 14. Policy Review and Updates

This policy will be reviewed **annually**, or more frequently if necessary, in response to changes in technology, security threats, or business needs. Updates will be communicated to all employees.

## 15. Conclusion

By following this Password Policy, Impact Orbit Creative Group strengthens its defence against cyber threats and protects the integrity of our operations. The adoption of 1Password ensures that passwords are stored securely, shared safely, and managed efficiently across the organisation.

---

**Approved by:**

[Name]

[Position]

Impact Orbit Creative Group

**Date:**

[Approval Date]

Here’s a **comprehensive Password Policy** aligned with **IASME Cyber Essentials Step 9 (Use of Passwords)**, **NCSC guidance**, and **ISO 27001 Annex A.9 (Access Control)**. It is written for organisational use — suitable for inclusion in Impact Orbit Creative Group’s information security documentation or Cyber Essentials submission.

---

# 🔐 Password Policy

**Version:** 1.0

**Effective Date:** [Insert Date]

**Approved By:** Information Security Lead

**Review Cycle:** Annually or following a major security incident

---

## **1. Purpose**

This policy defines how Impact Orbit Creative Group manages passwords to protect access to systems, applications, and data.

It ensures compliance with **IASME Cyber Essentials**, **UK GDPR**, and **NCSC security principles**, and supports the transition toward **passwordless authentication** where technically feasible.

---

## **2. Scope**

This policy applies to:

- All employees, contractors, and third parties with access to Impact Orbit Creative Group systems, networks, or cloud services.
- All user accounts (local, cloud, and federated) and privileged accounts.
- All devices including desktops, laptops, mobile devices, and servers.

---

## **3. Principles**

1. Every user must have a **unique username and password** — shared accounts are prohibited.
2. **Default passwords** on all systems and devices must be changed before use.
3. Passwords must be managed securely, stored only in **approved password managers**, and never written down or shared.
4. Passwords are part of layered authentication — **Multi-Factor Authentication (MFA)** must be enabled wherever supported.
5. Systems must implement **technical controls** to enforce strong password creation, protect against brute-force attacks, and log authentication attempts.

---

## **4. Password Creation Requirements**

### **4.1 General Standards**

All user passwords must:

- Contain a **minimum of 12 characters** (preferably 14+).
- Include a **combination of letters, numbers, and symbols**, or be a **memorable passphrase** of at least 3 unrelated words (e.g., *planet-green-tea99*).
- **Not reuse** passwords from other accounts, personal or professional.
- Avoid easily guessed content such as names, birthdays, “password123”, or company-related terms.
- Be unique to each system or application.

### **4.2 Administrator and Privileged Accounts**

- Require **15+ characters** or **passphrases**.
- Must be **distinct from standard user credentials**.
- MFA is **mandatory** for all administrative access.
- Should not be used for day-to-day non-administrative tasks.

---

## **5. Technical Controls**

The following controls must be implemented on all systems where feasible:

| Control | Requirement |
| --- | --- |
| **Password Expiry** | No routine expiry; passwords changed only when compromised or per risk review (per NCSC guidance). |
| **MFA Enforcement** | Mandatory for cloud services, admin accounts, and remote access. |
| **Lockout Thresholds** | Accounts locked after 10 unsuccessful login attempts within 10 minutes. |
| **Password History** | Minimum of 5 previous passwords remembered to prevent reuse. |
| **Hashing and Encryption** | Passwords stored using strong cryptographic hashing (e.g., bcrypt, PBKDF2, or Argon2). |
| **Session Timeout** | Automatic session lock after 15 minutes of inactivity. |
| **Monitoring & Logging** | Authentication events logged and reviewed regularly for anomalies. |

---

## **6. Password Management Tools**

- Users must use the **approved enterprise password manager** (e.g., 1Password Business) for storing and sharing credentials securely.
- Shared credentials (where unavoidable for third-party integrations) must:
    - Be documented in the **Access Control Register**.
    - Have restricted access based on job function.
    - Be rotated quarterly or after personnel changes.

---

## **7. Passwordless Authentication**

Impact Orbit Creative Group actively supports a **transition to passwordless authentication** technologies (e.g., FIDO2, biometrics, passkeys).

Where passwordless solutions are deployed:

- At least **two authentication factors** must be used (something you are, have, or know).
- Authentication tokens must be **encrypted** and **device-bound**.
- Regular **security reviews** must validate the integrity of the authentication methods.

---

## **8. Compromised Passwords and Incident Response**

If a user suspects that a password has been compromised:

1. They must **change the password immediately** using secure self-service tools.
2. Report the incident to [**security@greenorbit.space**](mailto:security@greenorbit.space) or their line manager.
3. The IT team must:
    - Revoke active sessions and tokens.
    - Investigate for signs of breach or lateral movement.
    - Reset all associated credentials if compromise is confirmed.

All password-related incidents must be recorded in the **Security Incident Log** and reviewed post-incident.

---

## **9. Employee Guidance and Training**

All staff will receive periodic training on:

- Creating strong passwords and avoiding reuse.
- Using passphrases over complex short passwords.
- Recognising phishing or credential-stealing attempts.
- Managing passwords safely in digital environments.

New starters receive this guidance during onboarding.

---

## **10. Enforcement**

Failure to comply with this policy may result in:

- Temporary suspension of account access.
- Disciplinary action under the organisation’s security breach policy.

IT administrators and department heads are responsible for enforcing compliance within their teams.

---

## **11. Review and Updates**

This policy is reviewed:

- **Annually**, or
- After any major change in authentication technology, or
- Following a password-related incident or NCSC guidance update.

All updates must be approved by the **Information Security Lead** and **Managing Director**.

---

## **12. Related Documents**

- Access Control Policy
- Incident Response Plan
- Cloud Services Register
- Information Security Policy
- Cyber Essentials – Five Core Controls

---

### ✅ **Summary of Key Practices**

| Category | Requirement |
| --- | --- |
| Unique accounts | Each user has an individual login |
| MFA | Enabled for all cloud and admin accounts |
| Default passwords | Must be changed immediately |
| Password length | ≥12 characters (≥15 for admin) |
| Storage | Encrypted; stored only in password manager |
| Monitoring | Failed attempts logged and reviewed |
| Passwordless | Encouraged and supported where possible |

---

Would you like me to format this into a **company-branded policy document (Word or PDF)** for Impact Orbit Creative Group — complete with sections for approval signatures, version control, and Cyber Essentials references?
