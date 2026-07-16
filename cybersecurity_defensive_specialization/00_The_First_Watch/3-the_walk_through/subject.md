# 3. The Walk-Through

**Goal:** Apply structured risk reasoning (Vulnerability, Threat, Impact) to physical observations in a real environment.

## Context

James Chen takes you on a tour of MedDefense Central. "Walk through with fresh eyes," he says. "Marcus told me at least twice that the server room access was a problem. I flagged it to Sarah Park in IT. She said it was 'on the roadmap.' That was five months ago."

As you walk the facility, you observe details that a non-security professional would overlook. Each observation represents a potential security weakness. Your job is to decompose each one into its formal risk components.

A risk exists when three elements converge:

- **Vulnerability:** A specific weakness or gap in a system, process or physical setup.
- **Threat:** An event, actor or circumstance that could exploit the vulnerability.
- **Impact:** The consequence to the organization if the threat materializes, measured against the CIA pillars.

## Observations

### Observation 1 — Server Room Access

The server room is on the ground floor, accessed from a corridor shared with the cafeteria. The door uses the same generic badge that every employee (clinical, administrative, custodial) receives on their first day. There is no camera covering the door. There is no visitor log.

### Observation 2 — Network Closet

A network closet on the second floor (containing switches and patch panels) has no lock. The door is ajar. Inside, taped to the wall next to the switch stack, is a laminated sheet labeled "Network Maintenance Credentials" with a username and password for the switch management interface.

### Observation 3 — Nurse Station

At the third-floor nurse station, a workstation is logged into the EHR system with a patient's record visible on screen. No staff member is present. The session appears to have been idle for at least 15 minutes. A sign above the station reads "For efficiency, please do not log out between shifts."

### Observation 4 — Medical IoT

In a patient room, a connected vital signs monitor displays diagnostic information including the device's IP address (`10.10.3.47`) and firmware version (`v2.1.3`, last updated 2019). The network cable runs to a wall port labeled "MED-3F-12." You notice this is the same IP range as the workstations you saw at the nurse station.

### Observation 5 — Emergency Exit

A fire exit door between the public waiting area and the restricted administrative wing is propped open with a wooden wedge. A handwritten sign taped to the door reads: "Please do not close, staff passage." Through the open door, you can see the hallway leading to the IT department and James Chen's office.

## Instructions

You observe the following during your walk-through of MedDefense Central. For each observation, produce a structured risk decomposition.

For each observation, deliver:

```
Observation [N]:
  Vulnerability: [The specific weakness]
  Threat: [A plausible scenario that exploits this weakness]
  Impact: [What happens if the threat materializes - specify CIA pillar(s)]
  Severity: [Critical / High / Medium / Low - justified in one sentence]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `3-physical_assessment.md`
