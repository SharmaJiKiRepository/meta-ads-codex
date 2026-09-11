# Meta Ads for ChatGPT / Codex

Codex-ready adaptation of the Meta Ads paid-advertising toolkit. This repository
preserves the upstream audit, planning, attribution, CAPI, creative, landing-page,
budget, reporting, and competitor-analysis workflows while fixing Codex paths and
using ChatGPT's native image generation for creative production.

## Install in Codex on Windows

```powershell
.\install-codex.ps1
```

Restart Codex or begin a new task after installation. Then ask naturally, for
example: `Use meta-ads to audit these Ads Manager exports.`

The original cross-host installation instructions remain below for reference.

---

# Upstream Meta Ads — Meta Paid Advertising Audit & Optimization

> A Claude Code / Cowork skill for auditing and optimizing Meta advertising —
> Facebook, Instagram, Reels, Threads, Messenger, and Audience Network — under the
> Advantage+ / Andromeda / GEM / Lattice delivery stack. 130+ weighted checks,
> parallel agents, 12 industry templates, Pixel/CAPI + EMQ and Conversions API
> deep dives, AI creative generation, PPC math, A/B test design, and PDF reports.

Conforms to the Agent Skills open standard. Verified on Claude Code / Cowork.

---

## What it does

Meta Ads turns a Meta ad account into a scored, prioritized action plan. It reads
your Ads Manager exports and Events Manager diagnostics (or pulls them live via the
official Meta connector), evaluates 130+ Meta-specific checks across four weighted
pillars, and produces a 0-100 Meta Ads Health Score with Quick Wins, a kill list,
and a scale list — all under a consistent thinking framework.

It also runs the full creative pipeline: extract brand DNA from a website, generate
campaign concepts and copy, and produce placement-sized ad images.

## Install

**Cowork / Claude Code plugin:** install this plugin from your marketplace, or use
the bundled installer:

```bash
bash install.sh                 # default target: Claude Code
bash install.sh --target=codex  # experimental cross-host targets
```

Windows:

```powershell
.\install.ps1
```

Uninstall with `bash uninstall.sh` / `.\uninstall.ps1`.

## Connect your Meta account (optional but recommended)

Meta Ads works with pasted data by default. For live, read-through access:

In Cowork, open **Settings → Connectors**, find the **Meta** connector, and connect
it. Sign in with the Meta account that owns your ad account and Page, then choose the
business portfolios and ad accounts you want it to see.

> **Don't see it?** It's an official Meta integration in open beta, rolling out
> account by account. Add it yourself as a custom connector: in **Connectors**, add a
> new custom connector, name it **Meta Ads**, paste the server URL
> `https://mcp.facebook.com/ads`, then connect and sign in.

Prefer read-only scopes (ads_read + Events Manager) — the audit skills never need
write access. See `meta-ads/references/mcp-integration.md`.

## Commands

| Command | What it does |
|---------|-------------|
| `/meta-ads audit` | Full Meta account audit with 5 parallel agents |
| `/meta-ads analyze` | Meta deep analysis (Pixel/CAPI, creative-as-targeting, structure, audiences, Advantage+) |
| `/meta-ads attribution` | Meta attribution audit (7d-click/1d-view, AEM, SKAN, view-through, dedup) |
| `/meta-ads capi` | Conversions API / server-side tracking pipeline audit |
| `/meta-ads creative` | Creative quality + Andromeda Entity-ID retrieval scoring |
| `/meta-ads landing` | Landing page quality assessment for Meta traffic |
| `/meta-ads budget` | Budget allocation + bidding review (CBO/ABO, Advantage+, cost caps) |
| `/meta-ads plan <type>` | Strategic Meta plan with an industry template |
| `/meta-ads competitor` | Competitor intelligence via the Meta Ad Library |
| `/meta-ads math` | PPC calculator (CPA, ROAS, break-even, LTV:CAC, MER) |
| `/meta-ads test` | Meta Experiments A/B test design |
| `/meta-ads report` | PDF audit report for client deliverables |
| `/meta-ads dna <url>` | Extract brand DNA → `brand-profile.json` |
| `/meta-ads create` | Campaign concepts + copy briefs → `campaign-brief.md` |
| `/meta-ads generate` | Generate AI ad images → `ad-assets/` |
| `/meta-ads photoshoot` | Product photography in 5 styles |

## The four scoring pillars

| Pillar | Weight | Covers |
|--------|--------|--------|
| Pixel / CAPI Health | 30% | Pixel firing, Conversions API, EMQ, dedup, AEM, domain verification, event coverage |
| Creative | 30% | Format & concept diversity, fatigue, Entity-ID clustering, spec/safe-zone compliance |
| Account Structure | 20% | CBO/ABO, consolidation, learning-phase health, budget sufficiency |
| Audience & Targeting | 20% | Frequency, Custom Audiences, Lookalikes, exclusions, Advantage+ Audience |

```
Health = 0.30·(Pixel/CAPI) + 0.30·Creative + 0.20·Structure + 0.20·Audience
Grade:  A (90-100)  B (75-89)  C (60-74)  D (40-59)  F (<40)
```

## Why Meta-specific

Under **Andromeda + GEM + Lattice**, creative is mechanically part of targeting.
Near-duplicate creatives (Similarity Score >60%) get retrieval-suppressed, so the
skill scores genuine concept diversity and predicts Entity-ID clustering before you
launch. Tracking is weighted equally: without the Conversions API, EMQ ≥8, and ≥90%
deduplication, Meta can't see 30-40% of your conversions post-iOS 14.5 — degrading
delivery and attribution alike. Every recommendation respects the learning phase, the
3x Kill Rule, the 20% scaling rule, and Special Ad Category restrictions.

## Creative pipeline

```
/meta-ads dna <url>   → brand-profile.json
/meta-ads create      → campaign-brief.md (concepts + copy deck)
/meta-ads generate    → ad-assets/ (placement-sized images)
/meta-ads photoshoot  → product-photos/ (5 styles × 2 sizes)
```

Image generation uses a pluggable provider (Gemini default via `GOOGLE_API_KEY`, or
`ADS_IMAGE_PROVIDER` for OpenAI / Stability / Replicate). Missing keys print setup
instructions and exit — never silent failure.

## Repository layout

- `meta-ads/` — orchestrator skill + 15 reference files
- `skills/` — 15 sub-skills (audit, analyze, attribution, capi, creative, landing, budget, plan, competitor, math, test, dna, create, generate, photoshoot)
- `agents/` — 9 agents (5 audit + 4 creative)
- `scripts/` — Python tools (landing analysis, screenshots, page fetch, image gen, PDF report)
- `tests/` — pytest eval harness (catalog coverage, scoring math, routing, SSRF)

## Tests

```bash
pip install -r requirements-dev.txt
pytest -q
```

The harness pins the 50-check Meta catalog bidirectionally against
`meta-ads/references/meta-audit.md`, verifies the scoring math, and snapshot-tests
creative-skill routing.

## License

MIT. See `LICENSE`.
