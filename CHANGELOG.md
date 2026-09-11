# Changelog

All notable changes to **Meta Ads** are documented here. The format is based on
[Keep a Changelog](https://keepachangelog.com/) and this project adheres to
[Semantic Versioning](https://semver.org/).

## [1.0.0] — 2026-07-04

Initial release of **Meta Ads**, a Meta-only paid-advertising audit and
optimization plugin derived from the multi-platform claude-ads architecture and
rebuilt end to end for Meta.

### Added
- **Orchestrator skill** (`meta-ads`) with a 16-command routing table, context
  intake, the 10-Principle Thinking Framework, Meta quality gates, and four-pillar
  scoring.
- **15 sub-skills**: `meta-audit`, `meta-analyze`, `meta-attribution`, `meta-capi`,
  `meta-creative`, `meta-landing`, `meta-budget`, `meta-plan`, `meta-competitor`,
  `meta-math`, `meta-test`, `meta-dna`, `meta-create`, `meta-generate`,
  `meta-photoshoot`.
- **9 agents**: 5 audit specialists (`meta-audit-core`, `-creative`, `-tracking`,
  `-budget`, `-compliance`) and 4 creative-pipeline agents
  (`meta-creative-strategist`, `meta-visual-designer`, `meta-copy-writer`,
  `meta-format-adapter`).
- **50-check Meta catalog** (M01-M40 + hyphenated v1.5+ IDs) covering Pixel/CAPI,
  EMQ, Andromeda creative diversity, learning phase, Advantage+, and Special Ad
  Categories — verified bidirectionally by the pytest harness.
- **15 reference files** rewritten Meta-only: audit checklist, benchmarks, bidding,
  budget allocation, conversion tracking, compliance, creative specs, copy
  frameworks, scoring, thinking framework, brand-DNA, image providers, voice-to-style,
  and the Meta connector integration guide.
- **12 industry templates** under `meta-plan/assets/` (e-commerce + creative playbook,
  SaaS, local service, B2B enterprise, info products, mobile app, real estate,
  healthcare, finance, agency, generic).
- **Meta connector / MCP integration**: documentation for connecting the official
  Meta Ads connector (`https://mcp.facebook.com/ads`) for live account reads.
- **pytest eval harness**: catalog coverage, scoring math, creative-routing snapshots,
  and SSRF/url-utils regression tests (59 tests).
- Cross-platform installers/uninstallers (`install.sh`/`.ps1`,
  `uninstall.sh`/`.ps1`).

### Changed vs the multi-platform origin
- Removed all non-Meta platform skills, agents, references, and checks (Google,
  LinkedIn, TikTok, Microsoft, Amazon, Apple, YouTube).
- Rebranded the command namespace from `/ads` to `/meta-ads` and the skill tree from
  `ads`/`ads-*` to `meta-ads`/`meta-*`.
- Rewrote every cross-platform reference (benchmarks, bidding, budget, tracking,
  compliance, specs, copy) to be Meta-only.
