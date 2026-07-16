# 6. The Legacy Dilemma

**Goal:** Design a compensating control strategy for a system that cannot be patched, upgraded or replaced, under real operational constraints.

## Context

While building your asset inventory, you visit the Radiology department at MedDefense Central. The department runs an MRI scanner manufactured by a company that has since been acquired. The MRI's control software runs on Windows XP Embedded. The manufacturer's certification only covers this specific OS version. Any OS change voids the medical device certification and potentially violates regulatory requirements.

### Key Facts

- The MRI scanner cost $2.1 million and is 6 years into a 12-year expected operational lifespan.
- Windows XP has not received security patches since April 2014.
- The MRI control workstation must communicate with the PACS server (Picture Archiving and Communication System) to transmit imaging studies. It requires network connectivity.
- The radiology department processes approximately 45 MRI studies per day. Downtime directly affects patient care.
- The current network configuration places the MRI workstation on the same VLAN as the rest of the hospital workstations.

Marcus left a sticky note in the MRI's file folder:

> "CRITICAL: this has been on my desk for 6 months. Nobody wants to deal with it. The risk is real. -M"

## Instructions

You cannot patch the system. You cannot upgrade the OS. You cannot replace the device (budget). You cannot disconnect it from the network (clinical need). Every obvious solution is blocked by a real constraint.

1. **Risk Analysis:** Explain in 3-4 sentences why this MRI workstation represents a critical security risk to the entire MedDefense network, not just to the Radiology department. Connect your explanation to specific vulnerability characteristics of Windows XP and to network architecture.

2. **Compensating Control Strategy:** Propose a minimum of 3 compensating controls from at least 2 different categories (Technical, Administrative, Physical). For each control:
   - Describe what it does specifically.
   - Classify it (Category + Function).
   - Explain how it reduces the risk without requiring OS modification.
   - Identify any limitations or residual risk.

3. **Implementation Priority:** If MedDefense could only implement ONE of your proposed controls immediately (budget constraint), which one provides the greatest risk reduction? Justify your choice.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `6-compensating_controls.md`
