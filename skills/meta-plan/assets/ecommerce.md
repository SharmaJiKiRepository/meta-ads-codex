<!-- Meta industry template -->
# E-commerce Meta Advertising Template

## Industry Characteristics

- Transaction-focused with short purchase cycles
- ROAS (and blended MER) is the primary success metric
- A healthy product catalog/feed drives Advantage+ Shopping and catalog/DPA retargeting
- Seasonal demand patterns (Q4 holiday, back-to-school, sale events)
- High creative volume of *distinct* concepts needed (Andromeda rewards diversity, not variants)
- Price competition and margin pressure require efficiency focus
- Mobile commerce dominates (~90% of Meta impressions are mobile)

## Recommended Objective & Placement Mix

| Layer | Objective / Product | Budget % | Why |
|-------|--------------------|----------|-----|
| Core | Advantage+ Shopping (Sales) | 55-70% | Broad targeting + high creative volume; highest scale for DTC |
| Prospecting | Manual Sales (Lookalike/interest) | 10-20% | Control layer to test audiences the algorithm ignores |
| Retargeting | Catalog / DPA + testimonial Sales | 10-20% | Cart abandoners, viewers, cross-sell; lowest CPA |
| Testing | Reels-first prospecting | 5-10% | Cheap reach + fresh distinct concepts |

## Campaign Architecture

```
Ad Account
├── Advantage+ Shopping (Sales)
│   └── Broad + Advantage+ Audience, existing-customer cap 15-20%, 20+ distinct creatives
├── Prospecting (manual Sales)
│   ├── Ad Set: 1-3% Lookalike of purchasers / high-AOV customers
│   └── Ad Set: Interest / broad, creative-led
├── Retargeting (Sales, catalog/DPA)
│   ├── Ad Set: ViewContent (7 days)
│   ├── Ad Set: AddToCart / InitiateCheckout (14 days)
│   └── Ad Set: Past purchasers (180 days, upsell/cross-sell)
└── Testing
    └── New concepts, hooks, formats
```

## Creative Strategy

### What works for e-commerce on Meta
- **UGC unboxing / review** (9:16, sound-on) — authentic content beats studio in Reels/Feed
- **Product demos** — the product in use, feature close-ups, problem→solution
- **Before/after** — transformation content where applicable
- **Price anchoring** — was/now, bundle savings, free-shipping threshold
- **Social proof** — review count, star ratings, "best seller" badges
- **Catalog/DPA** — dynamic product creative for retargeting

### Creative volume requirements
| Layer | Min active creatives | Refresh cadence |
|-------|---------------------|-----------------|
| Advantage+ Shopping | 20+ distinct concepts | Add fresh weekly-biweekly |
| Manual prospecting | 5+ per ad set | 2-3 weeks |
| Reels-first | Treat like organic Reels cadence | Weekly |

### Seasonal creative calendar
- **Q1**: New-year deals, resolution products
- **Q2**: Mother's/Father's Day, spring-summer launch
- **Q3**: Back-to-school, early fall
- **Q4**: Black Friday / Cyber Monday, holiday gifting (raise budget 2-3x, start prep in October)

## Targeting Strategy

- **Advantage+ Audience**: let Meta optimize; broad works with strong creative
- **Lookalikes**: 1-3% of purchasers and high-AOV customers
- **Interest stacks**: for the manual control layer only, where you have a thesis
- **Exclusions**: exclude recent purchasers from prospecting; cap frequency on retargeting
- **Catalog health (critical)**: accurate titles, images, price, availability; product sets by margin/best-seller for DPA

## Budget & Benchmarks

| Metric | E-commerce Meta benchmark (directional) |
|--------|------------------------------------------|
| Meta CPM | $8-$18 (seasonal; higher in Q4) |
| Meta CPC | $0.70-$1.32 |
| Meta CTR (all placements) | 1.0%-2.0% |
| Meta ROAS | ~2.2 (median), 4.0+ (Advantage+ Shopping, strong creative) |
| Frequency (prospecting, 7d) | <3.0 healthy |
| Min viable monthly budget | ~$3,000+ to exit learning across the structure |

### Bidding strategy selection
| Situation | Recommended strategy |
|-----------|----------------------|
| New ad set / <50 conv/week | Highest Volume (no cap) to exit learning |
| Stable CPA, efficiency priority | Cost Cap at target CPA |
| Clean value + dedup, revenue focus | ROAS goal (set realistic minimum) |

### Seasonal budget adjustments
- **Q4 (Oct-Dec)**: increase 2-3x (CPMs rise 30-50%, but CVR rises too)
- **January**: reduce to baseline or below (post-holiday dip)
- **Sale events**: surge ~20% budget from 3 days before through the event

## KPI Targets

| Metric | Month 1 | Month 3 | Month 6 |
|--------|---------|---------|---------|
| ROAS | 2.0 (learning) | 3.0 | 4.0+ |
| CPA | Baseline | -15% | -25% |
| AOV | Baseline | +5% (bundles) | +10% |
| New-customer % | Track | 40%+ | 40%+ |
| MER | Track | 3.0 | 4.0+ |
| EMQ (Purchase) | Track | ≥7.0 | ≥8.0 |

## Common Pitfalls

- Running Advantage+ Shopping without a clean, healthy catalog (garbage in, garbage out)
- Shipping 100 variants instead of 10 distinct concepts (Andromeda clusters and suppresses them)
- Not tracking new vs returning customers (ROAS looks great on repeat buyers only)
- Creative fatigue: not refreshing distinct concepts every 2-4 weeks
- Editing mid-learning-phase and resetting the algorithm
- Q4 panic: starting holiday campaigns in November instead of October (learning phase)
- Reading platform-reported ROAS without a blended MER check
- CAPI down or EMQ <8: Meta can't see conversions, so delivery and attribution both suffer
