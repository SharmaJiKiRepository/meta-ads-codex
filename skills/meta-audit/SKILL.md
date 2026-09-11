---
name: meta-audit
description: "Full Meta paid advertising audit with parallel subagent delegation. Analyzes a Meta ad account (Facebook, Instagram, Reels, Threads, Messenger, Audience Network) via 5 parallel audit agents covering Pixel/CAPI health, creative diversity, account structure, budget/bidding, and compliance. Generates a Meta Ads Health Score (0-100). Use when user says audit, full Meta check, analyze my Meta ads, account health check, Facebook ads audit, Instagram ads audit, paid social audit, or Meta ad spend audit."
user-invokable: false
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

# Full Meta Ads Audit

This audit operates under the **10-Principle Thinking Framework** (see
`meta-ads/references/thinking-framework.md`). OBSERVE (External + Internal)
dominates data collection, THINK + CONNECT (Lateral) dominate analysis,
CONNECT (System) + ACCEPT dominate synthesis and prioritization. If the
audit feels mechanical, you are skipping a principle.

## Process

1. **Collect account data**: request Ads Manager exports, Events Manager screenshots, or Meta Ads MCP / connector access
2. **Validate**: confirm at least campaign-level performance data plus tracking status is available before proceeding
3. **Detect business type**: analyze account signals per the meta-ads orchestrator (objective mix, events, catalog, Special Ad Category)
4. **Identify active surfaces**: determine which objectives, placements, and Advantage+ products are in use
5. **Delegate to subagents** (if available, otherwise run inline sequentially):
   - `meta-audit-core`: Pixel/CAPI + EMQ, creative diversity, structure, learning phase, audiences, Advantage+ (M01-M40 + hyphenated v1.5+ IDs incl. Andromeda)
   - `meta-audit-creative`: Format diversity, fatigue signals, safe-zone / spec compliance, Entity-ID clustering risk
   - `meta-audit-tracking`: Pixel install, Conversions API, event configuration, AEM, dedup, attribution windows
   - `meta-audit-budget`: Budget sufficiency, CBO/ABO structure, bidding strategy, learning-phase health, audience overlap
   - `meta-audit-compliance`: Meta advertising policies, Special Ad Categories, privacy, settings hygiene, performance benchmarks
6. **Validate**: verify each subagent returned valid scores with required fields before aggregating
7. **Score**: calculate the four-pillar Meta Ads Health Score (0-100)
8. **Report**: generate prioritized action plan with Quick Wins

## Data Collection

Ask the user for available data. Accept any combination:
- **Performance**: Ads Manager export at campaign / ad set / ad level (spend, CPM, CTR, CPC, CPA, ROAS, frequency, results)
- **Tracking**: Events Manager screenshot — Pixel status, Conversions API status, EMQ per event, dedup rate, Aggregated Event Measurement (AEM) configuration, domain verification
- **Structure**: campaign/ad set map — objectives, CBO vs ABO, Advantage+ Shopping / Audience / Placements settings, cost caps
- **Creative**: the live creative library (image / video / carousel / collection) and per-creative CTR + frequency trend
- **Audiences**: Custom Audiences, Lookalikes, exclusions, and the Audience Overlap tool output

If no exports are available, audit from screenshots or manual data entry. If a
Meta Ads MCP / connector is connected, pull the data live (see
`meta-ads/references/mcp-integration.md`).

## Scoring

Read `meta-ads/references/scoring-system.md` for the full algorithm.

### Four-Pillar Weights

| Pillar | Weight | What it covers |
|--------|--------|----------------|
| Pixel / CAPI Health | 30% | Pixel firing, Conversions API, EMQ, dedup, AEM, domain verification, event coverage |
| Creative | 30% | Format & concept diversity, fatigue, Entity-ID clustering risk, spec/safe-zone compliance |
| Account Structure | 20% | CBO/ABO intent, campaign consolidation, learning-phase health, budget sufficiency |
| Audience & Targeting | 20% | Frequency, Custom Audiences, Lookalikes, exclusions, Advantage+ Audience |

### Health Score

```
Health = 0.30·(Pixel/CAPI) + 0.30·Creative + 0.20·Structure + 0.20·Audience
Grade: A (90-100), B (75-89), C (60-74), D (40-59), F (<40)
```

When multiple ad accounts sit under one Business Manager, aggregate weighted by
spend share:

```
Aggregate = Sum(Account_Score x Account_Spend_Share)
```

## Output Files

- `META-AUDIT-REPORT.md`: Comprehensive Meta account findings
- `META-ACTION-PLAN.md`: Prioritized recommendations (Critical > High > Medium > Low)
- `META-QUICK-WINS.md`: Items fixable in <15 minutes with high impact
- `META-REPORT.html`: Presentable dark-dashboard report (daily spend, spend share by campaign, creative leaderboard with scale / fatiguing / cut-fix pills) via `scripts/generate_html_report.py` — see `meta-ads/references/report-template.md`

## Report Structure

### Executive Summary
- Meta Ads Health Score (0-100) with grade
- Four-pillar score breakdown
- Business type detected
- Active objectives / placements / Advantage+ products identified
- Top 5 critical issues
- Top 5 quick wins

### Pillar Sections
Each pillar section includes:
- Pillar score with grade
- Check-by-check pass/warning/fail with the M-series check ID
- Pillar-specific Quick Wins
- Detailed findings with remediation steps

### Cross-Cutting Analysis
- Tracking integrity (is CAPI live, deduped, and matching the pixel event set?)
- Creative diversity vs Andromeda retrieval risk (distinct-concept count, cluster map)
- Budget allocation (actual vs recommended across objectives and Advantage+)
- Attribution hygiene (is the account double-counting across windows or with GA4?)

### Strategic Recommendations
- Objective / campaign prioritization based on business type
- Budget reallocation recommendations (prospecting vs retargeting vs Advantage+)
- Scaling opportunities (ad sets ready for the 20% scaling rule)
- Kill list (ad sets / campaigns to pause immediately per the 3x Kill Rule)

## Priority Definitions

- **Critical**: Revenue/data loss risk (fix immediately) — CAPI down, EMQ <6, pixel not firing, Special Ad Category violation
- **High**: Significant performance drag (fix within 7 days) — learning-limited ad sets, creative fatigue, high frequency
- **Medium**: Optimization opportunity (fix within 30 days)
- **Low**: Best practice, minor impact (backlog)

## Quick Wins Criteria

```
IF severity == "Critical" OR severity == "High"
AND estimated_fix_time < 15 minutes
THEN flag as Quick Win
SORT BY (severity_multiplier x estimated_impact) DESC
```
