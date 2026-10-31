# Nuezra Dispatch: Build and Broker Approval Plan

Prepared 2026-10-31 for Ezra Warrington and DexTech Solutions. Companion to the Nuezra Operating Plan (Phase 5).

**The idea in one line:** run trips on Bambi from day one because the brokers accept it, learn exactly what the brokers verify, build Nuezra Dispatch to meet that bar, prove parity in a parallel run, get written approval, then cut over.

Roles: E = Ezra (owner), W = Waleed (dispatcher/admin), S = DexTech (builder), D = drivers.

---

## 1. What brokers actually check

Brokers do not certify software so much as they verify trip evidence. Vendor documentation and broker-facing material agree on the same core set: GPS coordinates at pickup and drop-off, timestamps for each status change, digital signatures or equivalent proof of delivery, verified mileage, and automatic no-show documentation. Broker trips arrive through portals such as Modivcare's WellRyde, MTM, Alivi, and others, and payment is checked against that evidence. None of the brokers publish a public technical spec, so the exact rules come from each broker's provider manual and from the provider relations contact.

What "Bambi or an alike system" most likely means in practice:

| Capability | Why the broker cares | Evidence Nuezra Dispatch must produce |
|---|---|---|
| GPS-verified pickup and drop-off | Proves the trip happened where claimed | Latitude, longitude, accuracy, device time, and server time for every status event |
| Timestamps for en route, arrived, rider on board, completed | Pays wait time and on-time performance; disputes | Immutable event log per trip; events cannot be edited, only annotated |
| Signature or proof of delivery | Confirms the rider was transported | Signature image or photo plus timestamp and location, stored with the trip |
| Odometer or computed mileage | Mileage-based reimbursement | Odometer at pickup and drop-off and route-computed miles, both kept |
| No-show documentation | Avoids paying for trips that did not happen and protects the provider | Arrival GPS, wait timer start and end, call attempts, photo, dispatcher note |
| Trip data exchange | Trips assigned by the broker must flow in; results must flow back | Import of the broker's trip file or API; export of completed-trip file in the broker's format |
| Driver and vehicle credential records | Only credentialed drivers and inspected vehicles carry members | Driver and vehicle profiles with expiration dates; a trip cannot be assigned to an expired driver or vehicle |
| HIPAA safeguards | PHI is in the system | BAA with the host, encryption at rest and in transit, MFA, role-based access, audit log, retention policy, breach procedure |
| Audit and retention | Audits and claim reviews years later | Full trip history kept for at least the broker's required period (often 6 to 10 years; confirm) |
| Driver app that cannot be faked | GPS spoofing and manual time edits | Device attestation where possible, background location during trips, server-side timestamps, anomaly flags |

Decision gate D8 from the operating plan: Ezra collects each broker's actual criteria by Nov 13. The questionnaire in Section 9 is what he asks.

---

## 2. Bambi as the bridge: how to use it so it helps the build

Bambi runs dispatch from relaunch until cutover. Set it up to make the eventual migration painless and to teach the team what Nuezra Dispatch must do.

| Action | Owner | When | Purpose |
|---|---|---|---|
| Sign up month to month; read the terms for data export, termination notice, and data deletion; get the BAA signed | E + S | Nov 4 | No lock-in; PHI covered |
| Confirm with Bambi which of Ezra's brokers import directly (MTM and Modivcare are advertised; confirm Verida, Access2Care, Alivi, or whoever Ezra uses) | E | Nov 4 | Know which trips still need manual entry |
| Configure vehicles, levels of service, rate card, standing orders, driver app | S + E | Nov 11 | Relaunch-ready |
| Use Nuezra's own IDs: rider external ID, vehicle ID, driver ID, in Bambi's custom or reference fields | S | Nov 11 | Clean joins when data moves to Nuezra Dispatch |
| Daily export of trips, statuses, GPS points, and signatures to the Nuezra platform (CSV, report export, or API if Bambi offers one) | S | Dec 4 (Sprint 1) | Feeds the daily dashboard and billing module now; becomes the migration path later |
| Workflow journal: Waleed logs every step he takes in Bambi for one week, every workaround, and every "I wish it did" | W | Nov 16 to Nov 20, again Jan 12 to Jan 16 | Becomes the requirements list for Nuezra Dispatch |
| Driver feedback sessions after week 2 and week 6 | E | Nov 30, Jan 8 | Driver app requirements |
| Keep Bambi for 30 days after cutover, then export everything and cancel | S | Apr 30 | Fallback and records retention |

Rule: Nuezra Dispatch is built from Nuezra's workflow, the broker criteria, and the team's requirements. We do not copy Bambi's code, screens, or documentation. "Reverse engineering" here means documenting what the business needs the system to do, which we are entitled to do, not reproducing Bambi's product.

---

## 3. What Nuezra Dispatch is: product scope

### MVP for broker approval (must ship before the parallel run)

**Trips**

- Trip intake by W: rider, pickup, drop-off, appointment time, level of service, mobility aids, escort, payer, authorization number, notes
- Broker trip import: file upload and, where available, API pull; de-duplication by broker trip ID
- Standing orders with exception dates (holidays, hospitalizations)
- Pickup window calculation from appointment time, distance, and level of service
- Rate card quotes for private pay; base, per mile, wheelchair surcharge, wait time, after hours

**Dispatch board**

- Day view by driver and vehicle; unassigned queue; drag to assign; auto-suggest by level of service, vehicle, shift, and proximity
- Live map with driver positions and trip status colors
- Exceptions panel: late, no-show pending, unassigned, driver not checked in
- Will-call queue
- Manifest push to driver app; change notifications

**Driver app (iOS and Android)**

- Login with MFA; shift check-in; pre-trip and post-trip inspection with photos
- Manifest; one-tap status events: en route, arrived, rider on board, completed, no-show
- Background GPS while on shift with breadcrumbs every 15 to 30 seconds while a trip is active
- Signature capture, drop-off photo, odometer entry, wait timer
- Offline tolerance: events queue on the device and sync with device time and server receive time both recorded
- Navigation handoff to the phone's maps app
- Call dispatcher; call rider through a masked number

**Compliance and controls**

- Driver and vehicle profiles with credential expirations; hard block on assignment when expired
- Immutable event log; annotations allowed, edits not
- Role-based access: owner, dispatcher, driver, billing, read-only
- Audit log of every view and change of PHI
- Session timeouts, MFA, encryption at rest and in transit

**Data out**

- Completed-trip export per broker in the broker's format (CSV or API)
- Billing export to the Nuezra Billing module and QuickBooks
- Hours and mileage export for ADP
- Reporting: on-time, trips per driver, cancels, no-shows, revenue per trip

### After approval (v1.1 onward)

Automated route optimization, rider reminder calls and texts through Twilio, rider self-service confirmations, facility portal for standing orders, AI phone agent reading live ETAs, predictive late-trip alerts.

---

## 4. Architecture and stack

Proposed. Confirm as decision D9 by Nov 6.

| Layer | Choice | Reason |
|---|---|---|
| Web app (dispatch board, admin) | React with TypeScript | Mature, hireable, fast UI for a live board |
| Driver app | React Native with Expo (iOS and Android from one codebase) | Background location, push notifications, offline storage, app store distribution |
| API | Node.js (NestJS) or Python (FastAPI) with TypeScript or typed Python | Either works; pick what DexTech ships fastest |
| Database | PostgreSQL with PostGIS | Relational trip data plus geospatial queries |
| Realtime | WebSockets for the live board | Driver positions and status changes without refresh |
| Hosting | AWS or Google Cloud, HIPAA-eligible services only, signed BAA, single US region | Satisfies brokers and state Medicaid data residency expectations |
| Maps and routing | Mapbox or Google Maps Platform | Send addresses and coordinates only, never rider identity; mapping APIs are not covered by a BAA |
| Voice and SMS | Twilio under a BAA | Masked calling, reminders, later the AI agent |
| Auth | Managed identity provider with MFA (Auth0, Cognito, or Firebase Auth under BAA terms) | Do not build auth |
| Files | Object storage with encryption and signed URLs | Signatures, photos, documents |
| Observability | Error tracking and logs with PHI scrubbing | Debug without leaking PHI |
| Backups | Daily encrypted backups, tested restore quarterly | Audit requirement |

Alternative considered: building on Salesforce (the Community Solar project is Salesforce). It is viable for the admin and compliance side, but a driver app with background GPS, offline sync, and sub-minute live board updates is a poor fit for Salesforce licensing and mobile constraints, and HIPAA on Salesforce requires Shield at significant cost. Recommendation: standalone stack above.

Data model core: Rider, Trip, TripEvent (immutable), StandingOrder, Driver, Vehicle, Credential, Shift, Assignment, Payer, Authorization, BrokerImportBatch, ExportBatch, InspectionReport, Incident, AuditEntry, User, Role.

---

## 5. Build schedule

Dates continue from the operating plan. The dispatch build starts earlier than the original Sprint 4 because spec and design can run while the Ops Hub modules ship.

| Stage | Dates | Owner | Deliverables | Exit criteria |
|---|---|---|---|---|
| 0. Discovery | Nov 2 to Nov 20 | E, W, S | Broker criteria (D8), Bambi live, Waleed's workflow journal, driver interviews, data model v1 | Criteria from every broker in writing; workflow journal complete |
| 1. Spec and design | Nov 23 to Dec 18 | S, E signs off | Product requirements document, broker criteria matrix mapped to features, wireframes for board and driver app, architecture document, security and HIPAA control plan, test plan | E signs the PRD; brokers given a courtesy preview and asked what they will need to see for approval |
| 2. Core build | Jan 4 to Feb 12 | S | Auth and roles, data model, trip intake, broker import, standing orders, dispatch board, assignment, live map, audit log, exports | W runs tomorrow's schedule in Nuezra Dispatch in shadow mode |
| 3. Driver app and integrations | Jan 18 to Mar 5 | S | React Native app in TestFlight and Play internal testing, GPS and events, signatures, offline sync, masked calling, QuickBooks and ADP exports, broker export files | Two drivers complete real private-pay trips on the app with Bambi untouched |
| 4. Hardening | Feb 22 to Mar 13 | S, outside reviewer | HIPAA risk assessment, third-party penetration test, load test at 10x expected volume, restore drill, app store submissions, user acceptance testing with W and D | Pen test findings fixed; apps approved in both stores; UAT signed by E and W |
| 5. Broker approval and parallel run | Mar 16 to Mar 27 | E, S, W | Submission package (Section 6), parallel run (Section 7), broker sandbox or test file acceptance | Written approval from each broker; parallel run acceptance criteria met |
| 6. Cutover | Mar 30 to Apr 3 | S, W | Cutover runbook, Bambi read-only, data migration, support rotation | One full week on Nuezra Dispatch with no fallback; Bambi cancelled Apr 30 |

Start early, outside the critical path: Apple Developer and Google Play accounts (Nov), business verification for both stores (can take weeks), Twilio BAA and number porting request (Jan), penetration tester booked (Jan for a late-Feb slot).

Effort estimate for planning: roughly 18 to 24 developer-weeks across Stages 2 to 4 for one experienced full-stack developer, less with two. If DexTech is a single builder, Stages 2 and 3 overlap only if a second developer is added; otherwise push cutover to late April and say so now.

---

## 6. Broker approval: how to get the yes

Approval is relationship plus evidence. Start the conversation in Stage 1, not Stage 5.

**Who:** each broker's provider relations or network manager for Ezra's region. Ezra owns the relationship; DexTech supplies the technical answers.

**Three conversations:**

1. **Nov (Discovery):** "We run Bambi today. We are building our own system to the same standard. What do you require of a provider's software, and what would you need to see to accept ours?" Capture answers in the criteria matrix.
2. **Dec (Spec preview):** Share the criteria matrix with how each item is met. Ask for a named contact for testing and whether a sandbox or test file submission exists.
3. **Mar (Submission):** Deliver the package below, run their test, request written approval.

**Submission package:**

| Item | Owner |
|---|---|
| System description: one page, what it does, who uses it, data flow diagram | S |
| Criteria matrix: each broker requirement, how it is met, screenshot or sample | S |
| HIPAA documentation: hosting BAA, risk assessment summary, policies (access, audit, breach, retention), workforce training records | S + E |
| Security summary: penetration test letter of attestation, encryption, MFA, backups | S |
| Sample trip data: completed-trip export in the broker's format from the parallel run, plus the matching Bambi records showing parity | S + W |
| Driver app demo video: full trip with GPS, statuses, signature, no-show flow | S |
| Insurance certificates and provider credentials (unchanged, but brokers often re-request) | E |
| Test results from the broker's sandbox or test file acceptance | S |
| Cutover plan and fallback: Bambi kept 30 days | S |

**If a broker says only named vendors qualify:** Nuezra Dispatch still runs everything else (private pay, facility contracts, other brokers), and for that broker Nuezra Dispatch exchanges data with the broker's required tool through its import and export. Build the broker import and export layer as a first-class feature so this fallback is cheap. Revisit with the broker every six months.

---

## 7. Parallel run: proving parity without risking trips

Three steps, each with a gate. Bambi remains the system of record until the final cutover.

| Step | Duration | What runs where | Pass criteria |
|---|---|---|---|
| A. Shadow | 2 weeks (Feb 15 to Feb 26, during Stage 3) | All trips imported into Nuezra Dispatch; W assigns in both systems; drivers use Bambi only | Assignments match 100%; import handles every broker file without manual fixes; board usable by W without S present |
| B. Private-pay pilot | 2 weeks (Mar 2 to Mar 13) | Two ambulatory drivers run private-pay and facility trips on the Nuezra app; broker trips stay on Bambi | 50+ trips; every event has GPS and timestamps; zero lost events after offline periods; signatures captured on 100% of completed trips |
| C. Broker parallel | 2 weeks (Mar 16 to Mar 27) | With broker consent: one vehicle's broker trips run on the Nuezra app while W mirrors statuses into Bambi or Bambi stays as fallback; completed-trip export submitted to the broker for test acceptance | Trip count, timestamps within 60 seconds, and mileage within 0.2 miles match Bambi on 100% of trips; broker accepts the export file; no claim rejections attributable to data |

Daily during the parallel run: a reconciliation report (generated by the platform) lists every mismatch; S fixes root causes, not records. Weekly: E, W, S review the report and decide go or hold.

Stop conditions: any lost trip event, any PHI exposure, or a broker objection pauses the pilot and returns that vehicle to Bambi the same day.

---

## 8. Cutover and after

**Cutover runbook (Mar 30 to Apr 3):**

1. Friday Mar 27: final full export from Bambi; migrate riders, standing orders, drivers, vehicles, open trips. Verify counts.
2. Saturday Mar 28: W builds Monday's schedule in Nuezra Dispatch only; Bambi set to read-only.
3. Monday Mar 30: all drivers on the Nuezra app. S on live support 4:30 am to 3:00 pm ET all week. E rides along day one.
4. Daily reconciliation report reviewed at 3:00 pm.
5. Friday Apr 3: go or rollback decision. Rollback means reactivating Bambi and re-entering the week's changes, which is why Bambi stays paid until Apr 30.

**After cutover:** weekly release cadence; a change log W can read; quarterly HIPAA review; annual penetration test; broker re-verification whenever a broker changes its file format or portal.

---

## 9. Broker criteria questionnaire (for Ezra to ask each broker)

1. Do you require providers to use specific dispatch software, or any system that meets your requirements? If specific, which, and is there an approval path for others?
2. What trip evidence do you verify before paying: GPS at pickup and drop-off, timestamps, signatures, odometer, mileage? What tolerances do you apply?
3. How are trips assigned to us: portal, file, API? What formats and how often?
4. How do you want completed-trip results back: portal entry, file upload, API? Is there a specification document and a test environment?
5. What are your no-show documentation rules: wait time, call attempts, photo, notification window?
6. What are your data retention requirements for trip records?
7. Do you prohibit offshore access to member data? Any requirements for where the system is hosted?
8. What security or HIPAA documentation do you need from a provider's software: BAA, risk assessment, penetration test, SOC 2?
9. Who is the contact for software or integration questions, and what is the approval process and typical timeline?
10. If we run a parallel test with our own system on a subset of trips, what do you need to see to approve full use?

Record answers in the criteria matrix, one column per broker.

---

## 10. Risks

| Risk | Mitigation |
|---|---|
| A broker only accepts named vendors | Import and export layer makes Nuezra Dispatch work alongside the broker's tool; Bambi stays for that broker's trips if required; revisit every six months |
| App store review delays | Create developer accounts and submit a placeholder build in Stage 1; TestFlight and Play internal testing for pilots |
| Background GPS drains batteries or iOS throttles it | Breadcrumb interval tuned per trip state; chargers in vehicles; status events carry their own GPS fix so breadcrumbs are supplementary |
| Offline events lost or out of order | Durable on-device queue; device and server timestamps; conflict rules tested in Stage 4 |
| Single developer | Decide staffing by Dec 18; if solo, cutover moves to late April and the operating plan is updated |
| Bambi export is thin or has no API | Confirm in Nov; fall back to scheduled report exports and screenshots for parity checks |
| PHI leakage through maps, logs, or error tracking | Addresses and coordinates only to map APIs; PHI scrubbing in logs; reviewed in the pen test |
| Scope creep before approval | MVP list in Section 3 is frozen at PRD sign-off; new asks go to v1.1 |

---

## 11. Decisions needed

| # | Decision | Owner | By |
|---|---|---|---|
| 1 | Stack and hosting (Section 4) | S, E informed | Nov 6 |
| 2 | Staffing: DexTech solo or with a second developer | S | Dec 18 |
| 3 | Broker criteria collected (D8) | E | Nov 13 |
| 4 | App distribution: public app stores under Nuezra's developer accounts | E | Nov 13 |
| 5 | Mapping provider | S | Nov 20 |
| 6 | PRD sign-off, MVP scope frozen | E | Dec 18 |
| 7 | Go or hold at each parallel-run gate | E, with S and W | Feb 26, Mar 13, Mar 27 |
