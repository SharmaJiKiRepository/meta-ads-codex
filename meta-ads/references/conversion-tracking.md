# Meta Conversion Tracking Setup & Requirements

<!-- Meta-only conversion tracking reference -->

## Required Stack

```
1. Meta Pixel        → base code + standard events on all key pages
2. Conversions API   → server-to-server event forwarding (Gateway / S2S / partner)
3. Event Deduplication → shared event_id + event_name between Pixel and CAPI
4. EMQ Optimization  → send em, ph, fn, ln, ct, st, zp, external_id, fbp, fbc
5. Aggregated Event Measurement (AEM) → 8 prioritized web events for iOS
6. Domain verification → required in Business Manager to configure web events
```

## Meta Pixel

- Base code fires on every page; standard events fire on the meaningful actions
- Each event carries `value` + `currency` where monetizable, and catalog params
  (`content_ids`, `content_type`, `num_items`) for e-commerce / DPA
- Generate the `event_id` once client-side and reuse it for the matching CAPI event

## Standard Events (use these, not custom where possible)

```
Purchase, AddToCart, InitiateCheckout, AddPaymentInfo,
Lead, CompleteRegistration, Subscribe, ViewContent,
Search, AddToWishlist, Contact, CustomizeProduct,
FindLocation, Schedule, StartTrial, SubmitApplication
```

## Conversions API (CAPI)

- Without CAPI: 30-40% conversion signal loss post-iOS 14.5 — Pixel-only is critically insufficient
- With CAPI: typically 15-20% performance improvement over Pixel-only; bypasses ad blockers and ITP
- **action_source** set per event (`website`, `app`, `physical_store`, `email`, `system_generated`)
- The **Offline Conversions API was discontinued (May 2025)** — send offline/in-store events
  through CAPI with `action_source='physical_store'`
- Integration options: CAPI Gateway (easiest), direct server-to-server, partner
  integration (Shopify/WooCommerce/etc.), or a server-side GTM container forwarding to Meta

## Event Match Quality (EMQ)

| Score | Rating | Action |
|-------|--------|--------|
| <4.0 | Critical | Severe data loss; urgent fix |
| 4.0-5.9 | Warning | Significant signal gaps |
| 6.0-7.9 | Acceptable | Some optimization possible |
| 8.0-10.0 | Excellent | Maximum signal strength |

**Parameters by impact:** email (`em`) is the strongest signal, then phone (`ph`),
then `external_id`, `fbp` (browser ID), and `fbc` (click ID). `fbc`/`fbp` are the most
commonly missing high-leverage parameters for click-through matching.

**Tiered EMQ targets by event:** Purchase 8.5+, AddToCart 6.5+, PageView 5.5+.

~87% of advertisers sit below EMQ 8.0; fixing it typically improves performance 20-40%.

## Event Deduplication

```
Same event_id + same event_name (Pixel + CAPI) = deduplicated (correct)
Missing/mismatched event_id                     = double-counting (broken)

Check: Events Manager → dataset → Overview / Diagnostics → Deduplication
Target: ≥90% dedup rate
```

## Aggregated Event Measurement (AEM)

- **Domain verified** in Business Manager (required to configure web events for iOS 14.5+ users)
- **8 events prioritized by business value** per domain; for opted-out iOS users, the
  highest-priority event that fires is the one attributed
- A mis-ordered priority list under-reports revenue events (put Purchase above AddToCart)
- **~72h AEM reporting delay** — don't judge iOS performance before the window closes
- Configure **value sets** if running ROAS / value optimization

## Attribution

- Default and recommended: **7-day click / 1-day view**
- Keep the attribution setting consistent across ad sets; changing it resets learning
- Match the window to the sales cycle: 7-day click for e-commerce; click-only for
  considered/lead-gen where view-through over-credits
- Import offline / CRM conversions within 72h for considered purchases so Meta learns
  the true conversion, not the form fill

## Consent (EEA + recommended globally)

- A CMP must gate the Pixel/CAPI so Meta only receives events for consented EEA users
- Set **Limited Data Use (LDU)** correctly for applicable US state privacy regimes
- Never send sensitive-category (e.g. health-condition) data through the Pixel/CAPI

## Meta Tracking Health Checklist

| Check | Severity | Pass Criteria |
|-------|----------|---------------|
| Pixel firing on key pages | Critical | Base code + standard events verified in Pixel Helper |
| Conversions API active | Critical | Server events for all key events |
| Event deduplication | Critical | Shared event_id, ≥90% dedup rate |
| EMQ (Purchase) | Critical | ≥8.0 |
| customer_information coverage | High | 6+ params incl. fbc/fbp |
| Domain verified + AEM prioritized | High | Verified, 8 events ordered by value |
| Attribution setting consistent | Medium | Uniform 7d-click/1d-view unless justified |
| Offline/CRM import | Medium | Active for considered-purchase / B2B accounts |
| Consent / LDU respected | High | CMP live for EEA; LDU set for US state laws |

## Incrementality

For advanced accounts, use **Meta Conversion Lift** (randomized holdout) to measure the
conversions and revenue the ads actually caused, and reconcile it against MER — reported
ROAS both over- and under-states depending on window and iOS signal loss.
