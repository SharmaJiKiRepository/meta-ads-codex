---
name: meta-creative
description: "Meta creative quality audit covering ad copy, video, image, carousel, and collection format diversity across Facebook, Instagram, Reels, Threads, and Messenger placements. Detects creative fatigue, evaluates placement-native compliance and safe zones, scores creative diversity for Andromeda Entity-ID retrieval, and provides production priorities. Use when user says creative audit, Meta creative, ad creative, creative fatigue, creative diversity score, ad variation audit, ad copy, ad design, Reels creative, or creative review."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

<!-- Meta creative quality audit -->

# Meta Creative Quality Audit

Under Andromeda + GEM + Lattice, creative is the primary targeting and delivery
lever on Meta. This audit assesses whether the creative library is diverse
enough to be retrieved and ranked well, native to each placement, and refreshed
before fatigue sets in.

## Process

1. Collect the live creative library and per-creative performance (CTR, frequency, spend, results, trend)
2. Read `meta-ads/references/meta-creative-specs.md` for placement specs and safe zones
3. Read `meta-ads/references/benchmarks.md` for CTR / engagement / frequency benchmarks
4. Read `meta-ads/references/scoring-system.md` for the weighted scoring algorithm
5. **Validate**: confirm at least the creative assets or their performance metrics are available before proceeding
6. Evaluate creative quality per placement and per format
7. Assess concept / angle diversity against Andromeda retrieval risk
8. **Validate**: verify fatigue signals reference actual performance trends, not assumptions
9. Generate production priority recommendations

## What to Assess

### Format diversity
- **≥3 formats active** (image, video, carousel, collection) — format is itself a
  diversity signal to Andromeda
- **≥5 creatives per ad set** (Meta's recommendation for the algorithm to learn)
- **Native format per placement**: full-screen 9:16 for Reels & Stories, 4:5 or 1:1
  for Feed, catalog/collection for Advantage+ Shopping
- **Advantage+ Creative enhancements** enabled (text improvements, brightness,
  music, image expansion) unless a brand-safety exception is documented

### Copy
- **Primary text** front-loads the hook before the "…more" cutoff (~125 chars visible)
- **Headline under 40 chars**; description used where the placement shows it
- **Message match** to the landing page (the ad's promise = the page's headline)
- **CTA button** matches the objective (Shop Now, Sign Up, Learn More, Get Offer)

### Video
- **Hook in the first 1-2 seconds** — most drop-off happens before 3s
- **Sound-on design** with captions/subtitles baked in (Reels/Stories are sound-on;
  Feed is often sound-off — captions serve both)
- **Length**: ≤15s for Stories/Reels, ≤30s for Feed as a working default
- **9:16 full-screen** for Reels/Stories; keep text and logos out of the UI safe zones

### UGC & social proof
- **UGC / testimonial creative tested** — consistently outperforms polished studio
  content in Feed and Reels
- **Creator / partnership (branded content) ads** tested where relevant

## Creative Fatigue Detection

### Signals of fatigue
| Signal | Threshold | Action |
|--------|-----------|--------|
| CTR declining | >20% over 14 days | Refresh creative |
| Frequency (prospecting, 7-day) | >5.0 | New audience or new concept |
| Frequency (retargeting, 7-day) | >12.0 | New creative / cap frequency |
| CPM rising with flat CTR | >20% over 14 days | Audience saturation — refresh |
| First-3s video retention falling | Below placement baseline | New hook needed |
| Results per day declining | >30% with stable spend | Full concept refresh |

### Refresh cadence
| Spend level | Recommended refresh |
|-------------|---------------------|
| High spend (fast fatigue) | New concepts every 7-14 days |
| Medium spend | Every 14-21 days |
| Low spend / evergreen | Every 3-4 weeks |
| Reels-first accounts | Fastest — treat like organic Reels cadence |

## Andromeda Creative Diversity (the core Meta creative lever)

Meta's Andromeda retrieval engine (launched Oct 2025) clusters ads with >60%
similarity and suppresses delivery of near-identical creatives
([Confect](https://confect.io/tactics/meta-andromeda-2026);
[Meta Engineering](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/)).
100 minor variations (color swaps, small text edits) perform no better than 10
genuinely distinct creatives. Score the library across 5 axes (each 0-2, total 0-10):

| Axis | 0 (Risk) | 1 (OK) | 2 (Strong) |
|------|----------|--------|------------|
| Concept diversity | One core message across all assets | 2 distinct messages | 3+ distinct angles |
| Format diversity | One format | 2 formats | 3+ (image, video, carousel, collection) |
| Visual diversity | One palette / model / composition | 2 treatments | 3+ distinct treatments |
| Hook diversity (video) | All hooks ≤3s look alike | 2 hook patterns | 3+ hook patterns |
| Headline diversity | All headlines paraphrase one line | 2 structures | 3+ structures |

Score 8-10 = LOW clustering risk. 4-7 = MEDIUM (some suppression). 0-3 = HIGH
(significant retrieval loss). Produce a cluster map that groups near-duplicate
creatives and recommends which to keep, cut, or rebuild for distinctness.

## Safe Zones (placement-native)

- **Reels / Stories (9:16, 1080×1920)**: keep text, logos, and CTAs out of the
  top ~250px and bottom ~340px where the profile, caption, and UI controls sit
- **Feed (4:5 / 1:1)**: keep critical elements clear of the bottom cropping and
  the "…more" caption fold
- **A ~1080×1080 centered safe area** works across most placements when you must
  ship one asset to Advantage+ Placements
- Always preview per placement in Ads Manager before publishing

## Creative Health Scoring Weights

```
Concept / Format Diversity (Andromeda):  30%  █████████░
Fatigue Signals:                         25%  ████████░░
Placement Compliance / Safe Zones:       20%  ██████░░░░
Refresh Cadence:                         15%  █████░░░░░
Volume (creatives per ad set):           10%  ███░░░░░░░
```

Grade: A (90-100), B (75-89), C (60-74), D (40-59), F (<40).

## Creative Check IDs

| ID | Check | Severity |
|----|-------|----------|
| CR-01 | Format diversity: ≥3 formats active | High |
| CR-02 | Creative volume: ≥5 creatives per ad set | High |
| CR-03 | Fatigue detection: CTR / frequency past thresholds | Critical |
| CR-04 | Refresh cadence: within recommended cycle for spend level | High |
| CR-05 | Placement compliance: specs, safe zones, text limits | Critical |
| CR-06 | Hook quality: first 1-2s (video) or scroll-stopping frame (static) | High |
| CR-07 | UGC ratio: UGC / testimonial content tested | Medium |
| CR-08 | Video specs: codec, resolution, aspect ratio per placement | Medium |
| CR-09 | Advantage+ Creative enhancements enabled (or documented exception) | Medium |
| CR-10 | Andromeda diversity: genuinely distinct concepts, not iterative variations | High |

## Meta Creative Best Practices

### Copy
- Lead with the benefit, not the feature
- Front-load the hook before the "…more" fold in primary text
- One clear CTA; match the CTA button to the objective
- Numbers and specifics beat vague claims
- Test emotional vs rational angles as *distinct concepts*, not tweaks

### Video production standards
- H.264 video, AAC audio, MP4 container, ≥1080p
- Captions/subtitles always (sound-off Feed + accessibility)
- Brand moment early for awareness, at the CTA for performance
- Design for 9:16 first, then crop up to 1:1 / 4:5 for Feed

## Output

### Creative Quality Report

```
Meta Creative Health

Format diversity:      ██████████  X/X formats active
Andromeda diversity:   ████████░░  X/10 distinctness score
Fatigue:               ███████░░░  X creatives past refresh
Placement compliance:  █████████░  X/X placements native
```

### Deliverables
- `META-CREATIVE-AUDIT.md`: Format, diversity, fatigue, and compliance findings
- `creative-cluster-risk.md`: Andromeda cluster map + keep/cut/rebuild calls
- Fatigue alerts (any creative past its refresh cadence or over frequency)
- Production priority list (the most impactful next concepts to shoot)
- Quick Wins (enable Advantage+ Creative, add captions, fix safe-zone crops)
