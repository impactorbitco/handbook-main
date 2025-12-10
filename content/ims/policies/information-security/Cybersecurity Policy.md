---
title: Cybersecurity Policy
Verification: Expired
Owner: Ryan Laird
Company Handbook: false
Created time: 20 April 2025 18:56
GRI Disclosures: 418-1 Substantiated complaints concerning breaches of customer privacy
  and losses of customer data (https://www.notion.so/418-1-Substantiated-complaints-concerning-breaches-of-customer-privacy-and-losses-of-customer-data-1dad6625c6798038b6aae44bb8e7a4fb?pvs=21),
  417-3 Incidents of non-compliance concerning marketing communications (https://www.notion.so/417-3-Incidents-of-non-compliance-concerning-marketing-communications-1dad6625c67980eb851ecefcc13bc48d?pvs=21)
ID: POL-3
IMS: Information Security Management System (https://www.notion.so/Information-Security-Management-System-1b5d6625c67980228168d60bad8c1c14?pvs=21)
Last edited time: 7 October 2025 19:16
Parent item: Data Handling & Security Policy (Data%20Handling%20&%20Security%20Policy%201c0d6625c679812a8c51c544b53c58b7.md)
Status: Not started
Version Number: 1.1
weight: 10
---
# Cybersecurity Policy

# 1. Executive Summary

This Cyber Security Policy defines Green Orbit Digital’s commitment to protecting its information systems, data, and business operations against cyber threats. It outlines the security controls, employee responsibilities, and technical measures in place to meet the UK Cyber Essentials framework and ensure ongoing compliance with GDPR, ISO 27001, and other relevant standards.

---

# 2. Policy Purpose

The purpose of this policy is to:

- Protect the confidentiality, integrity, and availability of information.
- Comply with UK Cyber Essentials, GDPR, and ISO 27001 standards.
- Minimise the risk of cybersecurity breaches and associated business disruption.
- Set out responsibilities for cyber hygiene across the organisation.

---

# 3. Scope

This policy applies to:

- All employees, contractors, consultants, partners, and third parties.
- All systems, devices, networks, cloud services, and information assets.
- All locations including remote, hybrid, and office-based environments.

---

# 4. Cyber Security Principles (Cyber Essentials Requirements)

Green Orbit Digital’s cyber security framework is based on the five Cyber Essentials controls:

## 4.1 Firewalls and Secure Internet Gateways

### **Introduction**

At Green Orbit Digital, safeguarding the confidentiality, integrity, and availability of information is fundamental to our business and sustainability values. To minimise exposure to external threats, we apply strict controls at the boundary of our networks. This helps prevent unauthorised access, block malicious traffic, and ensure only business-critical data flows in and out of our systems.

Boundary protection includes the use of firewalls, secure gateways, and access rules that align with ISO/IEC 27001 requirements — specifically A.8.20–A.8.23 — to maintain secure communications across public and internal networks.

### **Implementation Approach**

Green Orbit Digital ensures that:

- **All external network traffic** is managed through boundary firewalls or secure gateways that are actively maintained and monitored. These controls are designed to deny by default and only allow explicitly authorised services and protocols.
- **Only required inbound and outbound connections** are permitted, and these are defined based on business need and reviewed quarterly.
- **Firewall and gateway configurations** are subject to regular audits as part of our ISO 27001 ISMS cycle, with change management protocols ensuring that rule sets are kept up to date and documented.
- **Web traffic filtering** is implemented to block access to malicious or non-business-related websites, reducing the likelihood of phishing or malware infections.
- **Network segmentation** is applied where appropriate to separate administrative, client, and public-facing systems, reducing the potential impact of a breach.

### **Example in Practice**

To support our secure digital operations, access to Green Orbit Digital's cloud management platforms (e.g. HubSpot, Notion, and ISO compliance tools) is restricted to verified IP ranges and protected by a zero-trust network model. Any unauthorised access attempts are logged and reviewed as part of our security event monitoring process.

---

## 4.2 Secure Configuration

### **Introduction**

At Green Orbit Digital, we recognise that default system settings and configurations often include unnecessary services, insecure options, or excessive access permissions. These can create vulnerabilities if left unaddressed. As part of our ISO/IEC 27001-certified Information Security Management System (ISMS), we implement secure configuration practices to reduce risk across all devices, platforms, and applications we use.

This approach supports Annex A controls including A.8.9 (Configuration management), which requires secure settings to be established, documented, implemented, and maintained, and A.5.14, ensuring that security is built into systems from the outset of each project or deployment.

### **Implementation Approach**

Green Orbit Digital ensures:

- **All systems and devices** are securely configured before deployment. Default credentials are changed, unnecessary services are disabled, and only essential features are enabled.
- **Configuration baselines** are established and reviewed regularly for all cloud services, laptops, mobile devices, web hosting, and project platforms (such as Notion and HubSpot).
- **System hardening guidelines** are followed based on vendor best practices and industry standards (e.g. NCSC, CIS Benchmarks), and these are documented within our ISMS.
- **Regular reviews and audits** of system configurations are conducted as part of change management and risk assessment processes, in accordance with ISO 27001 control requirements.
- **Patch management** is integrated into configuration controls to ensure software and firmware updates are applied promptly and consistently across all devices and virtual environments.
- **Administrative interfaces** are protected through the use of VPNs, IP whitelisting, multi-factor authentication (MFA), and strong logging controls.

### **Example in Practice**

When deploying a new cloud-based collaboration tool, Green Orbit Digital follows a standard onboarding checklist to disable unnecessary sharing features, enforce SSO/MFA, apply least privilege access controls, and document configuration decisions in our ISO 27001 asset register.

---

## 4.3 User Access Control

### **Introduction**

Effective user access management is essential for protecting the confidentiality, integrity, and availability of Green Orbit Digital’s information assets. By ensuring that access is restricted to authorised users and that their privileges are consistent with their roles, we mitigate the risk of unauthorized access and reduce the potential impact of security breaches.

In line with **ISO/IEC 27001 Annex A.9**, which covers **Access Control**, Green Orbit Digital implements processes to establish, monitor, and enforce access rights, ensuring that users can only access the information and systems they need to perform their roles.

### **Implementation Approach**

Green Orbit Digital implements the following access control measures:

- **Role-based access control (RBAC):** Access to systems, data, and applications is granted based on the user's role within the organisation, ensuring that users only have the minimum privileges necessary for their work.
- **User account management:** The organisation ensures that user accounts are created, modified, and removed in a controlled manner. Accounts for departing employees, contractors, or those whose roles change, are promptly deactivated to maintain access integrity.
- **Authentication and authorisation:** All users are required to authenticate using unique credentials before accessing organisational resources. This process is governed by our password management policy, which aligns with **ISO/IEC 27001** requirements, ensuring strong authentication mechanisms, including multi-factor authentication (MFA) for privileged accounts.
- **Privileged account management:** Special access privileges, such as administrator or root access, are strictly controlled. These accounts are subject to additional security measures, such as dedicated log-in methods, access logging, and the principle of least privilege.
- **Periodic access reviews:** User access rights are regularly reviewed as part of our internal auditing process, ensuring that access rights remain aligned with the user's current job responsibilities. Any access rights that are no longer necessary are revoked promptly.
- **Third-party access control:** Access rights for third parties, such as vendors or external collaborators, are closely monitored and limited to the specific systems and data required for their work. Third-party accounts are subject to the same principles as internal accounts and are governed by contractual agreements that mandate compliance with Green Orbit Digital’s security policies.

### **Example in Practice**

When onboarding a new employee at Green Orbit Digital, their access is provisioned based on the agreed role. If they join the marketing team, their access will be restricted to marketing tools such as HubSpot, content management systems, and any other applications they need, but not to sensitive financial or customer data unless explicitly required. A review of their access rights is carried out quarterly to ensure ongoing appropriateness, and unnecessary access is revoked when their role changes.

---

## 4.4 Malware Protection

### **Introduction**

Proper configuration management is crucial to safeguarding Green Orbit Digital’s IT infrastructure and ensuring the confidentiality, integrity, and availability of its information systems. Misconfigurations can lead to vulnerabilities that expose the organisation to risks, such as unauthorized access, data loss, or system outages. As part of Green Orbit Digital’s commitment to continuous improvement in information security, we adhere to **ISO/IEC 27001 Annex A.12** (Operations Security), ensuring secure configurations across all IT systems.

### **Implementation Approach**

Green Orbit Digital has implemented the following secure configuration measures to ensure all IT systems are configured in a secure and resilient manner:

- **Hardening of systems:** All devices, including servers, workstations, and network components, are configured with security in mind from the outset. This includes disabling unnecessary services, restricting user privileges, and applying security patches as soon as they are released. All configurations are reviewed regularly for compliance with industry best practices.
- **Secure baseline configurations:** Green Orbit Digital has established baseline configurations for all systems in scope. These baselines are based on security best practices (e.g., CIS Benchmarks) and are configured to minimise unnecessary functionality, thereby reducing the attack surface. The configurations are regularly updated to reflect new security patches and emerging threats.
- **Change management:** Configuration changes are managed through a formal change control process, in line with **ISO/IEC 27001 Annex A.12.1**. This ensures that any changes to system configurations are thoroughly reviewed, tested, and documented to mitigate potential risks introduced by the changes.
- **Regular audits and reviews:** Configurations are periodically audited to ensure compliance with security policies and baseline standards. Any deviations or non-compliance with the established configuration standards are promptly addressed.
- **Encryption and security controls:** Sensitive information stored on devices is encrypted using industry-standard encryption methods. The configuration of these devices ensures that encryption is enabled by default to protect data at rest and in transit.
- **Network configuration security:** Network devices, such as firewalls, routers, and switches, are configured to ensure secure access control, proper segmentation, and protection against external threats. This includes using secure protocols and implementing access control lists (ACLs) to restrict access to sensitive systems.

### **Example in Practice**

When setting up new workstations for employees at Green Orbit Digital, the devices are configured according to the approved security baseline, which includes enabling full disk encryption, setting up firewalls, and configuring user access controls. These devices are automatically updated with the latest security patches and configurations as part of the organization's ongoing patch management process. Any changes to the device configurations, such as the installation of new software or system updates, are reviewed and approved before deployment.

---

### **4.5 Malware Protection**

**Aligned with ISO/IEC 27001 Annex A Controls**

### **Introduction**

Malware, including viruses, worms, ransomware, and spyware, poses a significant threat to the security and operational integrity of Green Orbit Digital’s information systems. Malicious software can compromise sensitive data, disrupt business operations, and cause financial and reputational damage. As part of our **ISO/IEC 27001** commitment, Green Orbit Digital adopts a proactive approach to malware protection by ensuring robust defences are in place across all systems.

To mitigate the risks associated with malware, we focus on two key objectives:

- Preventing malware from being delivered to devices.
- Preventing malware from executing on devices once delivered.

### **Implementation Approach**

Green Orbit Digital implements a comprehensive malware protection strategy as follows:

- **Anti-Malware Software:** Green Orbit Digital ensures that all devices, including servers, desktops, laptops, and mobile devices, have active and up-to-date anti-malware software. This software is configured to detect, block, and remove malicious software in real-time, as well as provide periodic system scans. Anti-malware software is kept updated to ensure it can protect against newly discovered threats, in line with vendor recommendations and **ISO/IEC 27001 Annex A.12.2** (Protection from Malware).
- **Application Control and Whitelisting:** Only approved applications are allowed to execute on Green Orbit Digital devices. This is achieved by implementing application whitelisting and code signing, which ensures that only vetted software can be installed or run. Unapproved or unsigned applications are blocked from executing, reducing the likelihood of malware infection.
- **Regular Software Updates:** The anti-malware software and other security tools are regularly updated with the latest definitions and patches. Updates are applied promptly to ensure that any newly identified malware is effectively blocked before it can cause harm. This aligns with **ISO/IEC 27001 Annex A.12.6** (Technical Vulnerability Management) by ensuring vulnerabilities that could be exploited by malware are addressed in a timely manner.
- **Email and Web Filtering:** Green Orbit Digital employs robust email and web filtering solutions that block access to malicious websites and prevent potentially harmful email attachments or links from reaching employees. These filters are continuously updated with the latest threat intelligence to detect phishing attempts, malicious URLs, and harmful content.
- **User Training and Awareness:** Employees are trained on the risks associated with malware and phishing attacks. Regular security awareness campaigns are conducted to help staff recognise and avoid potential threats, such as suspicious email attachments, links, and downloads. This education supports **ISO/IEC 27001 Annex A.7** (Human Resource Security), ensuring that all users understand the importance of cybersecurity and their role in mitigating malware risks.

### **Example in Practice**

To safeguard against malware, Green Orbit Digital uses industry-leading anti-malware software on all devices, which is configured to automatically scan and block any malicious files or behaviours. Additionally, the company enforces application whitelisting to prevent the installation of unauthorized software, ensuring only trusted applications are executed. When an employee receives an email attachment, it is automatically scanned for malware by the email filtering system before being allowed to open. If the attachment is found to be potentially harmful, it is quarantined and reported to the IT team for review.

---

---

### **4.6 Backup and Restoration**

**Aligned with ISO/IEC 27001 Annex A Controls**

### **Introduction**

Data loss, whether due to accidental deletion, hardware failure, malware, or natural disasters, can significantly disrupt business operations and lead to financial and reputational damage. To minimise these risks, Green Orbit Digital has established a comprehensive backup and restoration policy that ensures critical data is regularly backed up, securely stored, and can be rapidly restored when necessary. This approach is essential for business continuity and aligns with **ISO/IEC 27001 Annex A.17** (Information Security Aspects of Business Continuity Management).

### **Backup Policy and Procedures**

Green Orbit Digital has implemented an effective backup system to safeguard critical information, enabling quick recovery in case of data loss. The backup process follows a structured approach:

- **Regular Backups:** Green Orbit Digital performs regular backups of all critical data, applications, and system configurations. These backups are scheduled to ensure that the latest versions of business-critical files and systems are always available for restoration. The frequency of backups varies depending on the data type, but at a minimum, backups are performed daily.
- **Offsite and Cloud Backups:** Backups are stored both onsite and offsite, with cloud storage as the primary offsite backup method. The cloud backup solution is configured to ensure secure, encrypted storage of backups, ensuring that data is protected even in the event of physical damage to onsite infrastructure. This aligns with **ISO/IEC 27001 Annex A.12.3** (Backup).
- **Encryption and Security:** All backup data is encrypted using strong encryption algorithms both in transit and at rest to protect against unauthorized access. This meets the requirements of **ISO/IEC 27001 Annex A.10** (Cryptography) for securing sensitive data during storage and transfer.
- **Automated and Monitored Backups:** Backup processes are automated, reducing the potential for human error and ensuring consistency across all backup sets. The backup system is monitored regularly to ensure that backups are successful and that any failures are promptly addressed. Alerts are generated for failed backups, ensuring they are resolved quickly.
- **Retention and Versioning:** Green Orbit Digital maintains multiple versions of backups to ensure that data can be restored to specific points in time. Backup retention policies are in place to manage the duration of backup storage, balancing the need for historical data and the constraints of storage capacity.

### **Restoration Process**

In the event of data loss or corruption, it is essential that Green Orbit Digital can quickly restore data and systems to their operational state. The restoration process is designed to be efficient, minimising downtime and ensuring business continuity:

- **Testing Restoration:** Regular restoration tests are conducted to ensure that backup data can be successfully restored when needed. These tests verify the integrity and reliability of backups and help identify any issues with the restoration process in advance.
- **Defined Recovery Point Objectives (RPO) and Recovery Time Objectives (RTO):** Green Orbit Digital has established clear RPO and RTO for different systems and data types. These objectives ensure that critical systems are restored within an acceptable time frame and that the most recent data is recovered.
- **Emergency Recovery:** In the event of a major incident such as a cyber attack or disaster, Green Orbit Digital has an emergency recovery plan in place. This plan includes detailed procedures for restoring business-critical systems and data quickly and efficiently.

### **Example in Practice**

For instance, if a file server experiences a hardware failure, Green Orbit Digital can restore the server's data from the most recent cloud backup within a few hours. The IT team will initiate the restoration process from the encrypted cloud backup, ensuring that all files are restored to their most recent versions. In case of a ransomware attack, a clean version of the system can be restored, avoiding the need to pay a ransom while ensuring that business operations resume quickly.

---

This concludes the rewritten version of **Section 4.6: Backup and Restoration**. Would you like to proceed with **Section 4.7** or make any further changes?

---

# 5. Current Security Controls

### 5.1 Technical Controls

- Multi-factor authentication (MFA) enforced on all critical accounts.
- Encryption for data at rest and in transit.
- Secure cloud services with appropriate security configurations.
- Regular vulnerability assessments and penetration testing.
- Network monitoring and intrusion detection systems.

### 5.2 Administrative Controls

- Documented security policies and procedures.
- Cybersecurity awareness and phishing training for all staff.
- Clear access control procedures for onboarding and offboarding employees.
- Incident response plan detailing detection, reporting, and recovery steps.

### 5.3 Physical Controls

- Restricted access to offices and sensitive areas.
- Secure storage for devices and backup media.
- Environmental protections such as fire alarms and temperature controls.

---

# 6. Risk Assessment

Key identified risks:

- Cybersecurity threats including phishing, ransomware, and unauthorised access.
- Potential data breaches affecting sensitive information.
- Business disruption from system downtime or attacks.
- Non-compliance with regulatory requirements.

Risk mitigation includes regular assessments, incident simulation exercises, and ongoing improvements to technical defences.

[Risk and Compliance](https://www.notion.so/Risk-and-Compliance-1ded6625c67980f6af96c7ebbabe2506?pvs=21) [Risk register](https://www.notion.so/Risk-register-1c0d6625c67981319a23e7ae3533a088?pvs=21) 

---

# 7. Compliance Status

Green Orbit Digital currently maintains compliance with:

- **GDPR** — General Data Protection Regulation for personal data handling.
- **ISO 27001** — Best practices for information security management.
- **Cyber Essentials** — Core UK cyber hygiene certification.
Further external certifications may be pursued as the security program matures.

---

# 8. Employee Responsibilities

All users must:

- Follow password management policies (e.g., using 1Password).
- Complete cybersecurity awareness training annually.
- Report any suspected incidents or vulnerabilities immediately.
- Protect devices and data, especially when working remotely.

Failure to comply may result in disciplinary action, including dismissal where necessary.

---

# 9. Incident Response

- All security incidents must be reported promptly to the designated security team.
- Incidents will be triaged, investigated, and documented following the incident response plan.
- Post-incident reviews will be conducted to identify lessons learned and improvements.

---

# 10. Monitoring and Review

- Security monitoring tools are used to detect suspicious activity.
- Policies and controls are reviewed at least annually, or after any major incident.
- Vulnerability scans and penetration tests are conducted regularly.

---

# 11. Recommendations for Continuous Improvement

### Immediate Actions:

- Automate vulnerability scanning and remediation processes.
- Improve backup and disaster recovery testing.
- Strengthen access control reviews and audits.

### Short-Term Goals (3–6 months):

- Expand cybersecurity training with simulation exercises.
- Implement new security monitoring and threat intelligence tools.
- Formalise and test the incident response plan more frequently.

### Long-Term Strategy:

- Develop a comprehensive vendor risk management programme.
- Establish a culture of continuous improvement and security innovation.
- Integrate security metrics into broader business performance reporting.

---

## 12. Conclusion

By maintaining alignment with Cyber Essentials and related standards, Green Orbit Digital commits to safeguarding its digital assets, ensuring client trust, and protecting business operations against an ever-evolving cyber threat landscape.

---

**Approved by:**

[Name]

[Position]

Green Orbit Digital

**Date:**

[Approval Date]

---

**Notes:**

- This document should be reviewed and re-approved annually.
- New staff must receive an overview of this policy during onboarding.

---

Here’s an outline for a **Cybersecurity Policy** that incorporates UK Cyber Essentials technical controls and aligns with **ISO 27001** standards:

---

### **Cybersecurity Policy Outline for Green Orbit Digital**

### **1. Introduction**

Green Orbit Digital is committed to ensuring the confidentiality, integrity, and availability of its information systems, in line with industry best practices and regulatory requirements. This Cybersecurity Policy outlines the measures we take to protect our organisation’s IT infrastructure from cyber threats, safeguard sensitive data, and ensure business continuity.

This policy follows the UK **Cyber Essentials** technical controls and aligns with the **ISO/IEC 27001** Information Security Management System (ISMS) framework, which establishes a robust foundation for managing and securing information assets.

### **2. Purpose and Scope**

- **Purpose**: This policy aims to set clear guidelines and processes for safeguarding Green Orbit Digital’s digital infrastructure from cyber threats, ensuring compliance with applicable regulations, and mitigating risks that could impact business operations.
- **Scope**: This policy applies to all employees, contractors, third-party providers, and any other individuals with access to Green Orbit Digital’s information systems and data.

### **3. Governance and Responsibilities**

- **Information Security Manager**: Responsible for overseeing the implementation and management of this policy, as well as ensuring compliance with Cyber Essentials and ISO 27001.
- **All Employees**: Expected to adhere to the cybersecurity guidelines outlined in this policy and report any security concerns to the Information Security Manager.
- **Third Parties**: Contractors and external providers must comply with the cybersecurity measures outlined in this policy to maintain the security of Green Orbit Digital’s IT systems.

### **4. Cybersecurity Technical Controls**

### **4.1 Secure Configuration**

Green Orbit Digital ensures that all systems are securely configured to prevent unauthorised access. This includes:

- Implementing secure baseline configurations for all devices (computers, servers, routers, etc.).
- Regularly patching and updating software, operating systems, and firmware to close known vulnerabilities.
- Disabling unnecessary ports, services, and protocols that are not required for business purposes.

**ISO 27001 Controls:** A.9 Access Control, A.12 Operations Security

### **4.2 User Access Control**

User access to information systems is controlled through a strict access control mechanism:

- All users are assigned unique identifiers (usernames) and strong, multi-factor authenticated passwords.
- Access is granted based on the principle of least privilege, ensuring that users can only access systems and data necessary for their role.
- User access is reviewed periodically to ensure that it remains aligned with the user's role and responsibilities.

**ISO 27001 Controls:** A.9 Access Control, A.7 Human Resources Security

### **4.3 Malware Protection**

Green Orbit Digital utilises a layered approach to prevent, detect, and respond to malware threats:

- Anti-malware software is deployed across all devices, ensuring it is regularly updated and configured to prevent the execution of malicious code.
- Web and email traffic are filtered to block access to known malicious sites and attachments.
- All incoming emails and file downloads are scanned for malware.

**Cyber Essentials Controls**: Malware protection (including anti-malware software and secure email filtering)
**ISO 27001 Controls:** A.12 Operations Security, A.13 Communications Security

### **4.4 Patch Management**

Green Orbit Digital maintains a strict patch management policy to ensure that all software, operating systems, and devices are regularly updated to address vulnerabilities:

- Software updates and patches are applied promptly based on vendor recommendations.
- A defined process is in place to identify, test, and deploy patches for systems in the network.
- Unpatched vulnerabilities are tracked, with remediation prioritised based on risk assessments.

**ISO 27001 Controls:** A.12 Operations Security, A.14 System Acquisition, Development, and Maintenance

### **4.5 Firewalls and Network Security**

To prevent unauthorised access to the organisation’s networks, Green Orbit Digital implements the following:

- Firewalls are deployed to control incoming and outgoing network traffic based on predetermined security rules.
- Intrusion Detection and Prevention Systems (IDPS) are used to monitor network traffic for signs of malicious activity.
- Network segmentation is applied to separate critical systems from other networks.

**Cyber Essentials Controls:** Firewalls and secure configuration of routers
**ISO 27001 Controls:** A.13 Communications Security, A.14 System Acquisition, Development, and Maintenance

### **4.6 Secure Backup and Restoration**

Green Orbit Digital ensures the availability of critical data by implementing secure backup processes:

- Regular backups of all essential data, applications, and configurations are made and securely stored.
- Backups are encrypted and stored in multiple locations to prevent data loss in the event of a disaster or attack.
- A well-documented restoration process ensures that data can be quickly and efficiently restored if needed.

**Cyber Essentials Controls:** Backup and restoration
**ISO 27001 Controls:** A.17 Information Security Aspects of Business Continuity Management

### **4.7 Monitoring and Logging**

Monitoring of the organisation’s IT systems and networks is continuously performed to detect any potential threats:

- Logs are generated for all security-related events and stored securely for analysis and investigation.
- Regular reviews of security logs are performed to identify unusual patterns or indicators of compromise.
- Real-time alerts are set up for high-priority incidents that require immediate attention.

**ISO 27001 Controls:** A.16 Information Security Incident Management

### **5. Security Awareness and Training**

Green Orbit Digital conducts regular security awareness training for all employees to ensure that they:

- Understand the risks posed by cyber threats such as phishing, malware, and social engineering.
- Are trained to identify and report potential security incidents, including suspicious emails and activities.
- Know how to use security tools and practices, such as multi-factor authentication and secure password management.

**ISO 27001 Controls:** A.7 Human Resources Security, A.8 Asset Management

### **6. Incident Response**

In the event of a cybersecurity incident, Green Orbit Digital follows a clear incident response procedure:

- All security incidents are reported immediately to the Information Security Manager.
- The incident response team investigates, contains, and mitigates the impact of the incident.
- A post-incident review is conducted to identify lessons learned and improve future response protocols.

**ISO 27001 Controls:** A.16 Information Security Incident Management

### **7. Compliance and Auditing**

Green Orbit Digital conducts regular internal audits to assess the effectiveness of this policy and ensure compliance with UK Cyber Essentials and ISO 27001 standards:

- Regular security assessments and vulnerability scans are performed to identify potential weaknesses in our systems.
- Third-party audits and assessments are used to validate compliance with industry standards and regulatory requirements.
- Non-compliance or gaps in the cybersecurity posture are addressed through corrective action plans.

**ISO 27001 Controls:** A.18 Compliance

### **8. Policy Review and Updates**

This Cybersecurity Policy is reviewed annually to ensure its continued effectiveness in mitigating cybersecurity risks. Changes to the policy will be communicated to all employees and relevant stakeholders.

**ISO 27001 Controls:** A.18 Compliance

---

# **CYBERSECURITY POLICY**

| **Policy Number** | POL/SEC/2025/1438-V1.1 | **Date of Last Revision** | 5 December 2024 |
| --- | --- | --- | --- |
| **Effective Date** |  | **Version Number** | 1.0 |

Implemented November 2024  | Version 2.0

**1.	Introduction**

1.1Cyber security has been identified as a major risk for *[company name]* (the "company") and every employee and contractor needs to contribute for us to remain secure.

1.2The company has invested in technical cyber security measures, but we also need our employees and contractors to be vigilant and act to protect the company IT systems.

1.3This policy provides information about your role in keeping the company secure.

1.4Please contact *[name, role]* if you have any questions about cyber security.

1.5If you are an employee, this policy forms part of your employment contract. If you are a contractor, this policy forms a part of your contract of engagement. Any breach of this policy shall constitute a breach of contract.

**3.	Cyber security requirements**

3.1You must:

(a)choose strong passwords (the company's IT team advises that a strong password contains *[list of types of characters, password length etc. as permitted by your IT systems]*);

(b)keep passwords secret;

(c)never reuse a password; and

(d)never allow any other person to access the company's systems using your login details.

3.2You must not turn off or attempt to circumvent any security measures (antivirus software, firewalls, web filtering, encryption, automatic updates etc.) that the IT team have installed on your computer, phone or network or the company IT systems.

3.3You must report any security breach, suspicious activity, or mistake you make that may cause a cyber security breach, to *[name, role]* by *[contact method]* within *[number]* minutes of the discovery or occurrence.

3.4You must only access work systems using computers or phones that the company owns. You may only connect personal devices to the [public] OR [visitor] Wi-Fi provided in *[location]*.

3.5You must not install software onto your company computer or phone. All software requests should be made to *[name, role]*.

3.6You should avoid clicking on links to unknown websites, downloading large files, or accessing inappropriate content using company equipment or networks.

**4.	Consequences of system misuse**

4.1The company considers the following actions to be a misuse of its IT systems or resources:

(a)any malicious or illegal action carried out against the company or using the company's systems;

(b)accessing inappropriate, adult or illegal content within company premises or using company equipment;

(c)excessive personal use of company IT systems during core working hours;

(d)removing data or equipment from company premises or systems without permission, or in circumstances prohibited by this policy;

(e)using company equipment in a way prohibited by this policy;

(f)circumventing technical cyber security measures implemented by the company's IT team; and

(g)failing to report a mistake or cyber security breach within *[number]* minutes of its occurrence or discovery.

4.2If you are an employee, misuse of the IT system will be referred to the human resources team and [may] OR [will] be considered misconduct or gross misconduct; if you are a contractor and are found to be misusing the company IT systems, your contract [may] OR [will] be terminated.

**Declaration**

I, *[individual's name]*, agree to use company IT systems only in the way this policy describes.

Signed by *[individual's name]*

........................................

---

**Free cyber security policy: drafting notes**

This free cyber security policy has been created by Emma Osborn of OCSRC to help small (especially new) businesses to create their first internal policy in relation to cyber security.

This policy is identical to our basic policy, except that it includes a Docular credit, and accordingly it covers only they basics. If you need more detail, you should look at the standard and premium versions of the document.

Issues covered in the policy include: (i) the legal nature of the policy; (ii) the consequences of a breach of the policy; (ii) specific rules of behaviour relating to passwords, technical security measures, breach reporting, personal devices and software installation.

This policy is restrictive rather than permissive.

**Clause 1: Introduction**

This section outlines the purpose of the policy, explaining to its users why they should be reading the document and engaging with the problem (and not just blindly accepting the terms and conditions).

**Clause 1.2**

This reinforces the responsibility of the employees - cyber security is about people avoiding making mistakes if possible. The policy is intended to educate or remind employees about the things they have to do to keep the company secure.

**Clause 1.4**

Optional element.

**Clause 1.5**

Optional element.

Usually a policy would be part of an employment contract or tied to a contractor agreement. This is because policies without teeth may be ineffective - just like any other contract, there needs to be a consequence for the signatory if they agree to, but don't abide by, its terms. If you're supplying this policy to volunteers in a charity or club then you should delete this term and instead focus on describing your concerns, because you'll be relying on goodwill.

**Clause 2: Credit**

**Clause: Free documents licensing warning**

Optional element. Although you need to retain the credit, you should remove the inline copyright warning from this document before use.

**Clause 3: Cyber security requirements**

The basic set of requirements gives organisations starting from scratch the opportunity to make a few small changes before working on a more complete cyber security policy. It's not complete, but out of the box it should help you to define user responsibilities and begin developing a culture of cyber security. It picks up on the most prolific cyber security problems, buying you time to develop something more precise.

**Clause 3.1**

Optional element.

Passwords represent the biggest risk of making mistakes that you allow your employees. It's really important that they get this right, and you should define a password policy within your organisation, so that you provide a consistent set of rules with each password you ask them to create.

**Clause 3.2**

Optional element.

There's nothing worse than thinking you've managed a risk, only to find that people are (non-maliciously) undoing your security. Causing a breach by circumventing security should have major consequences as it is an avoidable act.

**Clause 3.3**

Optional element.

This reinforces the responsibility of the employee and tells them whom to notify and how. You may wish to put the employee on a timer, to make sure that they know that this is urgent.

**Clause 3.4**

Optional element.

If your security approach is to create a secure bubble, entirely controlled by your IT team, then you need to make sure that employees don't bring unpermitted devices (and the associated threat of them containing malware) into that bubble. Some organisations maintain a "public" or visitor Wi-Fi facility in reception, breakout areas etc. to keep visitors happy and avoid employees trying to bring their devices in.

**Clause 3.5**

Optional element.

You might want to add contact details here if the person who installs software is not the person notified of cyber security issues.

**Clause 3.6**

Optional element.

**Clause 4: Consequences of system misuse**

This is where you need to be explicit about the teeth this policy holds. It might be written in a more accessible language, but it is part of a contract.

**Clause 4.1**

This list gives examples of purposes a system might be used for but that your IT or HR teams might consider misuse. This list should only include things you think are serious enough that if they occur would result in HR proceedings or the termination of a contract. You should add items as appropriate.

**Clause 4.2**

Be absolutely clear about the consequences of IT system misuse; otherwise, any HR proceedings etc. would be unfair on the employee.

**Clause: Declaration**

The declaration is important whenever this policy is used as part of a contract, because it provides proof that the employee has seen the document. Also, by requiring a signature you may increase the number of employees who actually read the policy.
