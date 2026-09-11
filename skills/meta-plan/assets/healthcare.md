<!-- Meta industry template -->
# Healthcare Meta Advertising Template

## Industry Characteristics

- Heavily policy-restricted: no targeting by health condition; sensitive-data rules apply
- No health/medical inferences in Custom Audiences; careful with pixel data on health pages
- Success = HIPAA-safe patient leads / appointments, then booked visits
- Trust, credentials, and compliance dominate creative
- Some sub-verticals require **LegitScript / prior authorization** to advertise

## Compliance (do this first)

- **No condition-based targeting** and no implying you know a user's health status
- **Sensitive events**: avoid sending health-condition data through the Pixel/CAPI;
  restrict event parameters and honor Limited Data Use
- **Certification**: pharmacies, telehealth, addiction/treatment, and similar may need
  Meta/LegitScript certification before running
- Copy/creative must avoid prohibited claims and personal-attribute implications

## Recommended Objective & Placement Mix

| Layer | Objective | Budget % | Why |
|-------|-----------|----------|-----|
| Core | Leads (Instant Forms) / Calls | 50-65% | HIPAA-safe capture without health inference |
| Awareness | Video views (education, provider brand) | 15-25% | Build trust and top of funnel |
| Retargeting | Leads to services (compliant) | 15-25% | Re-touch site visitors within rules |

## Campaign Architecture

```
Ad Account (compliance reviewed)
├── Prospecting (Leads / Calls) — broad, no condition targeting
│   └── Ad Set: Service-led offer (consultation / screening)
├── Awareness (Video views) — patient education
└── Retargeting — site visitors (no health-condition audiences)
```

## Creative Strategy

- **Provider/clinician on camera** — credibility and warmth
- **Service and outcome framing** (not condition-shaming or fear)
- **Trust signals**: credentials, accreditation, patient testimonials (with consent)
- **Clear, compliant CTAs**: book a consult, free screening
- Avoid before/after and any prohibited or sensationalized claims

## Targeting Strategy

- **Broad / geo** targeting; never target by condition or health interest
- **Custom Audiences** only from compliant, consented sources — no health inference
- Retargeting limited to non-sensitive site sections

## Budget & Benchmarks

| Metric | Healthcare Meta benchmark (directional) |
|--------|-----------------------------------------|
| Meta CPM | $10-$24 |
| Cost per lead | $10-$60 depending on service |
| Min viable monthly budget | ~$2,000-$4,000 |

### Bidding
- **Highest Volume**; qualify leads with Instant Form questions
- Keep conversion events non-sensitive; import booked-appointment where compliant

## KPI Targets

| Metric | Month 1 | Month 3 | Month 6 |
|--------|---------|---------|---------|
| Cost per booked appointment | Baseline | -15% | -25% |
| Lead→visit rate | Track | Improve | Improve |

## Common Pitfalls

- Sending health-condition data through the Pixel/CAPI (major compliance risk)
- Condition-based targeting or copy implying a user's diagnosis
- Missing required certification for restricted health verticals
- Fear-based or prohibited claims → disapprovals/restrictions
