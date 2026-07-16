# 1. The First Incidents

**Goal:** Learn to classify security events using the CIA Triad as an analytical framework.

## Context

While reading Marcus's notes from the onboarding packet, you find a section titled "Incident Log, Last 6 Months." It is a rough list of security-relevant events that occurred at MedDefense. Some were handled. Some were not. None were formally classified.

Before you can assess the security posture, you need to understand what has already gone wrong. More importantly, you need a framework to describe how it went wrong. That framework is the **CIA Triad**:

- **Confidentiality:** Information was accessed by someone who should not have seen it.
- **Integrity:** Information or a system was modified without authorization.
- **Availability:** A service, system or data became inaccessible when it was needed.

Every security incident impacts at least one of these pillars. Some impact more than one.

## The Incident Log

### Incident A — January 15

A ransomware payload encrypted the billing server (`billing-srv-01`) over the weekend. The finance team could not process insurance claims for 4 days. The backup was 3 weeks old due to a misconfigured cron job.

### Incident B — February 2

A nurse in the Westside Clinic reported that a patient asked about test results that had not been shared yet. Investigation revealed that the patient portal had a broken access control that allowed any authenticated patient to view other patients' lab results by modifying the URL parameter.

### Incident C — March 18

The pharmacy management system displayed incorrect dosages for a specific medication across all three sites for approximately 6 hours. A database update script had a bug that overwrote dosage values. The error was caught by a pharmacist who noticed the numbers did not match the printed reference.

### Incident D — April 5

MedDefense Central's public-facing website was defaced. The homepage was replaced with a political message. The website does not contain patient data. It was restored from a backup within 2 hours.

### Incident E — May 22

The EHR system experienced a 9-hour outage during a planned database migration. The migration took longer than expected and the rollback procedure had never been tested. Physicians resorted to paper records during the outage.

### Incident F — June 10

An IT intern's personal laptop, which he had connected to the corporate WiFi, was found to be running a torrent client that was sharing files. Network logs showed the laptop had been on the internal network (not the guest network) for 3 weeks. The laptop had access to the same network segment as the HR file share.

## Instructions

Analyze the 6 incidents from Marcus's log above. For each one, identify:

1. The primary CIA pillar impacted.
2. A one-sentence justification explaining why.
3. If a secondary pillar is also impacted, identify it and explain the connection.

Produce a formatted incident classification table.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `1-incident_classification.md`
