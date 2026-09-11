# MCP / Connector Integration Guide (Meta Ads)

<!-- Purpose: How to pair meta-ads with the live Meta Ads connector / Marketing API MCP -->

## Overview

`meta-ads` works with manually provided data by default (Ads Manager exports,
Events Manager screenshots, pasted metrics). For live, read-through access to a
Meta ad account, pair it with the **official Meta Ads connector** (or a Meta
Marketing API MCP server). With a connector attached, the audit skills can pull
campaign/ad set/ad performance, creative, audiences, and Events Manager
diagnostics directly instead of asking you to paste them.

## Connect the official Meta Ads connector (recommended)

In Cowork: **Settings → Connectors**, find the **Meta** connector and connect it.
Sign in with the Meta account that owns your ad account and Page, then choose the
business portfolios and ad accounts you want it to see.

> **Don't see it?** It's an official Meta integration that's still in open beta,
> so it's rolling out account by account and might not be in your list yet. You can
> add it yourself as a custom connector: in **Connectors**, add a new custom
> connector, name it **Meta Ads**, paste the server URL
> `https://mcp.facebook.com/ads`, then connect and sign in.

Once connected, re-run any `meta-ads` command; the skill will detect the live
data source and read from it. Grant the **minimum scopes** needed — read access to
Ads (ads_read) and to Events Manager is enough for auditing; this skill is
audit-first and does not need write/management scopes to produce a report.

## What becomes automated

With the Meta connector attached, these checks can be evaluated from live data
instead of manual input:

- **Structure & performance** (M11-M18, M33-M40): campaigns, ad sets, ads,
  budgets, CBO/ABO, bidding, learning-phase status
- **Creative** (M25-M32, M-AN1): the active creative library, per-creative CTR /
  frequency trends, format mix, and Andromeda cluster analysis
- **Audience** (M19-M24, M-ST1/2): Custom Audiences, Lookalikes, exclusions,
  audience overlap, Advantage+ Audience usage
- **Pixel / CAPI & EMQ** (M01-M10): dataset status, event coverage, EMQ per event,
  deduplication rate, domain verification, AEM configuration
- **Attribution**: the per-ad-set attribution setting and window mix
- **Competitor** (`meta-competitor`): the Meta Ad Library is public and can be read
  without a connector at all

## What stays manual

- **Landing page analysis** (`meta-landing`): use `analyze_landing.py` on the URL
- **Creative subjective quality**: distinctness/hook judgment is a model task, not an API field
- **Consent / CMP verification**: requires inspecting the site's consent setup
- **Anything requiring Events Manager UI screenshots** the API doesn't expose

## Hybrid workflow

```
1. Connect the Meta Ads connector (Settings → Connectors → Meta)
2. Run /meta-ads audit (the skill auto-detects the live data source)
3. For anything the API can't see (landing pages, consent, screenshots), paste it
4. meta-ads merges live + manual data into one audit
5. The Meta Ads Health Score is calculated the same way regardless of source
```

## Security notes

- **Prefer read-only scopes** for audit work (ads_read + Events Manager read).
  This skill is audit-first; it does not require management/write access to
  produce a report.
- **Never inline long-lived tokens** in committed files. If you configure a custom
  MCP server manually, keep secrets in your OS keychain / environment and reference
  them with `${ENV_VAR}` interpolation — never commit the raw values.
- **Rotate any token** that was ever exposed. Treat an exposed Meta system-user or
  access token as compromised.
- **Business Manager access**: connect with an account that legitimately owns or has
  partner access to the ad account and Page; don't over-share portfolios.
- **Write operations** (creating/editing campaigns, budgets, audiences) are out of
  scope for the audit skills by design. If you later use a Meta MCP that exposes
  mutation tools, gate them behind explicit human confirmation.
