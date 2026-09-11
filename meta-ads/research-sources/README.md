# Research Sources — Meta Ads

This directory documents the primary sources that shaped the check catalog,
benchmarks, and scoring logic in **meta-ads**. Everything here is Meta-specific:
Facebook, Instagram, Reels, Threads, Messenger, and Audience Network placements
under the Advantage+ / Andromeda / GEM / Lattice delivery stack.

## Primary sources

- **Meta for Business — Help Center & Blueprint** — objective definitions,
  Advantage+ behavior, Special Ad Categories, placement specs.
- **Meta Engineering Blog** — Andromeda ad-retrieval engine (Dec 2024), GEM
  and Lattice ranking changes (2025-2026).
- **Meta Marketing API changelog (v23 → v25)** — ASC/AAC deprecation, objective
  defaults, Conversions API and dataset endpoints.
- **Events Manager documentation** — Event Match Quality (EMQ), Aggregated
  Event Measurement (AEM), deduplication, and CAPI parameters.
- **Confect / third-party creative-diversity studies** — measured Similarity
  Score suppression threshold used in the Entity-ID clustering predictor.

## How the catalog was derived

Each check ID (`M01`–`M40` plus hyphenated v1.5+ IDs) maps to a documented Meta
behavior or a measured benchmark. When Meta ships a delivery-stack change, the
corresponding check is revised and the version bumped in `CHANGELOG.md`.
