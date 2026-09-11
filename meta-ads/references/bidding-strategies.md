# Meta Bidding Strategy Decision Trees

<!-- Meta-only bidding reference -->

## Meta Auction Formula

```
Total Value = Bid × Estimated Action Rate + User Value
```

Meta ranks each ad by total value, not raw bid. Your levers are the bid strategy,
the optimization event, the budget, and — most of all — creative (which drives the
estimated action rate under Andromeda).

## Bid Strategy Selection

```
DEFAULT (most campaigns):
  → Highest Volume (no cap)
  → Best for: gathering data, exiting the learning phase, volume
  → Risk: CPA can spike during high-competition periods (Q4)

IF you need cost predictability:
  → Cost Cap
  → Set at: ~1.2x-1.5x target CPA
  → Best for: scaling with margin protection
  → Risk: under-delivery if the cap is too aggressive

IF you need strict cost control:
  → Bid Cap
  → Set at: ~2x-3x target CPA
  → Best for: experienced advertisers with clear unit economics
  → Risk: significant under-delivery if set too low

IF e-commerce with clean value tracking:
  → ROAS goal (minimum ROAS)
  → Best for: Advantage+ Shopping with a healthy catalog
  → Requires: Purchase event + values + strong dedup

IF a wide AOV range:
  → Highest Value
  → Prioritizes high-value conversions
  → Best for: catalogs with a broad price spread
```

## Andromeda Context

Under Andromeda + GEM + Lattice, **creative diversity matters more than
micro-optimizing bids**. Spend your optimization energy on a fresh, distinct
creative pipeline before fiddling with caps. A perfectly-tuned Bid Cap on a
clustered, fatigued creative set still loses.

## CBO vs ABO Decision

```
IF daily_budget < $100:
  → ABO (protect each test's budget for clean reads)

IF daily_budget $100-$500:
  → Test both; CBO if audiences are similar, ABO if diverse

IF daily_budget > $500:
  → CBO (Advantage campaign budget) — let Meta allocate to the best ad sets

NOTE: Advantage+ Shopping uses campaign-level budgeting by design.
```

## Learning Phase Rules

**Exit criteria:** ~50 optimization events per week per ad set.

**Reset triggers (avoid during learning):**
- Budget change >~20%
- Any targeting change
- Creative edit (even text)
- Bid strategy or optimization-event change
- Attribution-setting change
- Pausing >7 days

**If an ad set is "Learning Limited":**
1. Broaden the audience (or switch to Advantage+ Audience)
2. Increase the budget (aim ≥5x target CPA weekly)
3. Move to a higher-funnel optimization event (e.g. AddToCart instead of Purchase)
4. Consolidate ad sets (fewer, larger)
5. Reduce the number of ad sets competing for the same audience

## Optimization Event Selection

```
Enough weekly conversions on the true event? → optimize to it (Purchase / Lead)
Too few (can't hit ~50/week)?               → optimize to a higher-funnel event
                                               (AddToCart, InitiateCheckout, ViewContent)
                                               then move down-funnel as volume grows
```

Always import the *real* downstream event (purchase / qualified lead / funded /
activation) via CAPI so Meta optimizes to business value, not just a form fill.

## Attribution Setting (bidding-relevant)

- Default **7-day click / 1-day view**; keep it consistent across ad sets
- Meta optimizes to the ad set's selected window — don't compare across windows
- Changing the attribution setting resets learning; treat it like any other reset

## Meta Bidding Red Flags

| Red Flag | Severity | Action |
|----------|----------|--------|
| >50% of ad sets "Learning Limited" | Critical | Consolidate, broaden audience, increase budget |
| Cost Cap set below historical CPA | High | Set at ~1.2-1.5× target, not below; you're starving delivery |
| Daily budget <5× target CPA per ad set | High | Increase budget or move to a higher-funnel event |
| Editing budget/audience/creative mid-learning | High | Stop; you're resetting the learning phase repeatedly |
| ROAS goal with weak value signal / low dedup | High | Fix value tracking + dedup first, or switch to Highest Volume/Cost Cap |
| Too many small ad sets on overlapping audiences | Medium | Consolidate; overlap drives internal auction competition |
| Bid Cap set without clear unit economics | Medium | Move to Highest Volume until CPA is well understood |
