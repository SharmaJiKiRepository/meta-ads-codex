---
name: meta-landing
description: "Landing page quality assessment for Meta ad campaigns. Evaluates message match to the ad, page speed, mobile experience, trust signals, form/Instant-Form optimization, pixel/CAPI firing, and conversion rate potential. Use when user says landing page, post-click experience, landing page audit, LP audit, conversion rate, landing page CRO, or Meta landing page."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

<!-- Updated: 2026-04-13 | v1.5 -->

# Landing Page Quality for Ad Campaigns

## Process

1. Collect landing page URLs from active ad campaigns
2. Read `meta-ads/references/benchmarks.md` for conversion rate benchmarks
3. Read `meta-ads/references/conversion-tracking.md` for pixel/tag verification
4. Assess each landing page for ad-specific quality factors
5. Score landing pages and identify improvement opportunities
6. Generate recommendations prioritized by conversion impact

## Message Match Assessment

The #1 landing page issue in ad campaigns: does the page match the ad?

### What to Check
- **Headline match**: landing page H1 reflects ad copy headline/keyword
- **Offer match**: promoted offer (price, discount, trial) is visible above fold
- **CTA match**: landing page CTA matches ad's promised action
- **Visual match**: consistent imagery between ad creative and page
- **Keyword match**: search keyword appears naturally in page content

### Message Match Scoring
| Level | Description | Score |
|-------|-------------|-------|
| Exact match | Headline, offer, CTA all align perfectly | 100% |
| Partial match | Headline matches but offer/CTA differs | 60% |
| Weak match | Generic page, loosely related to ad | 30% |
| Mismatch | Page content doesn't reflect ad promise | 0% |

## Page Speed Assessment

Slow pages kill conversion rates. For every 1s delay, CVR drops ~7%.

### Thresholds (Ad Landing Pages)
| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| LCP | <2.5s | 2.5-4.0s | >4.0s |
| INP | <200ms | 200-500ms | >500ms |
| CLS | <0.1 | 0.1-0.25 | >0.25 |
| Time to Interactive | <3.0s | 3.0-5.0s | >5.0s |
| Page weight | <2MB | 2-5MB | >5MB |

### Common Speed Issues in Ad Pages
- Hero images not compressed (use WebP/AVIF)
- Too many third-party scripts (chat widgets, analytics, heatmaps)
- Render-blocking CSS/JS above fold
- No lazy loading for below-fold content
- Font files not preloaded

## Mobile Experience

75%+ of ad clicks come from mobile. Mobile experience is critical.

### Mobile Checklist
- Tap targets: ≥48x48px with ≥8px spacing
- Font size: ≥16px body text (no pinch-to-zoom needed)
- Form fields: properly sized, keyboard type matches input (email, phone, number)
- CTA button: full-width on mobile, visible without scrolling
- No horizontal scroll
- Images responsive and properly sized
- Phone number clickable (tel: link)
- No interstitials or popups blocking content on load

## Trust Signals

### Above-the-Fold Trust Elements
- Company logo visible
- Social proof (customer count, reviews, ratings)
- Security badges (SSL, payment security, guarantees)
- Recognizable client logos (B2B)
- Star ratings or testimonial snippet

### Below-the-Fold Trust Elements
- Full testimonials with names, photos, companies
- Case study highlights with specific metrics
- Certifications, awards, accreditations
- Privacy policy link
- Physical address/phone number (local service businesses)

## Form Optimization

### Form Length Impact on CVR
| Fields | Expected CVR Impact | Use Case |
|--------|-------------------|----------|
| 1-3 fields | Highest CVR | Top-of-funnel, free offer |
| 4-5 fields | Moderate CVR | Mid-funnel, qualified leads |
| 6-8 fields | Lower CVR | Bottom-funnel, sales-ready |
| 9+ fields | Lowest CVR | Only for high-value offers |

### Form Best Practices
- Pre-fill fields where possible (UTM data, known info)
- Use multi-step forms for 5+ fields (progressive disclosure)
- Show progress indicator on multi-step forms
- Inline validation (don't wait until submit to show errors)
- Error messages are clear and helpful
- Submit button text is specific ("Get My Free Quote" not "Submit")
- Thank you page has clear next steps

## Landing Page Health Score Algorithm

```
Landing Page Health Score = (Message Match x 0.25) + (Page Speed x 0.25) + (Mobile x 0.20) + (Trust x 0.15) + (Form x 0.15)
```

Each component is scored 0-100, then weighted. Final score maps to grade: A (90-100), B (75-89), C (60-74), D (40-59), F (<40).

## Consent Banner Impact

Flag if any of the following are true:
- Consent banner covers the primary CTA on load
- Consent banner delays form interaction by >1 second
- Consent banner pushes critical content (headline, offer, CTA) below the fold
- Banner cannot be dismissed on mobile without scrolling

> **Consent / CMP (EEA)**: Verify a consent management platform is live so the Meta Pixel and CAPI only fire for consented EEA users. Without proper consent signaling, EEA conversion signal degrades and Custom Audiences shrink significantly.

## Quick Wins

| Priority | Fix | Expected Impact |
|----------|-----|-----------------|
| 1 | Move primary CTA above the fold on all devices | +15-25% CVR |
| 2 | Reduce form fields to essential only (name, email, one qualifier) | +10-20% CVR |
| 3 | Add trust badges near CTA (security, guarantee, reviews) | +5-15% CVR |
| 4 | Optimize hero image (WebP/AVIF, <200KB, proper dimensions) | -1-2s load time |
| 5 | Fix mobile tap targets (>=48x48px with >=8px spacing) | +5-10% mobile CVR |

## Ad-Specific Landing Page Elements

### UTM Parameter Handling
- UTM parameters captured and stored (for attribution)
- Meta click ID preserved: fbclid captured on landing and forwarded to the form / CRM and to CAPI as fbc
- Parameters passed to form submissions or CRM

### Dynamic Content
- Location-specific content for geo-targeted campaigns
- Audience-specific messaging (different pages for different segments)
- A/B testing active on key elements (headline, CTA, hero image)

### Conversion Tracking
- Thank-you page / event fires the Meta Pixel AND Conversions API with a shared event_id
- Form submission triggers conversion event
- Phone call tracking configured (if applicable)
- Chat/live agent triggers tracked as micro-conversions

## Landing Page Quality for Meta Traffic

Meta doesn't have a Google-style Quality Score, but landing experience still
drives cost and delivery: slow or mismatched pages raise CPM, hurt the ad's
relevance/engagement diagnostics, and depress conversion rate.

| Factor | Why it matters on Meta | Target |
|--------|------------------------|--------|
| Mobile load speed | ~90%+ of Meta traffic is mobile; slow pages tank CVR and raise effective CPA | LCP <2.5s on 4G |
| Message match to the ad | The scroll-stopping ad promise must equal the page's H1/offer or bounce spikes | Exact/partial |
| Pixel + CAPI on the page | Landing must fire deduped events so Meta can optimize and attribute | Verified, ≥90% dedup |
| Instant Forms vs website | For lead gen, native Instant Forms often beat a website form on mobile CVR | Test both |
| Consent / CMP | EEA consent state must be read before the pixel fires, or signal degrades | CMP live |

> Consider testing **on-Meta destinations** (Instant Forms, Instant Experience,
> click-to-Messenger/WhatsApp) against your website — removing the load step and
> keeping users in-app frequently lifts mobile conversion rate.

## Output

### Landing Page Assessment

```
Landing Page Health

Message Match:    ████████░░  XX/100
Page Speed:       ██████████  XX/100
Mobile:           ███████░░░  XX/100
Trust Signals:    █████░░░░░  XX/100
Form Quality:     ████████░░  XX/100
```

### Deliverables
- `LANDING-PAGE-REPORT.md`: Per-page assessment with scores
- Message match analysis per ad-to-page combination
- Page speed improvement priorities
- Mobile experience fixes
- Form optimization recommendations
- Quick Wins sorted by conversion impact
