# Meta Budget Allocation & Scaling Framework

<!-- Meta-only budget reference -->

## Objective / Campaign-Type Selection by Business Type

| Business Type | Core (55-70%) | Secondary (15-30%) | Testing (5-10%) | Min Monthly | Primary KPI |
|--------------|---------------|--------------------|-----------------|-------------|-------------|
| E-commerce DTC | Advantage+ Shopping (Sales) | Catalog/DPA retargeting | Reels-first prospecting | $3,000 | ROAS / MER |
| SaaS B2B | Leads (trial/demo) | Retargeting | Awareness video | $3,000 | CPL(qualified) / LTV:CAC |
| Local Service | Leads / Calls | Click-to-Messenger | Reels awareness | $1,500 | Cost per booked job |
| B2B Enterprise | Leads (content offer) | Retargeting (demo) | Thought-leadership video | $5,000 | Pipeline / SQL |
| Info Products | Leads (opt-in/webinar) | Sales (tripwire) + retargeting | Reels hooks | $1,500-$3,000 | ROAS / webinar CPL |
| Mobile App | App Promotion (Advantage+ App) | Re-engagement | Manual App creative | $3,000 | Cost per activated install / ROAS |
| Real Estate | Leads (Housing SAC) | Retargeting listings | Video tours | $1,500-$3,000 | Cost per qualified lead |
| Healthcare | Leads / Calls | Awareness | Retargeting | $2,000-$4,000 | Cost per booked appointment |
| Finance | Leads (Credit SAC) | Retargeting | Awareness | $3,000-$5,000 | Cost per funded/approved |
| Agency (own) | Leads | Retargeting | Awareness | $1,500 | Cost per lead |

SAC = Special Ad Category (restricted targeting).

## Budget Distribution Rule: 70/20/10

```
70% → Proven winners (campaigns/ad sets with established positive ROAS/CPA)
20% → Scaling (winners being ramped under the 20% rule)
10% → Testing (new concepts, audiences, placements)
```

Also mind the **prospecting vs retargeting** split (commonly ~70-80% / 20-30%) —
retargeting can't scale alone; prospecting feeds the audiences retargeting converts.

## Scaling Decision Tree

### 20% Rule (scale up)
```
IF actual_CPA < target_CPA by >10%
AND weekly conversions ≥ learning threshold (~50/ad set)
AND the ad set is NOT in the learning phase
THEN increase budget by ~20%
→ Wait 3-5 days before the next increase
→ Never jump more than ~20% at once (it re-triggers learning)
```

### 3× Kill Rule (pause)
```
IF spend > 3× target_CPA
AND conversions == 0 (with learning exited)
THEN pause the ad set / campaign immediately
→ Diagnose: tracking, creative, audience, offer, landing page
→ Don't restart without a change
```

### Diminishing-returns detection
```
IF CPA rose >15% after the last budget increase
THEN roll back to the previous budget
→ Wait ~7 days
→ Try horizontal scaling instead (new audiences / new distinct concepts)
```

### Saturation signals (Meta)
| Signal | Threshold | Action |
|--------|-----------|--------|
| Frequency (prospecting, 7-day) | >4.0 | Audience exhausted — refresh creative or broaden |
| Frequency (retargeting, 7-day) | >12.0 | Cap frequency / rotate creative |
| CPM rising with flat CTR | >20% / 14d | Saturation — new distinct concepts |
| Audience overlap | >30% | Consolidate ad sets; you're bidding against yourself |

## Marketing Efficiency Ratio (MER)

```
MER = Total Revenue / Total Meta Spend
```

| Business Type | Healthy MER | Excellent | Danger Zone |
|--------------|-------------|-----------|-------------|
| E-commerce | 3.0-5.0 | >5.0 | <2.0 |
| SaaS | Use LTV:CAC (3:1 target) | >4:1 | <2:1 |
| Lead Gen | Revenue/Lead × CVR / CPL | — | <1.5 |

**Why MER alongside ROAS:** post-iOS attribution under-reports, so in-platform ROAS
misses conversions Meta can't see; MER captures true blended economics. Validate with
Meta **Conversion Lift** where budget supports it.

## Seasonality Adjustments

### Q4 (Oct-Dec)
- CPMs rise 30-50%; relax ROAS targets ~20%
- Front-load creative testing in September/October
- Increase budgets 40-60% for BFCM; Advantage+ Shopping performs best at peaks

### Q1 (Jan-Mar)
- CPMs fall 20-30% post-holiday; best window for testing and cheap acquisition
- Jan 2026 CPC ~$0.85 (24% below prior January)

### Q2 (Apr-Jun)
- Steady CPMs; Mother's/Father's Day retail spikes

### Q3 (Jul-Sep)
- Build retargeting pools for Q4; test new distinct concepts before CPMs climb

## Incrementality Testing (Meta Conversion Lift)

- Use a randomized holdout to measure the conversions/revenue Meta actually caused
- Duration: 2-4 weeks minimum; require statistical significance before acting
- Reserve budget for testing (a common rule of thumb is ~10% of monthly spend)
- Pair with **post-purchase surveys** ("How did you first hear about us?") to fill
  the ~30% attribution gap digital tracking misses

## Attribution Hierarchy (source of truth)

```
Best → worst:
1. CRM / backend revenue (actual orders, funded deals, LTV)
2. MER (total revenue / total Meta spend)
3. Meta Conversion Lift (incremental)
4. Post-purchase surveys
5. Meta-reported ROAS (useful for optimization, but over/under-reports)

RULE: never trust Meta-reported ROAS alone; cross-reference with ≥2 other sources.
```

## Minimum Viable Meta Budget

| Situation | Minimum monthly | Rationale |
|-----------|-----------------|-----------|
| Single conversion campaign | $600-$800 | ~50 events/week/ad set × CPA |
| Full-funnel structure | ~$3,000+ | Prospecting + retargeting + testing |
| High-CPM verticals | $3,000-$5,000+ | High CPM raises the learning floor |
