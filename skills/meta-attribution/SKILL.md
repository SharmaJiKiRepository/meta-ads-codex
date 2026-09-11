---
name: meta-attribution
description: "Meta attribution health audit covering the Meta attribution setting (7-day click / 1-day view and alternatives), view-through attribution, Aggregated Event Measurement (AEM) and the SKAdNetwork/AdAttributionKit path for Meta App campaigns, Conversions API deduplication, Consent Mode / CMP signal for Meta, attribution windows by sales cycle, and cross-device stitching via Customer Audiences. Use when user says Meta attribution, attribution window, 7-day click, 1-day view, view-through, AEM, Aggregated Event Measurement, SKAN, iOS 14.5, conversion window, or Meta attribution setting."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

# Meta Attribution Health Audit

Attribution decay is the silent revenue killer for Meta advertisers — iOS ATT,
the SKAdNetwork → AdAttributionKit migration, EEA Consent Mode enforcement
(Jul 21, 2025), and the death of third-party cookies have pushed Meta's signal
toward modeled, server-side, first-party data. A misconfigured attribution
setting or an unverified CAPI/dedup setup will mis-attribute 15-40% of
conversions and silently misallocate budget. This audit is Meta-only; it maps
every conversion Meta claims back to how and when it was measured.

## Process

1. Collect the current attribution stack: ad account ID, the attribution
   setting per ad set, Events Manager config (Pixel + Conversions API, AEM
   priority list, dedup rate, EMQ), domain verification, any App events via
   the Meta SDK / MMP, and the consent/CMP setup for EEA traffic
2. Read `meta-ads/references/conversion-tracking.md` for the Meta tracking baseline
3. Evaluate attribution health per surface (web, iOS app, Android app, server-side)
4. Score each surface PASS / WARNING / FAIL
5. Generate findings report with an attribution map and remediation plan

## What to Analyze

### The Meta attribution setting (per ad set)

- **Default is 7-day click / 1-day view** — confirm this is intentional and
  consistent across ad sets; mixing windows makes cross-ad-set comparison invalid
- **1-day view** counts a conversion when someone saw (not clicked) the ad and
  converted within 24h — legitimate for high-intent retargeting, misleading for
  cold prospecting. Flag ad sets leaning on view-through for the majority of results
- **Click-only windows** (1-day / 7-day click, no view) for lead gen and
  considered purchases where view-through over-credits
- **Comparison window vs optimization window**: Meta optimizes to the ad set's
  selected window; reporting can show other windows in the "Comparing Windows"
  view. Never compare a 7d-click number against a 1d-click number as if equal
- **Attribution setting changes reset learning** — treat any change as a
  learning-phase reset and avoid during active learning

### Aggregated Event Measurement (AEM) — web, iOS

- **Domain verified** in Business Manager (required to configure web events for
  iOS 14.5+ users)
- **8 conversion events configured and prioritized** per domain in Events
  Manager; the highest-priority event that fires is the one attributed for
  opted-out iOS users
- **Priority order matches business value** (e.g. Purchase > InitiateCheckout >
  AddToCart > ViewContent) — a mis-ordered list under-reports revenue events
- **Value optimization / value sets** configured if running ROAS bidding, so
  AEM can report value buckets
- **72-hour AEM reporting delay** understood — same-day dashboards under-count
  iOS conversions; wait for the window to close before judging performance

### SKAdNetwork / AdAttributionKit (Meta App campaigns)

- **SKAN/AAK path active** for App Promotion campaigns; Advantage+ App
  campaigns rely on it for opted-out iOS installs
- **SKAN conversion value schema** maps to meaningful post-install actions
  (purchase, subscription_start, trial_start) — not just install → open
- **MMP integration** (AppsFlyer / Adjust / Branch / Singular) sends post-install
  events back to Meta so App campaigns can optimize to value
- **Privacy threshold awareness** — low-volume App campaigns receive null / coarse
  postbacks; consolidate ad sets below ~1k installs/week

### Conversions API deduplication (the core of modern Meta attribution)

- **Browser Pixel + server CAPI both send the key events** (Purchase, Lead,
  etc.) with a shared `event_id` and matching `event_name`
- **Deduplication rate ≥90%** in Events Manager (Meta drops the duplicate; a low
  dedup rate means double-counted conversions inflating reported results)
- **EMQ ≥8.0 for Purchase** — poor Event Match Quality reduces attributed
  conversions because Meta cannot match the event to a user
- **customer_information parameters** (`em`, `ph`, `fn`, `ln`, `ct`, `st`, `zp`,
  `external_id`, `fbc`, `fbp`) sent server-side to maximize match rate
- **`fbc` (click ID) and `fbp` (browser ID)** captured and forwarded — the single
  biggest lever on match quality for click-through attribution

### Consent / CMP signal (EEA + recommended globally)

- **A CMP is live** and Meta only receives events for users who consented, or via
  Meta's consent-aware CAPI parameters where applicable
- **Signal loss quantified** for EEA traffic and factored into benchmark expectations
- **Limited Data Use (LDU)** flag set correctly for applicable US state privacy
  regimes so events are processed under the right mode

### Cross-Device & Retargeting stitching

- **Customer list Custom Audiences** uploaded hashed (SHA-256, lowercased,
  trimmed) and refreshed < 7 days for cross-device matching
- **Website Custom Audiences** built on deduped Pixel+CAPI traffic, not Pixel-only
- **Exclusions applied** so purchasers aren't re-attributed in prospecting, and
  overlapping audiences don't double-serve
- **Offline / CRM conversions imported** within 72h for considered-purchase and
  B2B sales cycles so Meta learns the true conversion, not the form fill

## Key Thresholds

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| Attribution setting consistency | Uniform, intentional | Mixed but justified | Mixed by accident |
| View-through share of results | <20% | 20-40% | >40% (view-through inflated) |
| EMQ (Purchase) | ≥8.0 | 6.0-7.9 | <6.0 |
| Event dedup rate | ≥90% | 70-89% | <70% |
| Domain verified + AEM prioritized | Yes, ordered by value | Verified, default order | Not verified |
| `fbc`/`fbp` forwarded via CAPI | Both | One | Neither |
| Customer list freshness | <7 days | 7-30 days | >30 days |
| Offline conversion import latency | <24h | 24-72h | >72h |

## Output

### Attribution Health Score

```
Meta Attribution Health Score: XX/100 (Grade: X)

Attribution setting & windows:   XX/100  ████████░░  (20%)
AEM (web + iOS):                  XX/100  █████████░  (20%)
SKAN / AAK (app):                 XX/100  ███████░░░  (10%)
CAPI dedup & match quality:       XX/100  ██████████  (30%)
Consent / CMP signal:             XX/100  ████████░░  (10%)
Cross-device / Customer Audiences:XX/100  ███████░░░  (10%)
```

### Deliverables

- `META-ATTRIBUTION-AUDIT.md`: Full surface-by-surface findings
- Attribution map: which events are attributed via click, view, AEM, SKAN, and CAPI
- Modeled vs reported conversion delta (estimated revenue under- or over-attribution)
- Quick Wins sorted by signal-recovery $ impact
- A pre-launch checklist so tracking, dedup, domain verification, and AEM
  priority are wired before any new campaign spends
