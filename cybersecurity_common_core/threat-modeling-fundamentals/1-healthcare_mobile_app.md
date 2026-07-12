# Healthcare Mobile App Threat Model

## 1. Critical Asset

The most critical asset in this system is the cloud database because it stores patients' medical data.

Using the CIA Triad:

* **Confidentiality:** Medical data must not be exposed.
* **Integrity:** Medical records and prescriptions must not be modified without authorization.
* **Availability:** The data must be available to patients and healthcare professionals when needed.

---

## 2. STRIDE Analysis - Message Healthcare Providers Feature

### 1. Spoofing

An attacker could impersonate a patient to obtain prescriptions or communicate with healthcare professionals.

### 2. Tampering

An attacker could modify messages sent to healthcare professionals, providing false symptoms or medical information.

### 3. Information Disclosure

An attacker could gain access to and expose sensitive patient data and medical records.

### 4. Denial of Service

An attacker could overload the messaging system, making it unavailable to patients and healthcare professionals.

---

## 3. Security Controls (Priority Order)

### 1. Multi-Factor Authentication (MFA)

Prevents unauthorized access to patient accounts.

### 2. Encryption (TLS and Database Encryption)

Protects patient data in transit and at rest.

### 3. Role-Based Access Control (RBAC)

Ensures users can only access data they are authorized to view.

### 4. Audit Logging and Monitoring

Tracks access to patient records and detects suspicious activity.

### 5. Rate Limiting / Account Lockout

Protects against brute-force attacks and credential stuffing.
