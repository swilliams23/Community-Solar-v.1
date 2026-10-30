# Nuezra Transportation: Operating Plan

Prepared 2026-10-30 for Ezra Warrington. Covers relaunch of non-emergency medical transportation (NEMT) services and the move to a remotely run operation.

**Goal in one line:** by mid-December Nuezra runs trips 7 days a week, a remote dispatcher/admin runs the day, every system has one job, and Ezra oversees from a daily report instead of a phone that never stops.

Roles used throughout:

| Code | Role | Who |
|---|---|---|
| E | Owner | Ezra |
| W | Dispatcher / Admin (remote) | Waleed (pending hire, Pakistan) |
| S | Systems lead | DexTech Solutions |
| D | Drivers | 1 FT wheelchair, 1 PT wheelchair, 2 FT ambulatory (own vehicle) |

---

## 1. Decisions to lock first

These change the plan below, so settle them in the first week. Suggested answers are included so nothing waits.

| # | Decision | Suggested answer | Why it matters |
|---|---|---|---|
| D1 | Which dispatch software | Shortlist Bambi, RouteGenie, MediRoutes, TripMaster (CTS). Demo two, pick one by Nov 6. | Everything else (driver app, billing export, ETA lookups for the phone line) hangs off this. |
| D2 | "Bambi HR" | Confirm: Bambi is NEMT dispatch software; BambooHR is HR software. Plan assumes BambooHR for HR and the dispatch pick from D1 for trips. If Ezra meant Bambi for dispatch, D1 is answered. | Avoids buying the wrong tool. |
| D3 | Own-vehicle drivers: W-2 or 1099 | Default to W-2 with mileage reimbursement unless a local employment attorney confirms 1099 holds up in Ezra's state. Most Medicaid brokers require credentialed drivers on the provider's roster either way. | Misclassification is the most common legal exposure in NEMT. |
| D4 | Offshore access to patient data | Check every broker contract and the state Medicaid provider agreement for offshore PHI restrictions before Waleed touches rider data. If restricted, Waleed works inside a US-hosted virtual desktop with no download rights, or his role is limited to non-PHI admin. | HIPAA allows offshore workforce with safeguards, but many state Medicaid programs forbid it outright. |
| D5 | Communication platform | Google Workspace Business with signed BAA (or Microsoft 365 Business with BAA). Skip Slack: HIPAA coverage requires Enterprise Grid. | One account per person, email, chat, Drive, and forms all under one BAA. |
| D6 | Phone platform | Phase 1: RingCentral or Dialpad (both sign BAAs) with a menu. Phase 2: Twilio with a BAA and an AI voice agent connected to dispatch for ETAs. | Gets a working line in days; AI comes after dispatch data exists to read from. |
| D7 | Payer mix and market | List the brokers (ModivCare, MTM, Verida, Access2Care, Alivi, etc.) and facility accounts Nuezra will serve. | Determines credentialing steps, insurance minimums, and trip volume for staffing. |

---

## 2. Phased roadmap with owners and deadlines

Dates assume today is Fri Oct 30, 2026. Compliance work is already in motion and due in a week.

### Phase 0: Clear to operate (now to Fri Nov 6). Owner: E

| Task | Owner | Due | Done when |
|---|---|---|---|
| Commercial auto policy bound (for-hire livery; typical broker minimum $1M to $1.5M combined single limit, confirm with each broker) | E | Nov 4 | Certificate of insurance in hand, broker named as certificate holder |
| General liability, workers' comp, hired and non-owned auto (covers own-vehicle drivers) bound | E | Nov 4 | Certificates filed in Drive > Compliance |
| State and local NEMT licensing / permits current | E | Nov 6 | Permit numbers recorded in Compliance tracker |
| Van repairs complete, lift inspected, securement equipment checked | E | Nov 6 | Signed inspection form, photos, odometer in Vehicle folder |
| Broker provider requirements submitted (vehicle inspection, driver roster, background, drug test, training certificates) | E | Nov 6 | Broker confirms active status in writing |
| Re-engage facility accounts (dialysis centers, SNFs, clinics) with relaunch date | E | Nov 6 | Three accounts confirmed for standing orders |

### Phase 1: Build the back office (Nov 2 to Nov 13). Owner: S, with E and W

| Task | Owner | Due | Done when |
|---|---|---|---|
| Decisions D1 to D7 made | E + S | Nov 6 | Written in this document |
| Google Workspace (or M365) set up, BAA signed, accounts for E, W, drivers; shared Drive structure created (see Section 4) | S | Nov 6 | Everyone logs in with MFA; personal email no longer used for work |
| Dispatch software purchased, configured: vehicles, levels of service, rate card, standing orders, driver app installed on Ezra's phone for testing | S + E | Nov 11 | A test trip runs end to end: booked, assigned, completed, exported |
| Broker trip feed connected to dispatch (import or integration) | S | Nov 13 | Tomorrow's broker trips appear in dispatch without retyping |
| BambooHR set up: onboarding checklist, document storage, certification expiration reminders | S | Nov 11 | A test hire completes onboarding in the portal |
| ADP payroll configured for W-2 drivers; QuickBooks Online chart of accounts and customers (brokers, facilities, private pay) set up; QBO to ADP mapping | S + E | Nov 13 | A test payroll and a test invoice run |
| Phone Phase 1 live: main number, menu (1 book a trip, 2 quote, 3 ETA, 4 driver line), hours, voicemail to dispatcher email, call recording policy | S | Nov 11 | Test calls route to Waleed during hours and to on-call after hours |
| Waleed hired: contractor agreement with confidentiality and HIPAA terms, HIPAA training, role charter signed (Section 5), access provisioned | E + S | Nov 9 | Waleed closes a test trip and submits a test EOD report |
| Standard operating procedures drafted (Section 7) | S, reviewed by E | Nov 13 | SOP folder has v1 of all seven documents |

### Phase 2: Hire and onboard drivers (Nov 2 to Nov 25). Owner: E, with W

| Task | Owner | Due | Done when |
|---|---|---|---|
| Job posts live (Indeed, local Facebook groups, dialysis center bulletin boards, driver referral bonus) | W drafts, E approves | Nov 4 | Posts live, applicant tracker in BambooHR |
| Screening calls and interviews (W screens, E interviews) | W + E | Rolling to Nov 18 | 6 to 8 interviews completed |
| Offers: 1 FT wheelchair, 1 PT wheelchair, 2 FT ambulatory | E | Nov 18 | Signed offers |
| Onboarding per checklist: MVR, background check, drug screen, CPR/First Aid, PASS or equivalent, defensive driving, HIPAA, wheelchair securement, vehicle inspection for own vehicles, insurance proof | W tracks, E verifies | Nov 25 | Every item green in BambooHR; driver added to broker roster |
| Ride-alongs and driver app training | E | Nov 25 | Driver completes two supervised trips |

### Phase 3: Relaunch (Mon Nov 16 soft launch; Mon Dec 14 full 7-day schedule)

| Task | Owner | Due | Done when |
|---|---|---|---|
| Soft launch, 5 days a week, van plus first available driver, Ezra as backup driver | E + W | Nov 16 | Week of trips completed with EOD reports |
| First billing cycle submitted (broker claims and private invoices) | W, E reviews | Nov 23 | All completed trips billed within 48 hours |
| Weekend shifts start as drivers clear onboarding | W schedules | Dec 5 | Saturday trips run |
| Full 7-day operation, all four drivers active, on-call rotation published | E | Dec 14 | Two consecutive weeks of 7-day service |
| Phase 3 review: what broke, what to fix | E + S + W | Dec 18 | Fix list in tracker |

### Phase 4: Make it run without Ezra (Dec 14 to Jan 29, 2027). Owner: S and W

| Task | Owner | Due | Done when |
|---|---|---|---|
| Weekly KPI dashboard from dispatch export (on-time %, trips, cancels, revenue per trip, AR aging) | S | Dec 23 | Ezra reads it Monday mornings |
| Phone Phase 2: AI voice agent on Twilio (BAA) answers, routes quote calls to Waleed, reads ETAs from dispatch, takes after-hours bookings | S | Jan 15 | 80% of ETA calls resolved without a human |
| Second part-time dispatcher or on-call backup so Waleed is not a single point of failure | E | Jan 29 | Coverage calendar has no gaps |
| Quarterly compliance calendar (insurance renewals, certs, vehicle inspections, broker re-credentialing) | W | Jan 15 | Reminders firing from BambooHR and Google Calendar |

---

## 3. Who owns what (accountability map)

| Area | Owner | Backup | Reviewed by |
|---|---|---|---|
| Trip intake, scheduling, dispatch, day-of monitoring | W | E | E (daily EOD) |
| Driver hiring pipeline and onboarding paperwork | W | E | E (weekly) |
| Driver interviews, offers, discipline, termination | E | none | n/a |
| Compliance tracker (insurance, licenses, certifications, vehicle inspections) | W | S | E (monthly) |
| Billing submission, remittance posting, denial rework | W | E | E (weekly AR review) |
| Payroll run (ADP) | E | S | QBO reconciliation monthly |
| Bookkeeping (QBO), bank reconciliation | E (or bookkeeper) | S | Monthly P&L |
| Systems, integrations, phone line, access control | S | E | Quarterly access audit |
| Safety, incidents, accidents | E | W (intake) | Incident log reviewed monthly |
| Customer and facility relationships | E | W | n/a |

Rule: every task in the tracker has exactly one owner. A backup can act, but the owner reports.

---

## 4. Systems map: where information lives

| Information | System of record | Who writes | Who reads | Notes |
|---|---|---|---|---|
| Riders, trips, authorizations, driver status, GPS, signatures, timestamps | Dispatch software (D1) | W, D (via app) | E, S | The only place rider PHI lives. Must have a BAA. |
| Broker trip assignments | Broker portal → dispatch import | W | W | Never re-key; import or integrate. |
| Employee files, onboarding checklist, certifications and expirations, PTO, policies acknowledgments | BambooHR | W, D | E | Expiration reminders 60/30/7 days out. |
| Hours, pay rates, payroll, tax filings | ADP | E (W preps hours from dispatch export) | E | Export approved hours from dispatch, import to ADP. |
| Invoices, payments received, bills, bank, P&L | QuickBooks Online | W (invoices), E (bills, reconciliation) | E | No rider names on invoices; use trip IDs and dates. QBO has no BAA. |
| Broker claims and remittances | Broker portal (or clearinghouse) | W | E | Post remittance totals to QBO weekly. |
| Email, chat, calendar, documents, forms | Google Workspace (BAA) | All | All | Internal chat is Google Chat; drivers get a Nuezra account. |
| Vehicle inspections (pre and post trip), lift checks, incident reports | Dispatch driver app if supported; otherwise Google Form → Drive | D | W, E | Photos required for damage and no-shows. |
| SOPs, checklists, rate card, org chart | Google Drive > Operations | S, E | All | Versioned; one current copy each. |
| Phone calls, voicemail, call recordings | RingCentral/Dialpad (Phase 1), Twilio (Phase 2) | n/a | W, E | Recording disclosure on greeting. |
| Tasks, deadlines, project progress | Google Sheets tracker (nuezra-task-tracker.csv) or Trello | All | E weekly | Keep it to one board. |

Shared Drive structure:

```
Nuezra Shared Drive
├── 01 Compliance        (insurance certificates, permits, broker agreements, BAAs)
├── 02 Operations        (SOPs, rate card, shift templates, on-call calendar)
├── 03 Drivers           (public: handbook, training; private files stay in BambooHR)
├── 04 Vehicles          (per-vehicle folder: registration, inspections, repairs, photos)
├── 05 Billing           (remittance PDFs, denial logs, private-pay invoices export)
├── 06 Reports           (EOD reports by date, weekly KPI, monthly P&L)
└── 07 Incidents         (restricted to E and W)
```

Information rules everyone follows:

1. Rider names and health details go in the dispatch system only. Not in chat, text, email, or QuickBooks.
2. Drivers communicate trip changes through the driver app. Text messages are for "running late, call me" only.
3. If it is not in the tracker, it is not a task.
4. Every document has one owner and one current version in Drive.

---

## 5. Role charters

### Dispatcher / Administrative Assistant (Waleed)

Hours: Mon to Fri 5:00 am to 2:00 pm ET (3:00 pm to 12:00 am Pakistan time), plus Saturday 5:00 am to 10:00 am ET. Sunday and evenings covered by the on-call rotation until a second dispatcher is hired.

Daily responsibilities, in order:

1. 5:00 am: confirm every driver has checked in and completed pre-trip inspection. Call any driver not checked in by 5:15.
2. Monitor live board. Act on any trip running more than 10 minutes behind: call rider, update ETA, reassign if needed.
3. Answer the main line and dispatch line. Book trips, give quotes from the rate card, read ETAs from the board.
4. Handle will-call return trips and no-shows per SOP.
5. Import tomorrow's broker trips by 12:00 pm. Build routes and assign drivers by 2:00 pm. Flag unassigned trips to Ezra by 2:00 pm.
6. Send rider reminder calls or texts for tomorrow (automated where the dispatch system supports it).
7. Reconcile today's completed trips against authorizations. Submit claims for yesterday's trips. Create private-pay invoices in QBO.
8. Update the compliance tracker and onboarding checklists; chase expiring items.
9. Send the End of Day report by 2:00 pm ET (template in Section 8).

Weekly: Monday AR aging export from QBO and broker portals; Wednesday hiring pipeline update; Friday next-week driver schedule published.

Accountability measures: EOD report sent every working day; unassigned-trip rate under 2% at 2:00 pm cutoff; claims submitted within 48 hours of trip completion; zero PHI outside the dispatch system (audited by S quarterly).

Not allowed: hiring or firing decisions, changing pay rates, approving refunds over $50, deleting trips, exporting rider data outside the dispatch system.

### Owner (Ezra)

Daily: read the EOD report (10 minutes). Respond to flagged items only.
Weekly: Monday 30-minute ops review with W and S (KPIs, AR, hiring, fix list). Approve payroll hours.
Monthly: P&L review, compliance tracker review, incident log review, one ride-along or vehicle check.
Always: driver hiring and termination, customer escalations, incidents and accidents, insurance and broker relationships.

### Systems lead (DexTech)

Owns the tool stack, integrations, access provisioning and removal, the KPI dashboard, the phone system, and the quarterly access audit. On call for system outages. Does not touch rider data except to troubleshoot with Ezra's approval.

### Drivers

Clock in through the driver app; complete pre-trip inspection before the first pickup and post-trip at end of shift; update every trip status in real time (en route, arrived, rider on board, completed) with signature or photo; follow the no-show and securement SOPs; report incidents within one hour; keep certifications current (BambooHR reminds, driver acts).

Own-vehicle drivers additionally: keep registration, insurance, and state inspection current and uploaded; vehicle must pass the Nuezra vehicle checklist (4 doors, working AC/heat, clean, no warning lights, first-aid kit, vehicle no older than the broker's limit); submit mileage weekly through the dispatch export.

---

## 6. Trip lifecycle A to Z

Each step lists who acts, where it happens, and what "done" means. This is the process Waleed runs and the AI phone line eventually feeds.

| Step | What happens | Who | System | Done when |
|---|---|---|---|---|
| A. Intake | Trip request arrives from a broker feed, facility call or fax, rider phone call (menu option 1), or web form | W | Dispatch (broker import), phone, Google Form | Trip record exists with rider, pickup, drop-off, appointment time, level of service (ambulatory or wheelchair), mobility aids, escort, recurring pattern, payer, notes |
| B. Verify and price | Broker trips: confirm authorization number and level of service match. Private pay: quote from rate card (base + per-mile + wheelchair surcharge + wait time + after-hours), collect payment method | W | Dispatch, rate card | Trip marked verified; private-pay trips have payment on file or deposit |
| C. Schedule | Enter one-time trip or create a standing order (dialysis Mon/Wed/Fri, etc.) with pickup window calculated from appointment time | W | Dispatch | Trip appears on the correct date with a pickup window |
| D. Plan and assign (day before) | By 12:00 pm import tomorrow's broker trips; by 2:00 pm build routes and assign by level of service, vehicle, shift, and geography. Unassigned trips escalated to E | W | Dispatch auto-routing | Every trip has a driver; manifests pushed to driver apps |
| E. Confirm | Reminder call or text to rider the evening before (name and time only, no medical details). Facility confirmations for standing orders weekly | W or automated | Dispatch reminders, phone | Reminder log shows sent |
| F. Driver start of day | Driver clocks in, completes pre-trip inspection (tires, lights, lift cycle, securements, cleanliness, fuel), reviews manifest | D | Driver app | Inspection submitted before first pickup; W sees green on the board |
| G. Execute each trip | Statuses in real time: en route → arrived → rider on board → dropped off. Capture GPS timestamps, odometer, signature or photo at drop-off. Wheelchair trips: four-point securement plus lap and shoulder belt before moving | D | Driver app | Trip shows Completed with timestamps and signature |
| H. Monitor | W watches the live board; calls riders when a driver is 10+ minutes behind; reassigns when needed; answers ETA calls (menu option 3) from the board | W | Dispatch live board, phone | No trip goes past the pickup window without a rider call logged |
| I. Exceptions | No-show: driver waits the required time (typically 10 to 15 minutes, per broker rule), calls rider, calls W, takes a geotagged photo, W marks no-show with notes. Breakdown: driver calls W, W reassigns and calls rider, E notified. Incident or accident: driver secures the scene, calls 911 if needed, calls E, completes incident form within one hour | D, W, E | Driver app, incident form, phone | Exception documented in the trip record; incident form filed in 07 Incidents |
| J. Will-call returns | Rider or facility calls when ready (menu option 1). W assigns nearest eligible driver and gives ETA | W | Dispatch, phone | Return trip assigned within 5 minutes of the call |
| K. Driver end of day | Post-trip inspection, fuel level, any damage photos, clock out | D | Driver app | Post-trip submitted; W confirms all trips closed |
| L. Reconcile (same day) | W reviews every trip: completed vs. authorized, mileage reasonableness, missing signatures, no-show documentation. Fixes before billing | W | Dispatch | Daily reconciliation marked complete in EOD report |
| M. Bill (within 48 hours) | Broker trips submitted through the broker portal or clearinghouse with required fields. Facility and private-pay trips invoiced from QBO using trip ID and date, no rider name | W | Broker portal, QBO | Claims accepted; invoices sent; both logged in 05 Billing |
| N. Collect | Weekly: post remittances to QBO, work denials within 7 days of notice, chase private-pay balances at 15 and 30 days. Monthly AR aging to E | W, E | Broker portals, QBO | AR over 45 days under 10% of total |
| O. Pay | Approved hours and mileage exported from dispatch each pay period; E approves; ADP runs payroll; QBO records the payroll expense | W preps, E approves | Dispatch export, ADP, QBO | Payroll on time every cycle; mileage reimbursement itemized |
| P. Report | EOD report daily; weekly KPI dashboard Monday; monthly P&L and compliance review | W, S, E | Google Sheets, Drive 06 Reports | E can describe yesterday without calling anyone |

Service levels the process is built to hit: pickup within the window on 95% of trips; no unassigned trips at 2:00 pm the day before; claims out within 48 hours; every exception documented the same day.

---

## 7. Standard operating procedures to write (v1 by Nov 13)

| SOP | Contents | Owner | Used by |
|---|---|---|---|
| Driver onboarding checklist | Application, interview, offer, MVR (3-year clean, no DUI), background check, drug screen, CPR/First Aid, PASS or equivalent passenger assistance training, defensive driving, HIPAA training, wheelchair securement sign-off, driver app training, two ride-alongs, broker roster submission, uniform and ID | W | W, E |
| Certification and compliance tracker | Item, holder, issue date, expiration, reminder dates (60/30/7), status. Covers driver licenses, certifications, vehicle registration, insurance, inspections, business permits, broker credentialing | W | W, E |
| Vehicle inspection (pre-trip and post-trip) | Daily checklist with photos; lift function test; securement count; monthly deep inspection; repair request path | E | D, W |
| Safety and securement | Four-point tie-down and occupant restraint procedure; lift operation; transfer assistance limits; weather and road policy; cell phone policy | E | D |
| Incident, accident, and no-show procedure | Who to call in what order, forms, photo requirements, broker notification deadlines, rider complaint handling | E | D, W |
| Dispatch daily runbook | The hour-by-hour list in Section 5 plus escalation rules and phone scripts (booking, quote, ETA) | W, S | W, backup dispatcher |
| Billing and payment tracking | Reconciliation steps, claim submission per broker, invoice template, denial workflow, remittance posting, AR follow-up cadence, payroll prep | S, W | W, E |

---

## 8. How progress is tracked

**Project tracker:** the task list in `nuezra-task-tracker.csv` imported to a Google Sheet (or Trello). Columns: phase, task, owner, due, status, done-when, notes. Reviewed Monday.

**Daily End of Day report (W sends by 2:00 pm ET):**

```
Nuezra EOD — <date>
Trips scheduled / completed / no-show / cancelled: __ / __ / __ / __
On-time pickups: __%   Late trips (with reason): ...
Tomorrow: __ trips, __ assigned, __ unassigned (names of drivers short)
Billing: __ claims submitted, __ invoices sent, __ denials to work
Vehicles: issues reported ...
People: onboarding items due this week ..., certs expiring in 30 days ...
Needs Ezra: (only items requiring a decision)
```

**Weekly KPIs (dashboard, Monday):**

| KPI | Target |
|---|---|
| On-time pickup rate | 95% or better |
| Trips completed per driver per day | Baseline in week 2, then +10% |
| Cancellation and no-show rate | Under 10% |
| Unassigned trips at 2:00 pm cutoff | 0 |
| Claims submitted within 48 hours | 100% |
| Denial rate | Under 5% |
| AR over 45 days | Under 10% of AR |
| Revenue per trip and per vehicle-day | Tracked monthly |
| Incidents | 0; each one reviewed |
| Certifications expired | 0 |

**Meeting cadence:** daily EOD (async), Monday 30-minute ops review (E, W, S), monthly 60-minute business review (P&L, compliance, incidents, hiring).

---

## 9. Hiring plan details

Openings: 1 full-time wheelchair van driver, 1 part-time wheelchair van driver (weekends and PTO cover), 2 full-time ambulatory drivers using their own vehicles.

Minimum requirements (adjust to broker and insurer rules): age 21 or older (25 preferred by most insurers), valid license 3+ years, clean 3-year MVR, pass background and drug screen, able to lift 50 lbs and assist riders, smartphone for the driver app, CPR/First Aid and passenger assistance training completed before first solo trip (Nuezra can sponsor). Own-vehicle drivers: 4-door vehicle within the broker's age limit, current registration, inspection, and insurance; must pass Nuezra's vehicle checklist.

Suggested 7-day coverage:

| Role | Schedule |
|---|---|
| FT wheelchair | Mon to Fri, 5:30 am to 2:00 pm |
| PT wheelchair | Sat and Sun, 6:00 am to 4:00 pm; covers FT PTO |
| FT ambulatory A | Mon to Fri |
| FT ambulatory B | Wed to Sun |
| Dispatch | W Mon to Sat mornings; on-call rotation for Sun and evenings |

Interview focus: reliability history, how they handle a rider who is not ready, a wheelchair securement walkthrough, comfort with a phone app, availability for early mornings and weekends.

Sourcing: Indeed, local Facebook job groups, flyers at dialysis centers and senior centers, referral bonus paid after 90 days.

---

## 10. HIPAA and data guardrails

1. Sign a BAA with every vendor that touches rider data: dispatch software, Google Workspace or Microsoft 365, phone provider, any form tool. QuickBooks and ADP get no rider data.
2. One account per person, MFA on everything, no shared logins. S removes access the day someone leaves.
3. Waleed: contractor agreement with confidentiality and HIPAA obligations, documented HIPAA training, least-privilege role in dispatch (no bulk export), company-managed browser profile. If any payer prohibits offshore access (D4), use a US-hosted virtual desktop or restrict his role.
4. Drivers see only their own manifest. No screenshots of the board in group chats.
5. Rider reminders carry name, date, and time only.
6. Incident reports and complaints live in the restricted 07 Incidents folder.
7. Quarterly access audit by S; annual HIPAA refresher for everyone.

---

## 11. Phone line design

**Phase 1 (by Nov 11):** one published number on RingCentral or Dialpad with a BAA. Greeting states calls are recorded. Menu: 1 book or change a trip (rings W), 2 get a quote (rings W, voicemail after hours), 3 check an ETA (rings W), 4 drivers (rings W, then on-call). After hours: on-call phone, then voicemail transcribed to the dispatch inbox.

**Phase 2 (by Jan 15):** Twilio under a BAA running an AI voice agent. It verifies the caller with name and date of birth or trip confirmation, reads the live ETA from the dispatch system through its API, takes new booking details and creates a pending trip for W to verify, and transfers quote requests to W (or texts a callback link after hours). Every call is logged with a transcript in a HIPAA-covered store. Humans stay one button away at every step.

---

## 12. Risks and how the plan handles them

| Risk | Mitigation |
|---|---|
| Waleed is a single point of failure | On-call rotation now; second part-time dispatcher by Jan 29; runbook so a backup can cover in a day |
| Offshore PHI restriction in a contract | D4 check before go-live; virtual desktop fallback |
| Own-vehicle drivers misclassified | D3 attorney check; default to W-2; hired and non-owned auto coverage regardless |
| Driver certifications lapse | BambooHR reminders at 60/30/7 days; expired cert means no trips assigned |
| Billing falls behind during relaunch | 48-hour rule in Waleed's daily list; E reviews AR weekly |
| Too few trips for four drivers in week one | Soft launch with one or two drivers; add shifts as standing orders are confirmed |
| Buying tools that do not talk to each other | D1 selection criteria require broker import, driver app, billing export, and an API |

---

## 13. Questions for Ezra

Answers to these tighten the plan; nothing above is blocked waiting on them.

1. Which state and counties will Nuezra serve, and which brokers or facilities are the main trip sources?
2. Did "Bambi HR" mean Bambi (dispatch software) or BambooHR (HR software)?
3. Are the ambulatory drivers intended as W-2 employees or 1099 contractors? Has an attorney weighed in?
4. How many vans are in the fleet now, and is a second wheelchair vehicle planned?
5. Is there an existing business phone number and provider to port?
6. What are Waleed's agreed hours and pay structure, and has he done HIPAA training before?
7. Monthly budget range for software (dispatch, HR, phone, Workspace)?
8. Private-pay rate card: does one exist, or should we build it?
