# 0. The Onboarding Packet

**Goal:** Extract a structured understanding of an organization from incomplete and disorganized documentation.

## Context

James Chen hands you a folder labeled "MedDefense, Security Documentation." It contains everything the organization has: a partial IT asset list exported from the ticketing system, an outdated network diagram that Marcus started but never finished, a one-page org chart, site descriptions from the HR onboarding guide, notes Marcus left in a text file on the shared drive, and a summary of IT service contracts.

None of it is complete. Some of it contradicts itself. Welcome to reality.

## Provided Files

- `onboarding_packet.txt`

## Instructions

Your first task is to make sense of this information. Read the entire onboarding packet carefully. Then produce a **Structured Environment Summary** organized into the following four sections:

1. **Organization Overview**: Sites (name, location type, function, approximate headcount), departments and reporting structure relevant to security.

2. **IT Infrastructure Identified**: Every system, server, network device and endpoint category mentioned or implied in the documentation. For each: name/type, function, location (which site) and any technical details available.

3. **Data and Services**: What types of data does MedDefense handle? What critical services depend on IT infrastructure? Who uses them?

4. **Known Unknowns**: What information is missing, incomplete or contradictory in the documentation? List specific gaps. This section is as important as the others, knowing what you do not know is the first step toward a complete assessment.

Be precise. Do not invent information that is not in the packet. If something is ambiguous, flag it in the Known Unknowns section.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `0-environment_summary.md`
