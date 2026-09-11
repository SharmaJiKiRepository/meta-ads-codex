# Meta Ads Audit Scoring System

<!-- Meta-only scoring reference -->

## Check ID Convention

- **Sequential IDs** (M01, M02, …): original checks
- **Hyphenated IDs** (M-AN1, M-CR1, M-ST1, M-TH1, M-AT1, M-IA1): v1.5+ additions
- All checks are Meta-specific (M = Meta). There is no cross-platform prefix in this plugin.

## Weighted Scoring Algorithm

```
S_total = Σ(C_pass × W_sev × W_cat) / Σ(C_total × W_sev × W_cat) × 100
```

- `C_pass` = check passed (1) or failed (0); WARNING = 0.5
- `W_sev` = severity multiplier of the individual check
- `W_cat` = category (pillar) weight
- Result: 0-100 Meta Ads Health Score

## Severity Multipliers

| Severity | Multiplier | Criteria |
|----------|-----------|----------|
| Critical | 5.0 | Immediate revenue/data loss risk. Remediation urgent. |
| High | 3.0 | Significant performance drag. Fix within 7 days. |
| Medium | 1.5 | Optimization opportunity. Fix within 30 days. |
| Low | 0.5 | Best practice, minor impact. Nice to have. |

## Scoring Per Check Item

| Result | Points Earned |
|--------|--------------|
| PASS | Full severity × category weight |
| WARNING | 50% of full points |
| FAIL | 0 points |
| N/A | Excluded from total possible |

## Category (Pillar) Weights

| Pillar | Weight | Rationale |
|--------|--------|-----------|
| Pixel / CAPI Health | 30% | ~87% of advertisers have poor EMQ; this is the foundational signal Meta optimizes on |
| Creative (Diversity & Fatigue) | 30% | Under Andromeda, creative is the #1 targeting and delivery lever |
| Account Structure | 20% | Learning-phase health, Advantage+ posture, consolidation, budget sufficiency |
| Audience & Targeting | 20% | Overlap, exclusions, Lookalikes, Advantage+ Audience |

Andromeda / API / metric-change checks (M-AN1, M-AT1, M-IA1, M-TH1) are scored
within the pillar they most affect (usually Creative or Structure).

## Grading Thresholds

| Grade | Score | Label | Action Required |
|-------|-------|-------|-----------------|
| A | 90-100 | Excellent | Minor optimizations only |
| B | 75-89 | Good | Some improvement opportunities |
| C | 60-74 | Needs Improvement | Notable issues need attention |
| D | 40-59 | Poor | Significant problems present |
| F | <40 | Critical | Urgent intervention required |

The bands are wider than academic scoring because ad-account health skews low; a
75+ represents a genuinely well-managed Meta account.

## Quick Wins Logic

```
IF severity == "Critical" OR severity == "High"
AND estimated_remediation_time < 15 minutes
THEN flag as "Quick Win"
PRIORITY: Quick Wins sorted by (severity × estimated_impact) DESC
```

Quick Win examples (Meta):
- Turn on the Conversions API via Gateway/partner integration (Critical, varies)
- Add missing `fbc`/`fbp` parameters to CAPI events to lift EMQ (Critical/High)
- Enable Advantage+ Placements (Medium, 2 min)
- Enable Advantage+ Creative enhancements (Medium, 2 min)
- Set the existing-customer cap on Advantage+ Shopping (Medium, 2 min)
- Exclude recent purchasers from prospecting ad sets (High, 5 min)
- Add captions to sound-off Feed video (High, per asset)

## Weighting Rationale

- Broken Pixel/CAPI tracking invalidates every downstream optimization, so it carries
  the joint-highest weight with Creative.
- Under Andromeda, creative diversity is mechanically part of targeting, so it is
  weighted equally with tracking.
- Structure and audience matter but are lower-impact than a broken signal or a
  clustered, fatigued creative library.
- Weights sum to 100%, so a single 0-100 score is directly comparable across
  accounts and over time.

## Total Check Count

| Pillar | Checks (approx) |
|--------|-----------------|
| Pixel / CAPI Health | M01-M10, M-AT1 |
| Creative | M25-M32, M-CR1..M-CR4, M-AN1 |
| Account Structure | M11-M18, M33-M40, M-ST1, M-ST2, M-IA1 |
| Audience & Targeting | M19-M24, M-TH1 |

The canonical catalog is `tests/fixtures/check-catalog.yaml`, verified
bidirectionally by `tests/audit/test_check_coverage.py`.

## Multi-Account Aggregate Score

When auditing several ad accounts under one Business Manager, compute each account's
score, then aggregate weighted by spend share:

```
Aggregate Score = Σ(Account_Score × Account_Spend_Share)

Example: Account A (82) × 50% + Account B (71) × 30% + Account C (90) × 20%
       = 41 + 21.3 + 18 = 80.3 → Grade B
```
