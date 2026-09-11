<!-- Meta industry template -->
# Mobile App Meta Advertising Template

## Industry Characteristics

- Success = installs that become active, paying users — optimize to value, not installs
- iOS measurement runs through SKAdNetwork / AdAttributionKit + AEM; expect coarser signal
- An MMP (AppsFlyer / Adjust / Branch / Singular) is mandatory before spend
- Meta's App Promotion + Advantage+ App campaigns lean heavily on automation
- Retention and in-app purchase events matter more than raw CPI

## Recommended Objective & Placement Mix

| Layer | Objective | Budget % | Why |
|-------|-----------|----------|-----|
| Core | App Promotion (Advantage+ App) — value/AEV | 55-70% | Automated, value-optimized installs |
| Retargeting | App engagement (re-engage installed users) | 10-20% | Drive activation / repeat purchase |
| Testing | Manual App campaigns / new creative | 10-20% | Find winning hooks and audiences |

## Campaign Architecture

```
Ad Account
├── Advantage+ App (value optimization)
│   └── Broad + high creative volume; SKAN/AEM configured
├── Manual App (control layer)
│   └── Ad Set: Lookalike of payers / high-LTV users
├── Re-engagement (App engagement)
│   └── Ad Set: Installed-but-inactive (via SDK events)
└── Testing — creators, hooks, gameplay/feature demos
```

## Creative Strategy

- **First-3-seconds gameplay/feature demo** — show the app doing the thing
- **UGC creator reactions** and "how I use it" for authenticity
- **Value-prop hook** (save time/money, win, learn) up front
- **App-store-consistent** visuals so the click-through converts to install
- 9:16 Reels/Stories first; ship distinct concepts to avoid clustering

## Targeting Strategy

- **Broad + Advantage+ Audience** — the algorithm + SKAN signal do the work
- **Lookalikes of payers / high-LTV users** (via MMP events back to Meta)
- **Re-engagement audiences** from SDK/AEM in-app events
- Consolidate low-volume ad sets to clear SKAN privacy thresholds

## Budget & Benchmarks

| Metric | Mobile-app Meta benchmark (directional) |
|--------|-----------------------------------------|
| CPI (varies wildly by vertical) | $1-$6 |
| Cost per registration / activation | $3-$15 |
| iOS signal delay (AEM/SKAN) | up to ~72h |
| Min viable monthly budget | ~$3,000+ to clear thresholds |

### Bidding
- **Highest Volume** to start; move to **value/AEV** optimization once event volume supports it
- Map SKAN conversion values to real post-install actions (purchase, subscription_start)

## KPI Targets

| Metric | Month 1 | Month 3 | Month 6 |
|--------|---------|---------|---------|
| Cost per activated install | Baseline | -15% | -25% |
| D7 retention of paid installs | Track | Improve | Improve |
| ROAS (MMP-measured) | Track | Toward target | Target |

## Common Pitfalls

- Optimizing to installs, not value → cheap installs that never activate
- MMP / SKAN schema not wired before launch (unmeasurable spend)
- Too many low-volume ad sets → null SKAN postbacks
- Judging same-day iOS numbers before the AEM/SKAN window closes
