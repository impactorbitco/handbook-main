---
title: Firewall and Network Boundary Security Policy
Verification: Expired
Owner: Ryan Laird
Approved by: Ryan Laird
Company Handbook: false
Created time: 24 March 2025 10:40
ID: POL-193
IMS: IT Service Management System (https://www.notion.so/IT-Service-Management-System-1b5d6625c67980c9a30bd487bffe9a47?pvs=21),
  Information Security Management System (https://www.notion.so/Information-Security-Management-System-1b5d6625c67980228168d60bad8c1c14?pvs=21),
  Risk Management System (https://www.notion.so/Risk-Management-System-1b6d6625c67980bdb161f333b4bd4c00?pvs=21)
Last edited time: 16 October 2025 21:54
Processes: Incident Reporting (https://www.notion.so/Incident-Reporting-1e2d6625c67980df9288cd5a045947b8?pvs=21)
Select: Governance & Corporate Management
Status: In progress
Version Number: 1.1
weight: 10
---

## **1. Purpose**

This policy defines how Impact Orbit Creative Group implements and manages **firewalls and network boundary controls** to protect against unauthorised access, data loss, or malicious activity.

The purpose is to:

- Safeguard business assets from internal and external network threats.
- Ensure **secure configuration**, **ongoing management**, and **monitoring** of all firewalls and routers.
- Maintain compliance with **Cyber Essentials**, **IASME Governance**, and **ISO 27001 (Annex A.8.20)**.
- Support the organisation’s **risk management framework** and **incident response plan**.

---

## **2. Scope**

This policy applies to all:

- **Boundary and internal firewalls**, routers, and network gateways.
- **Cloud-based firewalls** (e.g. Cloudflare, AWS Security Groups).
- **Personal or host-based firewalls** on company laptops, servers, or virtual machines.
- **VPN endpoints** and **remote access devices** connecting to corporate systems.

It covers both **physical** and **virtual** assets listed within the **Asset Register**.

---

## **3. Definitions**

- **Boundary Firewall** – The first layer of defence between the internet and the corporate network (e.g., router, UTM appliance).
- **Host Firewall** – Software firewall installed on individual devices (e.g., Windows Defender Firewall, macOS Firewall).
- **Access Control List (ACL)** – Set of rules defining allowed and denied traffic.
- **Open Port** – A network port configured to accept connections; potential attack vector if left unmanaged.

---

## **4. Policy Statements**

### **4.1 Configuration and Deployment**

- All firewalls **must be configured securely prior to deployment**.
- Default manufacturer credentials **must be changed immediately**.
- **Inbound connections** are **denied by default**, with access granted **only by explicit rule**.
- **Outbound connections** are restricted to required services (e.g., DNS, HTTPS, VPN).
- Firewalls must support and use:
    - Stateful Packet Inspection (SPI)
    - Intrusion Detection/Prevention (IDS/IPS)
    - Logging and audit capabilities

---

### **4.2 Access Control**

- Administrative access is restricted to **authorised IT staff only**.
- All admin accounts use **unique credentials stored in 1Password Business** under the “Network & Infrastructure” vault.
- Access must be via **secure protocols (SSH/HTTPS/VPN)**.
- Shared or generic administrator accounts are **not permitted**.
- Accounts are **revoked immediately** upon staff departure or role change.

---

### **4.3 Updates and Patching**

- Firewall firmware and security software updates must be:
    - Checked **monthly** for new releases.
    - Applied **within 14 days** of vendor release or as per risk level.
- Unsupported or end-of-life devices (as recorded in the Asset Register) must be **replaced or segmented**.

---

### **4.4 Monitoring and Logging**

- Firewalls must log:
    - Administrative access attempts.
    - Denied or suspicious traffic.
    - Configuration changes.
- Logs are retained for **12 months** and stored in **encrypted Proton Drive folders**.
- Quarterly reviews are conducted by the **IT Security Lead** to identify anomalies.
- Alerts are configured for:
    - Excessive outbound traffic.
    - Repeated failed logins.
    - Changes outside of scheduled maintenance windows.

---

### **4.5 Port and Protocol Management**

- Only necessary ports are opened.
- All non-essential or legacy ports are **closed and documented**.
- Any required exceptions must be approved by the IT Security Lead and recorded in the **Firewall Rules Register** (linked to the Asset Register).

---

### **4.6 Incident Response**

If a firewall or router compromise is suspected:

1. **Isolate** the affected device from the network.
2. **Change all credentials** associated with the device.
3. **Review logs** to identify source and scope of attack.
4. **Apply patches or restore from secure backup**.
5. **Report the incident** to the IT Security Lead and update the **Incident Register**.
6. **Re-test** configuration before reconnecting to production network.

---

### **4.7 Physical Security**

- All boundary devices are kept in **locked cabinets or restricted-access rooms**.
- Only authorised personnel may access network infrastructure.
- Portable firewalls (e.g., travel routers or remote gateways) must be encrypted and labelled.

---

### **4.8 Backup and Configuration Management**

- Configurations are **backed up** after every approved change.
- Backups are stored securely in **Proton Drive (end-to-end encrypted)** with version history.
- A rollback plan must exist for restoring previous configurations in case of failure or corruption.

---

### **4.9 BYOD (Bring Your Own Device)**

- BYOD devices are **not part of the asset register** but must:
    - Use an **active host firewall**.
    - Connect via **secure VPN** when accessing company systems.
    - Comply with Impact Orbit Creative Group’s **Acceptable Use Policy**.

---

### **4.10 Testing and Review**

- Firewall configurations are tested **biannually** through:
    - Internal vulnerability scanning.
    - External port scanning and penetration tests (as part of Cyber Essentials Plus).
- Configuration reviews occur:
    - **Quarterly**, following infrastructure changes.
    - **Annually**, during the Cyber Essentials recertification process.

---

## **5. Roles and Responsibilities**

| **Role** | **Responsibility** |
| --- | --- |
| **Director (Accountable Officer)** | Ensures adequate resources and policy enforcement. |
| **IT Security Lead** | Owns policy, reviews logs, approves changes, and manages incidents. |
| **Network Administrator** | Implements configuration, applies updates, and maintains backups. |
| **All Employees** | Must not alter firewall settings or connect unauthorised devices. |

---

## **6. Compliance**

- Compliance with this policy is mandatory.
- Non-compliance may result in disciplinary action or access revocation.
- Annual audits will verify adherence to **Cyber Essentials** and **IASME governance requirements**.

---

## **7. Review and Maintenance**

| **Activity** | **Frequency** | **Owner** |
| --- | --- | --- |
| Configuration Audit | Quarterly | IT Security Lead |
| Firmware Update Check | Monthly | Network Admin |
| Log Review | Quarterly | IT Security Lead |
| Policy Review | Annually | Director |

---

## **8. References**

- [NCSC: Securing Your Network – Firewalls and Gateways](https://www.ncsc.gov.uk/guidance/securing-your-network)
- IASME Cyber Essentials Technical Controls 2025
- ISO/IEC 27001:2022 – Annex A.8.20 Network Security Controls
- Impact Orbit Creative Group: Asset Register and Incident Response Policy

---

Would you like me to export this as a **Word (.docx)** or **PDF** version with placeholders for signatures, review dates, and device inventory links (ideal for inclusion in your Cyber Essentials documentation pack)?
