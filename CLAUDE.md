# Meta Ads: Meta Paid Advertising Audit & Optimization Skill

## Project Overview

This repository contains **Meta Ads**, a Claude Code / Cowork skill for
comprehensive Meta paid-advertising analysis across Facebook, Instagram, Reels,
Threads, Messenger, and Audience Network. It follows the Agent Skills open
standard and the 3-layer architecture (directive, orchestration, execution).
15 sub-skills, 9 agents (5 audit + 4 creative), and 12 industry templates cover
the Advantage+ / Andromeda / GEM / Lattice delivery stack with 130+ weighted
audit checks, plus Pixel/CAPI + EMQ, Conversions API server-side tracking, and
Meta attribution deep dives.

## Architecture

```
meta-ads/
  CLAUDE.md                          # Project instructions (this file)
  meta-ads/                          # Main orchestrator skill
    SKILL.md                         # Entry point, routing table, core rules
    references/                      # On-demand knowledge files (15 files)
  scripts/                           # Python execution scripts (installed under <SKILL_BASE>/meta-ads/scripts/)
  skills/                            # 15 specialized sub-skills
    meta-audit/SKILL.md             # Full Meta account audit (parallel agents)
    meta-analyze/SKILL.md           # Meta deep analysis (Andromeda + GEM + Lattice + Entity-ID predictor)
    meta-attribution/SKILL.md       # Meta attribution audit (7d/1d, AEM, SKAN, dedup)
    meta-capi/SKILL.md              # Conversions API / server-side tracking
    meta-creative/SKILL.md          # Creative quality + Andromeda retrieval scoring
    meta-landing/SKILL.md           # Landing page analysis for Meta traffic
    meta-budget/SKILL.md            # Budget allocation + bidding (CBO/ABO, Advantage+)
    meta-plan/SKILL.md              # Strategic Meta planning by industry
    meta-competitor/SKILL.md        # Meta Ad Library competitor research
    meta-math/SKILL.md              # PPC financial calculator
    meta-test/SKILL.md              # Meta Experiments A/B test design
    meta-dna/SKILL.md               # Brand DNA extraction
    meta-create/SKILL.md            # Campaign concepts and copy briefs
    meta-generate/SKILL.md          # AI ad image generation
    meta-photoshoot/SKILL.md        # Product photography in 5 styles
  agents/                            # 9 agents (5 audit + 4 creative)
    meta-audit-core.md             # Pixel/CAPI, structure, learning phase, Advantage+
    meta-audit-creative.md         # Creative diversity, fatigue, safe zones
    meta-audit-tracking.md         # Pixel, CAPI, EMQ, dedup, AEM, attribution
    meta-audit-budget.md           # Budget, bidding, structure, audience
    meta-audit-compliance.md       # Policies, Special Ad Categories, privacy
    meta-creative-strategist.md    # Campaign concept strategist
    meta-visual-designer.md        # AI image generation orchestrator
    meta-copy-writer.md            # Primary text, headlines, CTAs
    meta-format-adapter.md         # Asset dimension / placement validation
  tests/                             # pytest eval harness
    conftest.py                    # Shared fixtures
    fixtures/check-catalog.yaml    # 50-check canonical Meta catalog
    routing/                       # Trigger → skill snapshot tests
    audit/                         # Catalog coverage + scoring math tests
    scripts/                       # SSRF + sanitize_error regression tests
  install.sh / install.ps1          # Cross-platform installers
  uninstall.sh / uninstall.ps1      # Cross-platform uninstallers
```

## Commands

| Command | Purpose |
|---------|---------|
| `/meta-ads audit` | Full Meta account audit with 5 parallel agents |
| `/meta-ads analyze` | Meta deep analysis (Andromeda + GEM + Lattice) |
| `/meta-ads attribution` | Meta attribution audit (7d/1d, AEM, SKAN, dedup) |
| `/meta-ads capi` | Conversions API / server-side tracking pipeline audit |
| `/meta-ads creative` | Creative quality + Andromeda diversity scoring |
| `/meta-ads landing` | Landing page conversion analysis for Meta traffic |
| `/meta-ads budget` | Budget allocation optimization (CBO/ABO, Advantage+) |
| `/meta-ads plan <type>` | Strategic Meta planning by industry |
| `/meta-ads competitor` | Meta Ad Library competitor research |
| `/meta-ads math` | PPC financial calculator (CPA, ROAS, break-even, LTV:CAC, MER) |
| `/meta-ads test` | Meta Experiments A/B test design |
| `/meta-ads report` | PDF audit report generation |
| `/meta-ads dna <url>` | Extract brand DNA → `brand-profile.json` |
| `/meta-ads create` | Campaign concepts + copy briefs → `campaign-brief.md` |
| `/meta-ads generate` | Generate AI ad images → `ad-assets/` |
| `/meta-ads photoshoot` | Product photography in 5 styles |

## Development Rules

- Keep SKILL.md files under 500 lines / 5000 tokens
- Reference files should be focused; aim for under 350 lines
- Scripts must have docstrings, a CLI interface, and JSON output
- Follow kebab-case naming for all skill directories
- Agents invoked via the Codex collaboration subagents via `spawn_agent`, never via Bash
- No hardcoded credentials; use the Meta Ads connector / MCP for external API access
- All checks are Meta-specific (M-series IDs); the catalog is the single source of truth

## Data Sources

Works with manually provided data (Ads Manager exports, Events Manager
screenshots, pasted metrics) or, when the official **Meta Ads connector** is
attached (Settings → Connectors → Meta), reads the account live. See
`meta-ads/references/mcp-integration.md`.
