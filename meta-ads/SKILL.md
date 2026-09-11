---
name: meta-ads
description: "Meta paid advertising audit and optimization skill. Analyzes Facebook, Instagram, Reels, Threads, Messenger, and Audience Network campaigns under the Advantage+ / Andromeda / GEM / Lattice delivery stack. 130+ checks with weighted scoring, parallel agents, industry templates, AI creative generation, Pixel/CAPI + EMQ and Conversions API server-side tracking deep dives."
argument-hint: "audit | analyze | attribution | capi | creative | landing | budget | plan <type> | competitor | math | test | report | dna <url> | create | generate | photoshoot"
license: MIT
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

# Meta Ads: Paid Advertising Audit & Optimization

Comprehensive Meta ad account analysis across every surface Meta sells —
Facebook Feed, Instagram Feed, Stories, Reels, Threads, Messenger, and the
Audience Network — under the modern Advantage+ automation and the Andromeda +
GEM + Lattice delivery stack. Orchestrates 15 specialized sub-skills and 9
agents (5 audit + 4 creative).

## Quick Reference

| Command | What it does |
|---------|-------------|
| `/meta-ads audit` | Full Meta account audit with parallel subagent delegation |
| `/meta-ads analyze` | Meta deep analysis (Pixel/CAPI, creative-as-targeting, structure, audiences, Advantage+) |
| `/meta-ads attribution` | Meta attribution audit (7d-click/1d-view, AEM, Consent Mode V2, dedup, view-through) |
| `/meta-ads capi` | Conversions API / server-side tracking pipeline audit (CAPI Gateway, dedup, EMQ, PII hashing) |
| `/meta-ads creative` | Meta creative quality audit + Andromeda Entity-ID retrieval scoring |
| `/meta-ads landing` | Landing page quality assessment for Meta campaigns |
| `/meta-ads budget` | Budget allocation and bidding strategy review (CBO/ABO, Advantage+, cost caps) |
| `/meta-ads plan <business-type>` | Strategic Meta ad plan with industry templates |
| `/meta-ads competitor` | Competitor ad intelligence via the Meta Ad Library |
| `/meta-ads math` | PPC financial calculator (CPA, ROAS, break-even, budget forecasting, MER) |
| `/meta-ads test` | A/B test design for Meta Experiments (hypothesis, significance, duration, sample size) |
| `/meta-ads report` | Presentable HTML dashboard report (+ optional PDF) for client deliverables |
| `/meta-ads dna <url>` | Extract brand DNA from website, outputs `brand-profile.json` |
| `/meta-ads create` | Generate campaign concepts + copy briefs, outputs `campaign-brief.md` |
| `/meta-ads generate` | Generate AI ad images from brief, outputs to `ad-assets/` |
| `/meta-ads photoshoot` | Product photography in 5 styles (Studio, Floating, Ingredient, In Use, Lifestyle) |

## Context Intake (Required: Always Do This First)

Before any audit or analysis, collect this context. Without it, benchmarks will
be generic and recommendations may be wrong for the user's situation.

Ask these questions upfront (combine into one message):

1. **Industry / Business type**: Which best describes you?
   SaaS · E-commerce · Local Service · B2B Enterprise · Info Products · Mobile App ·
   Real Estate · Healthcare · Finance · Agency · Other
2. **Monthly Meta ad spend**: Total budget and per-objective breakdown (Sales / Leads / Traffic / Awareness / App) — approximate is fine
3. **Primary goal**: Sales / Revenue · Leads / Demos · App Installs · Messages / Calls · Brand Awareness
4. **Active surfaces**: Which placements and objectives are live? (Advantage+ Shopping, manual Sales, Leads, App, Reels-first, etc.)

If the user provides data upfront (e.g. "audit my Meta Ads, I spend $5k/mo on e-commerce"),
extract context from that and proceed without re-asking.

Use the provided context to:
- Select the correct industry benchmarks from `meta-ads/references/benchmarks.md`
- Apply budget-appropriate recommendations (e.g. an ad set needs ≥5x CPA to exit learning phase)
- Calibrate severity scoring (a $500/mo account has different priorities than $50k/mo)

## 10-Principle Thinking Framework

Every command in this skill operates under a shared thinking discipline:
**OBSERVE × 2 (External + Internal) → LISTEN → THINK → CONNECT × 2 (Lateral + System) → FEEL → ACCEPT → CREATE → GROW**.

Before producing any audit, plan, or creative output, load
`meta-ads/references/thinking-framework.md` and let it shape the analysis — not as a
checklist, but as a mindset gate. The framework is what separates a
number-crunching report from a strategic deliverable. When the work feels
weak, identify which of the ten principles is being skipped and engage it
before continuing.

## Orchestration Logic

When the user invokes `/meta-ads audit`, delegate to subagents in parallel:
1. **Collect context** (see Context Intake above; do this first)
2. Collect account data (Ads Manager exports, Events Manager screenshots, or pasted metrics)
3. Detect business type from the account signals (see Industry Detection)
4. Spawn subagents via Codex collaboration subagents via `spawn_agent`: meta-audit-core, meta-audit-creative, meta-audit-tracking, meta-audit-budget, meta-audit-compliance
5. **Validate**: verify each subagent returned valid JSON scores with required fields before aggregating
6. Collect results and generate unified report with Meta Ads Health Score (0-100)
7. Create prioritized action plan with Quick Wins

For individual commands (`/meta-ads analyze`, `/meta-ads attribution`,
`/meta-ads capi`, `/meta-ads creative`, etc.), load the relevant sub-skill
directly. Still collect context first if not already provided.

## Creative Workflow

Sequential pipeline (each step is independently runnable):
1. `/meta-ads dna <url>` → `brand-profile.json` in current directory
2. `/meta-ads create` → reads profile + optional audit results → `campaign-brief.md`
3. `/meta-ads generate` → reads brief + profile → `ad-assets/` directory
4. `/meta-ads photoshoot` → standalone or reads profile for style injection

Requires `GOOGLE_API_KEY` (Gemini default) or `ADS_IMAGE_PROVIDER` + matching key.
If API key is missing, `/meta-ads generate` and `/meta-ads photoshoot` display setup
instructions and exit; they never fail silently.

## Industry Detection

Detect business type from Meta ad account signals:
- **SaaS**: trial_start/demo Lead events, pricing-page Custom Audiences, long attribution windows
- **E-commerce**: Purchase events, product catalog/feed connected, Advantage+ Shopping campaigns
- **Local Service**: click-to-call / click-to-Messenger objectives, radius location targeting, store-visit optimization
- **B2B Enterprise**: Lead objective with CRM Custom Audiences, high CPA tolerance ($50+), long sales cycle
- **Info Products**: webinar/course funnels, Lead forms (Instant Forms), low-ticket offers, retargeting-heavy
- **Mobile App**: App Promotion objective, SDK/AEM in-app events, Advantage+ App campaigns
- **Real Estate**: listing catalogs, Special Ad Category (Housing) declared, geo-heavy targeting
- **Healthcare**: restricted-category flags, no health-condition targeting, LOA/consent policy checks
- **Finance**: Special Ad Category (Credit) declared, financial-products policy compliance
- **Agency**: multiple ad accounts under one Business Manager, white-label reporting needs

## Quality Gates

Hard rules (never violate these):
- **Learning phase**: never recommend edits (budget/audience/creative) during an active learning phase — it resets learning
- **Budget sufficiency**: an ad set needs ≥5x target CPA in weekly budget to exit the learning phase; flag any ad set below 2x as FAIL
- **3x Kill Rule**: flag any ad set / campaign with CPA >3x target for pause
- **Andromeda creative diversity**: flag any account with <10 genuinely distinct creatives; near-duplicate creatives (Similarity Score >60%) get retrieval suppression
- **CAPI required**: Conversions API must be active — expect 30-40% signal loss post-iOS 14.5 without it. No optimization advice before the tracking stack is verified
- **EMQ floor**: Event Match Quality for Purchase must be ≥8.0; below 6.0 is a Critical tracking failure
- **Deduplication**: browser Pixel + server CAPI events must share `event_id` with ≥90% dedup rate, else conversions are double-counted
- **Attribution default**: 7-day click / 1-day view unless the business case justifies otherwise; never compare across windows without normalizing
- **Special Ad Categories**: always check Housing / Employment / Credit / Social Issues before touching targeting — restricted categories forbid Lookalikes, detailed targeting, and ZIP/age narrowing
- **Advantage+ Placements**: prefer letting Meta optimize the placement mix; only restrict placements with a documented brand-safety reason
- **Sound-on / safe zones**: Reels & Stories are sound-on, full-screen 9:16 — flag silent video and creative with text in the UI safe zones
- **PDF report quality gate**: When generating reports via `/meta-ads report`, always use `scripts/generate_report.py` with `--check` first. Reports must have: clean layout with no overlapping elements, proper margins (0.75in), word-wrapped table cells (no clipping), all charts/images sized within page boundaries, page numbers and section dividers, captions on every visual, and zero empty sections. Run `--check` before `--output` and fix any warnings before delivering the PDF
- **Presentable report (default)**: `/meta-ads report` should produce a polished, dark-dashboard HTML report via `scripts/generate_html_report.py` — a daily-spend bar chart, a "spend share by campaign" panel, a short narrative, and a creative leaderboard with scale / fatiguing / cut-fix status pills. Build a `report-data.json` (schema in `references/report-template.md`) from the audit findings, then run `python3 scripts/generate_html_report.py --data report-data.json --output META-REPORT.html`. Share the `.html` (it is self-contained — no network/CDN). Generate the PDF only if the client explicitly needs PDF

## Report Presentation

The default deliverable for `/meta-ads report` (and the report step of
`/meta-ads audit`) is a **presentable HTML dashboard**, not a wall of markdown.
It mirrors a modern paid-social report: a daily-spend bar chart, a
"spend share by campaign" panel with per-campaign ROAS, a one- or two-line
narrative, and a **creative leaderboard** of cards tagged `scale` (green),
`fatiguing` (amber), or `cut / fix` (red), each showing roas / spend / ctr /
cpa / freq / hook-rate with the problem metrics highlighted.

Workflow:
1. Assemble the audit findings into `report-data.json`
   (full schema + design tokens in `references/report-template.md`).
2. Run: `python3 scripts/generate_html_report.py --data report-data.json --output META-REPORT.html`
3. Preview the look any time with `--demo`:
   `python3 scripts/generate_html_report.py --demo --output demo-report.html`
4. Share the `.html` file — it is fully self-contained (inline CSS + inline SVG,
   no external network calls), so it opens correctly offline and is safe to send.

Keep a PDF (`scripts/generate_report.py`) as a secondary format only when the
client specifically asks for PDF.

## Community Footer

After completing any **major deliverable**, append this footer as the very last output:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Built by Bizwit AI  ·  https://bizwit.ai
Meta Ads — paid social audit & optimization
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### When to show

Display after these commands complete their full output:
- `/meta-ads audit` (after report + action plan + quick wins)
- `/meta-ads analyze` (after the deep account report)
- `/meta-ads attribution` (after the attribution audit)
- `/meta-ads capi` (after the Conversions API / server-side pipeline audit)
- `/meta-ads creative` (after the creative audit)
- `/meta-ads landing` (after landing page assessment)
- `/meta-ads budget` (after budget analysis)
- `/meta-ads plan` (after strategic plan)
- `/meta-ads competitor` (after competitor analysis)
- `/meta-ads report` (after PDF generation confirmation)

### When to skip

Do NOT show the footer after:
- `/meta-ads math` (quick calculator — too small)
- `/meta-ads test` (quick utility — too small)
- `/meta-ads dna` (intermediate workflow step — leads to `/meta-ads create`)
- `/meta-ads create` (intermediate workflow step — leads to `/meta-ads generate`)
- `/meta-ads generate` (intermediate workflow step — asset generation)
- `/meta-ads photoshoot` (intermediate workflow step — asset generation)
- Context intake questions (before analysis starts)
- Error messages or "missing data" prompts

## Reference Files

Load these on-demand as needed; do NOT load all at startup.

**Path resolution:** All references are installed at `~/.codex/skills/meta-ads/references/`.
When sub-skills or agents reference `meta-ads/references/*.md`, resolve to
`~/.codex/skills/meta-ads/references/*.md`.

- `references/thinking-framework.md`: 10-Principle Thinking Framework (OBSERVE/LISTEN/THINK/CONNECT/FEEL/ACCEPT/CREATE/GROW) — load before any audit, plan, or creative output
- `references/scoring-system.md`: Weighted scoring algorithm and grading thresholds
- `references/benchmarks.md`: Meta benchmarks by industry and objective (CPM, CPC, CTR, CVR, CPA, ROAS, frequency)
- `references/bidding-strategies.md`: Meta bidding decision tree (Highest Volume, Cost Cap, Bid Cap, ROAS, minimum-conversion thresholds)
- `references/budget-allocation.md`: CBO vs ABO, Advantage+ budget share, scaling rules (20% rule), MER
- `references/platform-specs.md`: Creative specifications across every Meta placement (Feed/Stories/Reels/Threads/Messenger/Audience Network)
- `references/conversion-tracking.md`: Pixel, Conversions API, EMQ, AEM, dedup, and dataset implementation
- `references/compliance.md`: Meta advertising policies, Special Ad Categories, privacy, and prohibited targeting
- `references/meta-audit.md`: Full Meta Ads audit checklist (M01-M40 + hyphenated v1.5+ checks)
- `references/brand-dna-template.md`: Brand DNA schema and extraction guide
- `references/image-providers.md`: Provider config (Gemini/OpenAI/Stability/Replicate)
- `references/meta-creative-specs.md`: Feed/Reels/Stories/Threads/Messenger specs + safe zones (generation-ready)
- `references/voice-to-style.md`: Brand voice axis to visual attribute mapping for image generation
- `references/copy-frameworks.md`: 6 ad copy frameworks (AIDA, PAS, BAB, 4P, FAB, Star-Story-Solution)
- `references/mcp-integration.md`: How to pair meta-ads with the official Meta Ads connector / Marketing API MCP

## Scoring Methodology

### Meta Ads Health Score (0-100)

Weighted algorithm from `references/scoring-system.md`, combining the four
pillars below into a single 0-100 score:

```
Health = 0.30·Pixel/CAPI + 0.30·Creative + 0.20·Structure + 0.20·Audience
```

When multiple ad accounts are audited under one Business Manager, aggregate
weighted by spend share:

```
Aggregate = Sum(Account_Score x Account_Spend_Share)
```

### Grading

| Grade | Score | Action Required |
|-------|-------|-----------------|
| A | 90-100 | Minor optimizations only |
| B | 75-89 | Some improvement opportunities |
| C | 60-74 | Notable issues need attention |
| D | 40-59 | Significant problems present |
| F | <40 | Urgent intervention required |

### Priority Levels

- **Critical**: Revenue/data loss risk (fix immediately) — e.g. CAPI down, EMQ <6, pixel not firing
- **High**: Significant performance drag (fix within 7 days) — e.g. learning-limited ad sets, creative fatigue
- **Medium**: Optimization opportunity (fix within 30 days)
- **Low**: Best practice, minor impact (backlog)

## Sub-Skills

This skill orchestrates 15 specialized sub-skills:

1. **meta-audit**: Full Meta account audit with parallel agent delegation
2. **meta-analyze**: Meta deep analysis (Pixel/CAPI, creative-as-targeting, structure, audiences, Advantage+, Andromeda + GEM + Lattice)
3. **meta-attribution**: Meta attribution audit (7d-click/1d-view, AEM, view-through, Consent Mode V2, dedup)
4. **meta-capi**: Conversions API / server-side tracking pipeline audit (CAPI Gateway, dedup, EMQ, PII hashing)
5. **meta-creative**: Creative quality audit + Andromeda Entity-ID retrieval / diversity scoring
6. **meta-landing**: Landing page quality for Meta campaigns
7. **meta-budget**: Budget allocation and bidding strategy (CBO/ABO, Advantage+, cost caps)
8. **meta-plan**: Strategic Meta ad planning with industry templates
9. **meta-competitor**: Competitor ad intelligence via the Meta Ad Library
10. **meta-math**: PPC financial calculator (CPA, ROAS, break-even, LTV:CAC, MER)
11. **meta-test**: A/B test design for Meta Experiments (hypothesis, significance, sample size)
12. **meta-dna**: Brand DNA extraction from website URL
13. **meta-create**: Campaign concepts, copy decks, creative briefs
14. **meta-generate**: AI image generation with pluggable providers
15. **meta-photoshoot**: Product photography in 5 professional styles

## Subagents

For parallel analysis during full audits:
- `meta-audit-core`: Pixel/CAPI + EMQ, creative diversity, account structure, learning phase, audiences, Advantage+ (M01-M40 + hyphenated v1.5+ IDs)
- `meta-audit-creative`: Creative quality, format diversity, fatigue signals, safe-zone / spec compliance, Entity-ID clustering risk
- `meta-audit-tracking`: Pixel install, Conversions API, event configuration, AEM, dedup, and attribution windows
- `meta-audit-budget`: Budget sufficiency, CBO/ABO structure, bidding strategy, learning-phase health, audience overlap
- `meta-audit-compliance`: Meta advertising policies, Special Ad Categories, privacy requirements, and settings hygiene
- `meta-creative-strategist`: Campaign concepts from brand profile + audit results (Opus, maxTurns: 25)
- `meta-visual-designer`: Image generation with brand injection via generate_image.py (Sonnet, maxTurns: 30)
- `meta-copy-writer`: Headlines, CTAs, primary text within Meta character limits (Sonnet, maxTurns: 20)
- `meta-format-adapter`: Asset dimension validation and placement spec-compliance reporting (Haiku, maxTurns: 15)
