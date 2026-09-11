<!-- Meta industry template -->
# Generic Meta Advertising Template

Use this when the business doesn't cleanly match a specific vertical. It's the
neutral default: a full-funnel Meta structure with sensible objectives, tracking,
and creative discipline that you then tailor.

## Discovery First

Before applying this template, confirm:
- The single most important conversion (purchase, lead, message, install)
- Average order/deal value and margin (for ROAS/CPA math)
- Monthly budget and how fast the team can produce distinct creative
- Any **Special Ad Category** exposure (Housing / Credit / Employment / Social Issues)

## Recommended Objective & Placement Mix

| Layer | Objective | Budget % | Why |
|-------|-----------|----------|-----|
| Core | Sales or Leads (matches primary conversion) | 55-70% | Drive the main business outcome |
| Retargeting | Same objective, warm audiences | 15-25% | Convert engaged prospects cheaply |
| Awareness/Testing | Video views / Reels-first | 10-20% | Feed the funnel + find fresh hooks |

## Campaign Architecture

```
Ad Account
├── Core conversion campaign (Sales or Leads)
│   ├── Ad Set: 1-3% Lookalike of converters
│   └── Ad Set: Broad / Advantage+ Audience, creative-led
├── Retargeting
│   └── Ad Set: Site + engagement audiences (7-30 days)
└── Testing
    └── New concepts, offers, placements (10%)
```

## Creative Strategy

- Ship **≥10 genuinely distinct concepts** (problem, proof, offer, story, demo)
- **9:16 Reels-first**, sound-on, captions; crop to 4:5/1:1 for Feed
- Refresh distinct concepts every 2-4 weeks; watch frequency and CTR trend
- Keep the hook in the first 1-2 seconds (video) or the first frame (static)

## Targeting Strategy

- **Broad + Advantage+ Audience**, let creative do the targeting
- **Lookalikes** of your best converters; **Custom Audiences** from site/engagement/CRM
- Exclude recent converters from prospecting; cap retargeting frequency

## Tracking Setup

- Meta **Pixel + Conversions API** on all key events, shared `event_id`, ≥90% dedup
- **EMQ ≥8.0** for the primary conversion; forward `fbc`/`fbp`
- **Domain verified**, AEM 8 events prioritized by value; CMP live for EEA

## Budget & Bidding

- Start **Highest Volume** to exit the learning phase (≥5x CPA per ad set weekly)
- Move to **Cost Cap** once CPA is stable; **ROAS goal** only with clean value + dedup
- Scale winners under the **20% rule**; cut losers per the **3x Kill Rule**

## KPI Targets

| Metric | Month 1 | Month 3 | Month 6 |
|--------|---------|---------|---------|
| CPA / ROAS | Baseline (learning) | Toward target | Target |
| CTR | Baseline | +15% | +25% |
| EMQ (primary event) | Track | ≥7.0 | ≥8.0 |
| Creative diversity | ≥10 distinct | Sustained | Sustained |

## Common Pitfalls

- No CAPI / low EMQ → Meta can't see conversions, delivery and attribution suffer
- Variant volume instead of distinct concepts → Andromeda clustering
- Editing mid-learning-phase and resetting the algorithm
- Ignoring a Special Ad Category that applies to the offer
