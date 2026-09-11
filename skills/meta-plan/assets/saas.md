<!-- Meta industry template -->
# SaaS Meta Advertising Template

## Industry Characteristics

- Longer consideration cycle; multiple touches before trial/demo
- Success measured on qualified trials/demos and downstream activation, not just leads
- LTV is high, so a higher CPA tolerance is justified if payback holds
- Content and retargeting do heavy lifting; cold conversion is harder than e-commerce
- Free-trial vs demo-request funnels behave differently and need separate tracking

## Recommended Objective & Placement Mix

| Layer | Objective | Budget % | Why |
|-------|-----------|----------|-----|
| Core | Leads (conversion Leads or Instant Forms) | 45-60% | Drive trials/demos with a strong lead event |
| Retargeting | Leads / Traffic to pricing & case studies | 20-30% | Warm the considered buyer over multiple touches |
| Awareness | Video views / Engagement (thought leadership) | 10-20% | Build the top of funnel Meta retargets later |
| Testing | Reels-first prospecting | 5-10% | Cheap reach, fresh hooks |

## Campaign Architecture

```
Ad Account
├── Prospecting (Leads)
│   ├── Ad Set: 1-3% Lookalike of trials / paying customers
│   └── Ad Set: Broad / interest, creative-led
├── Retargeting (Leads)
│   ├── Ad Set: Site visitors + pricing viewers (30 days)
│   └── Ad Set: Video viewers / engagers (webinar, demo)
├── Awareness (Video views)
│   └── Ad Set: Educational / founder / product-explainer video
└── Testing
    └── New hooks, offers (trial length, demo vs self-serve)
```

## Creative Strategy

- **Problem→solution demos** of the product doing the one job that matters
- **Founder / expert talking-head** (UGC-style) explaining the "why now"
- **Social proof**: logos, ROI stats, G2/review pull-quotes
- **Comparison / "switch from X"** angles for category-aware buyers
- **Lead magnet** creative (template, benchmark report, ROI calculator)
- Ship distinct concepts (problem-led, proof-led, comparison-led) — not tweaks

## Targeting Strategy

- **Lookalikes** of trials and, better, of *paying* customers
- **Custom Audiences** from CRM lists (hashed) for expansion + suppression
- **Retargeting** on pricing/case-study visitors and webinar registrants
- **Exclusions**: existing customers and recent trials out of prospecting

## Budget & Benchmarks

| Metric | SaaS Meta benchmark (directional) |
|--------|-----------------------------------|
| Meta CPM | $10-$22 |
| Meta CTR | 0.8%-1.6% |
| Cost per lead (trial/demo) | $15-$80 depending on ACV |
| Min viable monthly budget | ~$3,000+ to gather lead volume |

### Bidding
- Start **Highest Volume**; move to **Cost Cap** once cost-per-qualified-lead is stable
- Import the *qualified*/activation event via CAPI so Meta optimizes past the form fill

## KPI Targets

| Metric | Month 1 | Month 3 | Month 6 |
|--------|---------|---------|---------|
| Cost per qualified lead | Baseline | -15% | -25% |
| Trial→paid rate | Track | Improve | Improve |
| EMQ (Lead) | Track | ≥7.0 | ≥8.0 |
| CAC payback | Track | <12 mo | <9 mo |

## Common Pitfalls

- Optimizing to raw leads, not qualified trials/activations (garbage leads scale fastest)
- No offline/activation conversion imported via CAPI, so Meta learns the wrong signal
- Under-investing in retargeting for a considered purchase
- One creative angle repeated — clusters under Andromeda
