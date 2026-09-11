# Presentable Report Template (HTML Dashboard)

<!-- Meta report presentation reference -->

`/meta-ads report` and the report step of `/meta-ads audit` produce a polished,
dark-themed HTML dashboard via `scripts/generate_html_report.py`. This file
documents the data schema, the sections, and the design tokens so the report is
consistent and client-ready.

## How to generate

```bash
# From real audit data:
python3 scripts/generate_html_report.py --data report-data.json --output META-REPORT.html

# Preview the reference look with the built-in demo:
python3 scripts/generate_html_report.py --demo --output demo-report.html
```

The output `.html` is **self-contained** — inline CSS and inline SVG, no CDN or
network calls — so it renders offline and is safe to share directly.

## Sections (top → bottom)

1. **Header** — report title, period, and a colour-coded Health Score badge
   (green ≥75, amber 60-74, red <40 grade).
2. **Daily spend** — a pink vertical-bar chart of daily spend with a spend axis
   (left) and a ROAS axis (right).
3. **Spend share by campaign** — horizontal bars, one per campaign, coloured by
   status, with `£spend · roas N×` on the right.
4. **Narrative** — one or two sentences of analysis in a serif voice ("the
   pattern's clear…"). Keep it to the single most important takeaway.
5. **Filters row** — `↗ scale` / `◐ fatiguing` / `↘ cut / fix` legend chips.
6. **Creative leaderboard** — one card per creative with a coloured left border
   and a status pill, showing roas / spend / ctr / cpa / freq / hook-rate. Flag
   the problem metrics so the decision is obvious at a glance.

## Data schema (`report-data.json`)

```json
{
  "title": "Meta Ads — Account Report",
  "period": "Last 30 days",
  "currency": "£",
  "health_score": 74,
  "grade": "C",
  "daily_spend": [ {"day": 1, "spend": 420, "roas": 3.1}, "… one per day …" ],
  "spend_share": [
    {"campaign": "ugc — blush hero (advantage+)", "spend": 19300, "roas": 3.7, "status": "scale"},
    {"campaign": "shade range — prospecting",      "spend": 14100, "roas": 2.4, "status": "fatiguing"},
    {"campaign": "feature/benefit — static push",  "spend": 6200,  "roas": 1.3, "status": "cut"}
  ],
  "narrative": "Spend is up 18% but ROAS is sliding as budget scales into weaker creative.",
  "creatives": [
    {
      "name": "rio-blush-asmr-application",
      "type": "ugc video 9:16",
      "status": "fatiguing",
      "metrics": {"roas": "4.1×", "spend": "£11,200", "ctr": "2.3%",
                  "cpa": "£6.40", "freq": "4.2", "hook rate": "31%"},
      "flag": ["freq"]
    }
  ]
}
```

Field notes:
- Every field is optional; the generator applies sensible fallbacks and skips
  empty sections.
- `status` ∈ `scale` (green) · `fatiguing` (amber) · `cut` / `cut/fix` (red).
- `metrics` is an ordered object; render order is preserved on the card.
- `flag` lists the metric keys to highlight in amber on a creative card (e.g. a
  frequency over threshold, a CPA over target, a ROAS below break-even).

## Mapping audit findings → the dashboard

- **Health Score / grade** → from the four-pillar score (`scoring-system.md`).
- **spend_share status** → apply the 3x Kill Rule and the 20% scaling rule:
  winners above target = `scale`, saturating/fatiguing = `fatiguing`,
  CPA >3x target or ROAS below break-even = `cut`.
- **creatives + flag** → from the creative-fatigue thresholds
  (`benchmarks.md`): frequency >5 (prospecting) / >12 (retargeting), CTR decline
  >20% over 14 days, CPA >3x target — flag those exact metrics.

## Design tokens (kept in `generate_html_report.py`)

| Token | Value | Use |
|-------|-------|-----|
| Background | `#0b0b0d` | page |
| Panel | `#141417` / `#1a1a1f` | cards / panels |
| Ink | `#ece9e2` | primary text |
| Muted | `#8a8880` | labels / secondary |
| Pink | `#f77fb0` | daily-spend bars |
| Green | `#38d39a` | scale / healthy |
| Amber | `#e8a83a` | fatiguing / flagged metric |
| Red | `#f2547d` | cut / fix |

To restyle, edit the token constants at the top of
`scripts/generate_html_report.py`; every section reads from them.
