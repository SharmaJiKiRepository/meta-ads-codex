---
name: meta-capi
description: "Meta Conversions API (CAPI) and server-side tracking pipeline audit covering CAPI Gateway, direct server-to-server CAPI, partner integrations, event deduplication via event_id, Event Match Quality (EMQ), server-side hit ratio, customer_information parameter coverage, action_source, Pixel debugging, and PII hashing discipline. Use when user says Conversions API, CAPI, CAPI Gateway, Meta Conversions API, server-side tracking, event deduplication, event_id, EMQ, pixel debug, pixel health, Pixel/CAPI audit, first-party tracking, or iOS 14.5 recovery."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

# Meta Conversions API & Server-Side Tracking Pipeline Audit

Audits the entire server-side measurement pipeline that feeds Meta's delivery
and bid algorithms. Without the Conversions API in 2026, expect 30-40%
conversion signal loss from iOS ATT, ITP, and aggressive ad blockers — that's
the gap between what actually happened and what Meta's optimization can see.
Every point of signal Meta loses degrades Advantage+ delivery and inflates CPA.

This sub-skill is technical and deep. It is NOT the same as `meta-attribution`,
which audits the *attribution setting and windows* sitting on top of these events.

## Process

1. Collect the server-side stack inventory: CAPI integration method (CAPI
   Gateway / direct server-to-server / partner integration / sGTM), the dataset
   (formerly Pixel) ID, event schema documentation, and hosting infrastructure
2. Read `meta-ads/references/conversion-tracking.md` for the Meta tracking baseline
3. Test event flow: trigger known events → verify each appears in BOTH the
   browser Pixel (Meta Pixel Helper) AND server-side (Events Manager → Test Events)
4. Audit deduplication, hashing, and parameter completeness
5. Score health PASS / WARNING / FAIL per surface
6. Generate findings report

## What to Analyze

### CAPI integration method

- **Conversions API is active** — server-to-server events alongside the browser Pixel
- **CAPI Gateway** is preferred over a hand-rolled server implementation
  (auto-hashing, fuller parameter coverage, lower maintenance) for advertisers
  without an engineering team
- **Direct server-to-server** integration is acceptable when built correctly with
  complete parameters and dedup — audit it end to end rather than assuming
- **Partner integration** (Shopify, WooCommerce, GTM server container, etc.) is
  the fastest path for platform-hosted stores — confirm it's sending the full
  event set, not just Purchase
- **sGTM → Meta**: if a server-side GTM container is the transport, confirm it
  forwards to Meta CAPI with a first-party custom domain (`tags.example.com`) so
  ITP / ad blockers don't strip the browser side

### Event coverage (dataset)

- **All major events sent server-side**: PageView, ViewContent, AddToCart,
  InitiateCheckout, Purchase, Lead, CompleteRegistration
- **action_source** set correctly per event (`website`, `app`,
  `physical_store`, `email`, `system_generated`)
- **Value + currency** present on every monetizable event (required for ROAS
  bidding and value optimization)
- **content_ids / content_type / num_items** present for catalog / DPA events

### Event Match Quality (EMQ)

- **EMQ ≥8.0 for Purchase** — confirm via Events Manager → dataset → Overview
- **customer_information parameters sent server-side**: `em` (email), `ph`
  (phone), `fn`/`ln` (name), `ct`/`st`/`zp` (geo), `external_id`,
  `client_ip_address`, `client_user_agent`, `fbc` (click ID), `fbp` (browser ID)
- **`fbc` + `fbp` captured and forwarded** — the highest-leverage parameters for
  click-through match rate; missing them is the most common EMQ killer
- **Match-rate roadmap**: rank the missing/low-coverage parameters by expected
  EMQ lift and sequence the fixes

### Event Deduplication

- **event_id** generated once client-side and included in BOTH the browser Pixel
  event AND the CAPI payload — Meta dedupes on `event_id` + `event_name`
- **Dedup rate ≥90%** measured in Events Manager → Diagnostics
- **event_name consistency** — the server uses the same canonical event names as
  the browser (don't rename in transit)
- **Timestamp alignment** — the server event's `event_time` is within a few
  minutes of its browser counterpart

### Server-Side Hit Ratio

- **Server-side ≥80% of browser hits** for Purchase / Lead — anything lower means
  iOS / ITP / ad-blocker loss isn't being recovered
- **Server-side >100% is acceptable** — the server captures conversions the
  browser missed (exactly what CAPI is for)
- **Hit ratio monitored over time** — a drop below 60% signals broken server-side
  firing or missing `event_id`

### Pixel / CAPI debug walkthrough

Validate every event end-to-end when deployed:

- **Meta Pixel Helper** (Chrome extension) shows the browser Pixel firing with
  correct event_name + event_id + value + currency
- **Events Manager → Test Events** shows the CAPI event arriving with a matching
  `event_id` and populated `customer_information` parameters
- **Events Manager → Diagnostics** shows no "duplicate events not being
  deduplicated", "missing parameters", or "invalid email" warnings
- **Network tab** confirms the browser Pixel and, where used, the sGTM forward
- **`window.dataLayer` / pixel base code** populates expected variables before tags fire

### Hash quality & PII handling

- **Email**: lowercased + trimmed + SHA-256 (no other normalization)
- **Phone**: E.164 format + SHA-256 (e.g. `+15551234567`)
- **Name**: lowercased + trimmed + SHA-256, first / last separately
- **City / state / zip**: lowercased + SHA-256
- **NEVER hash already-hashed values** — double-hashing breaks matching
- **NEVER send plain PII server-side** — only hashed fields (Meta hashes IP/UA on receipt)
- **Consent respected**: confirm consent / LDU state is read before sending PII,
  even hashed, for EEA and applicable US state privacy regimes

## Key Thresholds

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| CAPI integration | Gateway / verified S2S | Manual CAPI | Pixel-only |
| sGTM custom domain (if used) | Active | Configured, not active | Not configured |
| EMQ (Purchase) | ≥8.0 | 6.0-7.9 | <6.0 |
| Dedup rate | ≥90% | 70-89% | <70% |
| Server / browser hit ratio | 80-120% | 50-79% | <50% |
| customer_information completeness | 6+ params | 4-5 params | <4 params |
| `fbc` + `fbp` forwarded | Both | One | Neither |
| Test-events validation | All 6 events pass | 3-5 events pass | <3 events pass |

## Output

### Conversions API Health Score

```
Meta CAPI / Server-Side Health Score: XX/100 (Grade: X)

CAPI integration & transport:  XX/100  ██████████  (25%)
Event coverage & params:       XX/100  █████████░  (20%)
EMQ / match quality:           XX/100  █████████░  (20%)
Deduplication:                 XX/100  ████████░░  (15%)
Server-side hit ratio:         XX/100  ███████░░░  (10%)
Hash quality / PII handling:   XX/100  ██████░░░░  (10%)
```

### Deliverables

- `META-CAPI-AUDIT.md`: Full pipeline findings
- Test-event reproduction log (which events validated end-to-end, on which date,
  with Events Manager → Test Events screenshots)
- EMQ improvement roadmap (parameter-by-parameter, ranked by expected lift)
- Hit-ratio monitoring recommendation
- Pre-launch checklist so the dataset, dedup, and parameter coverage are wired
  before any new campaign spends
