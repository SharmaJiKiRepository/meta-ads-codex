---
name: meta-budget
description: "Meta budget allocation and bidding strategy review. Evaluates spend distribution across objectives and prospecting/retargeting, Advantage campaign budget (CBO) vs ad-set budget (ABO), bidding strategy appropriateness (Highest Volume, Cost Cap, Bid Cap, ROAS goal), learning-phase health, scaling readiness, and identifies ad sets to kill or scale. Uses the 70/20/10 rule, 3x Kill Rule, and 20% scaling rule. Use when user says budget allocation, bidding strategy, ad spend, ROAS target, cost cap, CBO, ABO, media budget, or scaling."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

<!-- Meta budget & bidding -->

# Meta Budget Allocation & Bidding Strategy

## Process

1. Collect budget and performance data across active campaigns, ad sets, and objectives
2. Read `meta-ads/references/budget-allocation.md` for the allocation framework
3. Read `meta-ads/references/bidding-strategies.md` for the bidding decision tree
4. Read `meta-ads/references/benchmarks.md` for CPM / CPC / CPA benchmarks
5. Read `meta-ads/references/scoring-system.md` for the health-score algorithm
6. **Validate**: confirm spend data covers ≥14 days (and the learning phase has resolved) before kill/scale decisions
7. Evaluate allocation, bidding strategy, budget sufficiency, and scaling readiness
8. **Validate**: verify kill candidates have enough data (≥50 clicks or ≥$100 spend, learning phase exited) before recommending pause
9. Generate recommendations with a kill list and a scale list

## Budget Allocation Framework

### 70/20/10 rule (within the Meta account)
- **70%** on proven campaigns/ad sets consistently hitting CPA / ROAS targets
- **20%** on scaling ad sets — winners you're ramping under the 20% rule
- **10%** on testing — new concepts, new audiences, new objectives

### Prospecting vs retargeting split
- Most accounts run **~70-80% prospecting / 20-30% retargeting**; retargeting alone
  can't scale, prospecting feeds the funnel
- Exclude purchasers/leads from prospecting; keep retargeting frequency in check
- With **Advantage+ Audience**, "prospecting vs retargeting" blurs — control the mix
  with exclusions and existing-customer caps rather than rigid audience walls

### Objective / campaign-type selection by business type

| Business Type | Primary objective / type | Secondary | Testing |
|---------------|--------------------------|-----------|---------|
| E-commerce | Advantage+ Shopping (Sales) | Manual Sales, Catalog/DPA retargeting | Reels-first prospecting |
| SaaS B2B | Leads (Instant Forms / conversion Leads) | Retargeting Sales | Awareness for pipeline |
| Local Service | Leads / click-to-Messenger / calls | Traffic to booking | Reels awareness |
| B2B Enterprise | Leads with CRM Custom Audiences | Retargeting | Thought-leadership video |
| Info Products | Leads (webinar/opt-in) | Sales (low-ticket) | Advantage+ Shopping |
| Mobile App | App Promotion (Advantage+ App) | Retargeting via SDK events | Value-optimized installs |
| Real Estate | Leads (Housing Special Ad Category) | Traffic to listings | Reels/Stories tours |
| Healthcare | Leads (no restricted targeting) | Awareness | Retargeting |
| Finance | Leads (Credit Special Ad Category) | Sales | Retargeting |
| Agency (clients) | Varies by client | N/A | N/A |

### Budget sufficiency rules

| Setting | Minimum | Learning-phase requirement |
|---------|---------|----------------------------|
| Ad set daily budget | ~$20/day floor for most objectives | ≥5x target CPA in weekly budget |
| Learning phase exit | — | ~50 optimization events per ad set per week |
| Advantage+ Shopping | Higher floors than a single ad set | Enough budget for the algorithm to explore placements |
| Cost Cap | Set slightly above realistic CPA | Under-capping starves delivery and stalls learning |

## Bidding Strategy Evaluation

### Meta bidding decision tree

```
Start
├─ New ad set / <50 conv/week?
│  └─ Highest Volume (no cap) to gather data and exit learning
│     └─ Once CPA is stable → introduce Cost Cap near realistic CPA
├─ Stable CPA, need efficiency at scale?
│  └─ Cost Cap (CPA ceiling) — accept some volume trade-off
├─ Need hard control on auction price?
│  └─ Bid Cap (max bid) — advanced; requires close monitoring
└─ Value tracking live (Purchase value + ROAS)?
   └─ ROAS goal (minimum ROAS) — needs strong value signal + volume
```

- **Highest Volume (lowest cost)**: default; best for volume and learning, CPA can vary
- **Cost Cap**: sets a CPA ceiling; may reduce volume but protects efficiency
- **Bid Cap**: maximum bid per auction; the most control, the most maintenance
- **ROAS goal**: targets a minimum return; only reliable with clean value + dedup
- **Advantage campaign budget (CBO)** for proven campaigns so budget flows to the
  best ad sets; **ABO** for testing when you need to protect each test's budget

### Advantage+ bidding notes
- Advantage+ Shopping optimizes budget across placements in real time — pair with
  **broad targeting + high creative volume** for it to work
- Set the **existing-customer cap** (10-25%) so budget isn't wasted re-buying loyal customers
- Don't stack manual audience constraints on top of Advantage+ Audience without a reason —
  it starves the algorithm

## Scaling Assessment

### Ready to scale (green light)
- CPA consistently below target for 2+ weeks
- Learning phase exited (~50 events/week/ad set), stable delivery
- CTR stable or improving; frequency in a healthy range
- ROAS above target; no creative-fatigue signals

### The 20% rule
Never raise an ad set / campaign budget by more than ~20% at a time — larger jumps
re-trigger the learning phase:
- Week 1: $100/day → $120/day
- Week 2: $120/day → $144/day
- Week 3: $144/day → $173/day
- Monitor 3-5 days after each increase before the next step

### Scaling methods
1. **Vertical**: raise budget on winning ad sets (20% rule) or move them under CBO
2. **Horizontal**: duplicate winners into new audiences / new creative concepts
3. **Placement expansion**: open Advantage+ Placements you'd restricted
4. **Geographic expansion**: test new markets/regions
5. **Format expansion**: add Reels/Stories or carousel/collection variants of a winner

## Kill List Assessment

### 3x Kill Rule
- Any ad set / campaign with CPA >3x target → **flag for pause**
- ≥14 days of spend with no conversions → **flag for pause and diagnose**
- Creative with CTR >50% below benchmark → **flag for creative kill**

### Kill decision framework
| Scenario | Data required | Action |
|----------|---------------|--------|
| CPA >3x target | ≥7 days, learning exited, ≥50 clicks | Pause immediately |
| No conversions | ≥$100 spend or ≥50 clicks | Pause and diagnose (tracking? offer? audience?) |
| CTR <50% of benchmark | ≥1,000 impressions | Kill creative, test a new concept |
| ROAS <50% of target | ≥14 days data | Cut budget 50% or pause |

> Never make edits mid-learning-phase — pausing is fine, but budget/audience/creative
> edits reset learning and waste the data you've already paid for.

## MER (Marketing Efficiency Ratio)

```
MER = Total Revenue / Total Meta Spend
```

- Use blended MER alongside in-platform ROAS, since post-iOS attribution
  under-reports; MER captures conversions Meta can't see
- Target MER varies by margin (commonly 3x-10x)
- Incrementality / lift testing (Meta Conversion Lift) recommended to validate
  that reported ROAS reflects true incremental revenue

## Output

### Budget & Bidding Assessment

```
Meta Budget Health

Allocation Strategy:  ████████░░  XX/100
Bidding Strategy:     ██████████  XX/100
Scaling Readiness:    ███████░░░  XX/100
Budget Sufficiency:   █████░░░░░  XX/100
```

### Deliverables
- `META-BUDGET-REPORT.md`: Full allocation and bidding analysis
- Current vs recommended split (prospecting / retargeting / testing; by objective)
- Bidding-strategy recommendations per campaign / ad set
- Scale list: ad sets ready for more budget (with 20%-rule schedule)
- Kill list: ad sets / campaigns to pause immediately
- MER analysis and trend
- Quick Wins for immediate budget optimization
