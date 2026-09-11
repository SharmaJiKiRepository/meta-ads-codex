---
name: meta-competitor
description: "Meta competitor ad intelligence using the Meta Ad Library. Analyzes competitor ad copy, creative strategy, formats, placements, offers, active-ad volume, and estimated spend, then identifies competitive gaps and opportunities on Facebook, Instagram, Reels, and Messenger. Use when user says competitor ads, ad spy, competitive analysis, Meta Ad Library, Facebook Ad Library, competitor creative, competitor Meta ads, or competitor research."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

<!-- Meta competitor intelligence -->

# Meta Competitor Ad Intelligence

The Meta Ad Library is the richest free competitive-intelligence source in paid
media: every advertiser's currently-active Meta ads are public, with creative,
copy, formats, placements, and active dates. This skill turns that into a
structured read on competitor strategy and the gaps you can exploit.

## Process

1. Identify target competitors (from user input or industry analysis)
2. Read `meta-ads/references/benchmarks.md` for industry CPM / CTR / CVR baselines
3. Research each competitor's active ads in the Meta Ad Library
4. Analyze ad copy, creative, formats, and messaging themes
5. Estimate creative velocity and directional spend
6. Identify gaps and opportunities
7. Generate a competitive intelligence report

## Data Sources

### The Meta Ad Library (primary)
- URL: `facebook.com/ads/library` — filter by advertiser Page, country, platform
  (Facebook / Instagram / Messenger / Audience Network), and date range
- Shows every **active** ad: creative (image/video/carousel), primary text,
  headline, CTA button, landing URL, and the date the ad started running
- **Active-ad count** per advertiser is a strong proxy for testing velocity and budget
- **"See ad details"** reveals how many versions of a creative are running and which
  placements are enabled
- For ads about social issues, elections, or politics, the Library also shows
  **spend and impression ranges** and demographic reach

### The user's own account signals
- **Auction overlap**: if a competitor's Custom Audiences and yours collide, you'll
  see it in rising CPMs and frequency in shared placements
- **Advantage+ Audience** expansion means head-to-head "keyword" overlap matters
  less than creative and offer differentiation

### Third-party enrichment (optional)
- Ad-intelligence tools (e.g. creative libraries and spend estimators) for
  longer ad history and trend lines beyond the live Library snapshot

## 2025-2026 Meta context that shapes competitor reads

- **Andromeda creative clustering** (Oct 2025): ads >60% similar are suppressed.
  When a competitor runs many near-identical creatives, that's a *weakness* to note —
  assess their genuine conceptual diversity, not raw ad count
- **Advantage+ Sales** (unified shopping campaign type): infer from catalog/DPA
  creatives and dynamic product ads whether a competitor runs Advantage+ Sales vs manual
- **Reels-first creative**: a competitor shifting to 9:16 UGC/creator content signals
  where they see cheap reach — a placement gap you may be ignoring
- **Advantage+ Creative enhancements**: dynamic text/format variations show up as
  slightly different versions of the same base asset in the Library

## Competitive Analysis Framework

### 1. Ad copy analysis
For each competitor, document:
- **Hooks / headlines**: primary messages and value propositions
- **CTAs**: the action driven (Shop Now, Sign Up, Get Offer, Learn More)
- **Offers**: pricing, discounts, free shipping, trials, bundles
- **Tone**: professional, casual, urgent, educational, emotional
- **USPs**: the unique selling propositions they emphasize
- **Pain points**: the customer problems they lead with

### 2. Creative strategy analysis
- **Formats used**: image, video, carousel, collection
- **Placements**: Feed vs Reels/Stories vs Messenger (from ad details)
- **Visual style**: studio, UGC, creator, illustration, stock, branded
- **Video approach**: polished vs UGC vs animated; hook style in first 2s
- **Creative volume**: number of active ads (testing velocity indicator)
- **Refresh frequency**: how often new creatives appear vs the same ads running for months

### 3. Messaging themes
| Theme | Competitor A | Competitor B | Your Brand |
|-------|-------------|-------------|------------|
| Price / Value | ✅ Primary | ⚠️ Secondary | ? |
| Quality / Premium | ❌ | ✅ Primary | ? |
| Speed / Convenience | ⚠️ Secondary | ❌ | ? |
| Trust / Social proof | ✅ Primary | ✅ Primary | ? |
| Innovation / Novelty | ❌ | ⚠️ Secondary | ? |

### 4. Offer & funnel intelligence
- What **entry offer** hooks cold traffic (lead magnet, discount, free trial)?
- Which **landing experiences** do ads point to (PDP, quiz, listicle, Instant Form)?
- Are they running **retargeting** (catalog/DPA creatives, testimonial-heavy copy)?
- Which funnel stages look under-served in their ad mix?

### 5. Spend & velocity estimation
- Social-issue/political ads show spend + impression ranges directly in the Library
- For commercial advertisers, estimate directionally from active-ad volume and
  refresh cadence:
  ```
  Directional monthly spend ≈ Impressions × CPM / 1000
  or                         ≈ Clicks × Estimated CPC
  ```
- Rising active-ad counts + frequent refresh = scaling; a static handful of long-running
  ads = a lean evergreen approach

## Gap & Opportunity Identification

### Placement gaps
- Which placements are competitors NOT using (Reels, Threads, Messenger)? Opportunity to own
- Are they over-indexed on Feed while ignoring cheap Reels inventory?

### Messaging gaps
- What customer pain points is NO competitor addressing?
- What value propositions are underrepresented in the category?
- What proof formats (reviews, UGC, before/after) are missing from the landscape?

### Audience & offer gaps
- What segments or geos look under-served in competitor targeting/creative?
- What offer type (bundle, trial, guarantee) is absent from the category?
- What funnel stage (cold education, retargeting, win-back) are competitors neglecting?

### Creative gaps
- What formats are competitors not using (carousel, collection, creator UGC)?
- What creative styles are missing from the competitive set?
- Where does Andromeda clustering weaken a competitor running near-duplicate ads?

## Competitive Response Strategy

### When a competitor outspends you
- Win on efficiency: sharper creative, tighter offer, better landing pages
- Own the placements they ignore (Reels/Stories UGC is often the cheapest reach)
- Lean into retargeting where CPA is lower than prospecting
- Differentiate on concept diversity — Andromeda rewards distinct creative, not budget alone

### When a competitor targets your brand / audience
- Run a defensive retargeting + brand-affinity layer with strong social proof
- Answer their specific claims in your primary text (comparison angle)
- Keep a fresh distinct-concept library so your ads keep winning retrieval

## Output

### Deliverables
- `META-COMPETITOR-INTELLIGENCE.md`: Full competitive analysis
  - Per-competitor active-ad summary from the Meta Ad Library
  - Ad copy and messaging analysis
  - Creative strategy comparison (formats, placements, refresh cadence)
  - Directional spend / velocity estimate
  - Andromeda diversity read on each competitor's creative set
- `META-COMPETITIVE-GAPS.md`: Opportunities identified
  - Placement gaps
  - Messaging opportunities
  - Audience / offer segments to target
  - Creative format opportunities
- Strategic recommendations for competitive positioning
- Priority actions to gain a competitive advantage
