# Meta Advertising Compliance & Privacy Reference

<!-- Meta-only compliance reference -->

## Meta Ads Policies

### Special Ad Categories (Restricted Targeting)

| Category | Restrictions |
|----------|-------------|
| Housing | No age/gender targeting, no ZIP/postal narrowing, broadened minimum radius, no standard Lookalikes |
| Employment | Same restrictions as Housing |
| Credit | Same restrictions as Housing |
| Social Issues / Elections / Politics | Advertiser verification + "Paid for by" disclaimer; additional restrictions |
| Financial Products & Services | Enforced as a restricted category (added Jan 2025) |

All Special Ad Categories:
- Must **declare the category before campaign creation** (changing it later can force a rebuild)
- Cannot target by age or gender (18-65+ only), cannot narrow by ZIP/postal code
- Cannot use standard Lookalikes — use **Special Ad Audiences** where offered
- Copy/creative must avoid discriminatory or personal-attribute implications

### Enforcement

- Meta rejects/removes well over a billion ads per year; account restrictions escalate
  with repeated violations, and the appeals process can be slow
- Keep a clean account: honest claims, working landing pages, and category compliance

### Detailed Targeting Exclusions (removed)

- Removed from new ad sets (Mar 31, 2025) and boosted posts (Jun 10, 2025); existing
  campaigns using old exclusions stopped serving them (Jan 15, 2026)
- Meta cites ~22.6% lower median cost per conversion without exclusions — lean on
  exclusions via Custom Audiences (e.g. exclude purchasers) rather than detailed-targeting exclusions

### Content Rules

- No misleading health/weight-loss claims; **before/after** imagery is heavily restricted
- **Personal attributes**: copy cannot imply you know the user's condition/identity
  ("are you struggling with [condition]?" is prohibited)
- No sensational content / clickbait tactics
- Cryptocurrency and certain financial products require certification
- Political/social-issue ads require verification + disclaimers

## Privacy Regulations (2026) as they affect Meta

| Regulation | Region | Key requirement for Meta advertisers |
|-----------|--------|--------------------------------------|
| GDPR / UK GDPR | EU/EEA/UK | Consent before Pixel/CAPI fires; data minimization; DPA in place |
| CCPA / CPRA | California | Honor opt-out; set Limited Data Use (LDU) appropriately |
| US state laws | 20 states (2026) | Check per-state requirements; LDU coverage |
| LGPD / PIPL | Brazil / China | Consent and transparency; localization (PIPL) |

### iOS App Tracking Transparency (ATT)

- Average opt-in ~35% (higher in gaming, lower in education)
- Below ~30% opt-in shifts heavy reliance to AEM/SKAN + Meta's modeling
- ATT is the reason CAPI + EMQ + AEM discipline matters so much on Meta

### Consent for Meta (EEA)

- A CMP must gate Pixel/CAPI events to consented users; quantify the signal loss and
  factor it into benchmark expectations
- Server-side (CAPI) does **not** exempt you from consent — consent state must still be respected

### Compliance Decision Tree

```
IF serving EEA/UK:
  → CMP + consent gating on Pixel/CAPI = MANDATORY
  → Data Processing Agreement = MANDATORY
IF serving California / US state-law regions:
  → Set Limited Data Use (LDU) appropriately
  → Provide required opt-out / privacy disclosures
FOR ALL:
  → Privacy policy on landing pages = MANDATORY
  → Never send sensitive-category data through the Pixel/CAPI
  → Declare any applicable Special Ad Category before launch
```

## Healthcare on Meta

| Rule | Note |
|------|------|
| No targeting by health condition | Prohibited across the platform |
| No sensitive health data in Pixel/CAPI | Restrict event params; honor LDU |
| Certification for restricted verticals | Pharmacy / telehealth / treatment may require certification |
| Prefer service/education framing | Not condition-shaming or fear-based claims |
| Consent for tracking | Especially strict for health-adjacent sites |

## Financial Services on Meta

| Rule | Note |
|------|------|
| Credit = Special Ad Category | Restricted targeting; declare before launch |
| Clear disclosures | APR / fees / terms required; no misleading income claims |
| Certification | Some products (crypto, loans) require certification/licensing |
| Risk of restriction | Non-compliant claims → account restriction |

## Meta 2025-2026 Changes to Know

- **Link Clicks redefinition (Feb 2025)**: "Link clicks" now **excludes** social-engagement
  clicks (likes/comments/shares). Year-over-year comparisons show apparent drops; use
  "outbound clicks" or "landing page views" for continuity
- **Shops native checkout phase-out (Jun-Aug 2025)**: in-app checkout retired; flows now
  redirect to the advertiser's website — update any campaign relying on Shops checkout events
- **Financial Products Special Category (Jan 2025)**: restricted targeting for financial offers
- **Offline Conversions API discontinued (May 2025)**: use CAPI with `action_source='physical_store'`
- **Detailed-targeting exclusions removed (2025-2026)**: replace with Custom Audience exclusions
