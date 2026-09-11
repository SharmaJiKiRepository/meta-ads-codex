# Meta Placement Creative Specifications

<!-- Meta-only creative specs reference -->

Meta serves the same campaign across many placements. Design 9:16 first for
Reels/Stories, then crop up to 4:5 / 1:1 for Feed. Always preview per placement
in Ads Manager before publishing.

## Image Specs

| Placement | Ratio | Size | Max file |
|-----------|-------|------|----------|
| Feed (preferred) | 4:5 | 1080×1350 | 30MB |
| Feed (supported) | 1:1 | 1080×1080 | 30MB |
| Stories / Reels | 9:16 | 1080×1920 | 30MB |
| Right Column | 1.91:1 / 1:1 | 1200×628 / 1080×1080 | 30MB |
| Carousel card | 1:1 | 1080×1080 | 30MB |

Min width 600px (1080px recommended). There's no hard 20% text rule anymore, but
heavy text still hurts delivery — keep the key message legible and the frame uncluttered.

## Video Specs

| Placement | Ratio | Resolution | Max duration | Max size |
|-----------|-------|-----------|-------------|----------|
| Feed | 4:5 (pref) / 1:1 | 1080×1350 / 1080×1080 | 241 min | 4GB |
| Stories | 9:16 | 1080×1920 | 120s | 4GB |
| Reels | 9:16 | 1080×1920 | 90s (rec 15-30s) | 4GB |
| In-Stream | 16:9 | 1920×1080 | up to 15 min | 4GB |

Reels/Stories are **sound-on** and full-screen; Feed is often sound-off — caption everything.

## Text Limits

| Component | Recommended | Max |
|-----------|------------|-----|
| Primary Text | ~125 chars visible before "…more" | 2,200 |
| Headline | 27-40 chars | — |
| Description | ~20-30 chars (where shown) | — |
| Reels/Stories primary text | ~72 chars visible | — |

CTA is a **predefined button** (Shop Now, Learn More, Sign Up, Get Offer, Book Now,
Download, Send Message, Subscribe, Apply Now, Contact Us, Watch More) — no free-text button.

## Carousel

- 2-10 cards, each 1:1 (1080×1080)
- Per card: headline ~40 chars, description ~20 chars
- Unique destination URL supported per card

## Collection / Advantage+ Shopping (catalog)

- Requires a connected, healthy **product catalog / feed**
- Dynamic product ads (DPA) auto-populate creative from the catalog
- Use product sets (best sellers, margin tiers, seasonal) to control which products show

## Advantage+ Creative Enhancements

Auto-adjustments when enabled: brightness/contrast, art filters, aspect-ratio crops,
music, text variations, and image-to-video. Validate with an A/B test; document any
brand-safety exception where you turn them off.

## Safe Zones (9:16 Reels / Stories, 1080×1920)

```
Top ~250px    → profile / caption header (keep text/logos out)
Bottom ~340px → caption, audio, CTA, navigation UI (keep text/logos out)
Right edge    → like / comment / share icons
Usable center → roughly Y:250-1580 for critical elements
```

For a single asset shipped to Advantage+ Placements, a ~1080×1080 centered safe area
survives most crops — but preview per placement.

## Quality Rankings

Meta reports three diagnostics vs same-objective competitors:
- **Quality Ranking**
- **Engagement Rate Ranking**
- **Conversion Rate Ranking**

Each rated Above Average / Average / Below Average (35th / 20th / 10th percentile bands).
Below-average rankings signal creative or relevance problems, not just bid issues.

## Video Encoding Standard

| Component | Recommended |
|-----------|-------------|
| Video codec | H.264 High Profile |
| Audio codec | AAC |
| Audio level | ~-14 LUFS |
| Container | MP4 (MOV supported) |
| Frame rate | 30fps |
| Color space | Rec. 709 |
| Bitrate (1080p) | 8-12 Mbps |
| Captions | Always (sound-off Feed + accessibility) |

## Aspect Ratio Quick Chart (Meta)

| Ratio | Dimensions | Used by |
|-------|-----------|---------|
| 9:16 | 1080×1920 | Reels, Stories |
| 4:5 | 1080×1350 | Feed (preferred) |
| 1:1 | 1080×1080 | Feed, Carousel |
| 1.91:1 | 1200×628 | Right column / link preview |
| 16:9 | 1920×1080 | In-stream video |
