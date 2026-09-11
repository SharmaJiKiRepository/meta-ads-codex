---
name: meta-plan
description: "Strategic Meta advertising planning with industry-specific templates. Covers objective and placement selection, campaign architecture, budget planning, creative strategy, tracking setup, and a phased implementation roadmap for Facebook, Instagram, Reels, Threads, Messenger, and Audience Network. Use when user says Meta ad plan, Facebook ad strategy, Instagram campaign plan, media plan, paid social strategy, or advertising plan."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

# Strategic Meta Advertising Plan

Strategic planning is where the **10-Principle Thinking Framework** (see
`meta-ads/references/thinking-framework.md`) earns its weight. THINK and
CONNECT (Lateral) dominate — first-principles unit economics combined with the
Advantage+ / Andromeda delivery reality are what make a plan strategic rather
than prescriptive. FEEL gates the messaging and audience choices; ACCEPT gates
the constraints (budget, timeline, team capacity, creative throughput).

## Process

### 1. Discovery
- Business type, products/services, target audience
- Current Meta advertising status (objectives, spend, performance, tracking)
- Goals: brand awareness, lead generation, e-commerce sales, app installs, messages
- Budget range (monthly/quarterly)
- Timeline and urgency
- Creative throughput: how many net-new concepts per week the team can produce
- In-house capacity vs agency needs

### 2. Competitive Analysis
- Identify top 3-5 competitors
- Analyze their active ads in the **Meta Ad Library** (creative, copy, placements, refresh cadence)
- Estimate relative spend / testing velocity from active-ad volume
- Identify messaging themes, offer structures, and Andromeda-diversity weaknesses
- Note placement and audience gaps competitors are missing (often Reels/UGC)

### 3. Objective & Placement Selection
- Load the industry template from the `assets/` directory
- Map the business goal to the right Meta objective (Sales, Leads, App, Traffic, Awareness, Engagement)
- Read `meta-ads/references/budget-allocation.md` for the allocation framework
- Read `meta-ads/references/conversion-tracking.md` for the Pixel + CAPI setup requirements
- Decide Advantage+ posture: Advantage+ Shopping, Advantage+ Audience, Advantage+ Placements, Advantage+ Creative
- Default to **Advantage+ Placements** unless a brand-safety reason narrows them

### 4. Campaign Architecture

#### Naming Convention
```
META_[Objective]_[Audience]_[Geo]_[Date]
```
Example: `META_SALES_Prospecting_US_2026Q1`

#### Campaign Structure Template
```
Ad Account
├── Advantage+ Shopping / Sales (e-commerce core, or main conversion campaign)
│   └── Broad targeting + high creative volume + existing-customer cap
├── Prospecting (Advantage+ Audience or manual)
│   ├── Ad Set: Lookalike (1-3%) of purchasers / high-value customers
│   └── Ad Set: Interest / broad, creative-led
├── Retargeting
│   ├── Ad Set: Viewers / engagers (video, IG/FB engagement)
│   ├── Ad Set: Add-to-cart / form-start (7-14 days)
│   └── Ad Set: Past customers (win-back / cross-sell, existing-customer cap)
└── Testing
    └── New concepts, hooks, formats, audiences (10% budget)
```

### 5. Budget Planning

#### Monthly Budget Distribution
Read `meta-ads/references/budget-allocation.md` for the 70/20/10 framework.

| Tier | Allocation | Purpose |
|------|-----------|---------|
| Proven (70%) | Winning campaigns/ad sets hitting CPA/ROAS | Revenue engine |
| Scaling (20%) | Winners being ramped under the 20% rule | Growth engine |
| Testing (10%) | New concepts, audiences, placements | Innovation |

#### Budget Pacing
- Month 1: launch + learning; expect higher CPA while ad sets exit the learning phase
- Month 2: tighten offer/creative, consolidate ad sets, cut clear losers
- Month 3+: scale winners under the 20% rule; keep 10% on testing for fresh concepts
- Ongoing: 70/20/10 with a fresh distinct-concept pipeline to fight Andromeda clustering

### 6. Creative Strategy

Meta is a creative-led platform under Andromeda — the plan must guarantee a
steady pipeline of *genuinely distinct* concepts, not variant volume.

#### Content Pillars
- **Pain Point**: the specific problem your audience feels
- **Social Proof**: testimonials, reviews, UGC, "trusted by"
- **Product Demo**: the product in action, feature close-ups
- **Offer**: promotion, bundle, free trial, lead magnet
- **Education / Story**: teach or tell a story that earns the scroll-stop

#### Creative Production Plan (Meta placements)
| Priority | Asset Type | Placements | Quantity / cadence |
|----------|-----------|------------|--------------------|
| P1 | UGC / creator video (9:16, sound-on) | Reels, Stories | 5-10, refresh weekly-biweekly |
| P2 | Static / 4:5 with hook copy | Feed | 10-15, refresh 2-4 weeks |
| P3 | Carousel / collection | Feed, Advantage+ Shopping | 3-5 |
| P4 | Testimonial / review video | Reels, Feed | 3-5 |
| P5 | Catalog / DPA creative | Retargeting | feed-driven |

### 7. Tracking Setup Plan

Before launching, ensure the Meta measurement stack is live:

| Layer | Requirement | Priority |
|-------|-------------|----------|
| Browser | Meta Pixel firing on all key pages | P1 |
| Server | Conversions API (Gateway or S2S) for all key events | P1 |
| Dedup | Shared `event_id`, ≥90% dedup rate | P1 |
| Match quality | EMQ ≥8.0 for Purchase; `fbc`/`fbp` forwarded | P1 |
| iOS | Domain verified, AEM 8 events prioritized by value | P1 |
| Consent | CMP live for EEA before pixel/CAPI fire | P2 |
| Catalog (e-comm) | Product feed connected + healthy for DPA/Advantage+ | P1 |

### 8. Implementation Roadmap

#### Phase 1: Foundation (Weeks 1-2)
- Install Pixel + Conversions API; verify dedup and EMQ in Events Manager
- Verify domain, configure AEM priority, connect catalog if e-commerce
- Build Custom Audiences (site, engagement, customer list) and 1-3% Lookalikes
- Produce the first batch of distinct creative concepts (aim ≥10 distinct)

#### Phase 2: Launch (Weeks 3-4)
- Launch the core conversion campaign (Advantage+ Shopping / Sales or Leads) first
- Use Highest Volume bidding to gather data; set sufficient ad-set budgets (≥5x CPA)
- Do NOT edit mid-learning-phase; monitor tracking is firing correctly

#### Phase 3: Optimize (Weeks 5-8)
- Analyze ≥2 weeks of post-learning data
- Introduce Cost Cap where CPA is stable; cut losers per the 3x Kill Rule
- Start Meta Experiments (A/B on concept, audience, or bidding)
- Add retargeting once prospecting feeds enough audience

#### Phase 4: Scale (Weeks 9-12)
- Scale winners under the 20% rule; move proven ad sets under Advantage+ campaign budget
- Expand placements / geos; deepen the retargeting funnel
- Keep 10% on testing fresh concepts to sustain Andromeda diversity
- Monthly performance + incrementality (Conversion Lift) reviews

## Industry Templates

Load from the `assets/` directory based on detected or specified business type:
- `saas.md`: SaaS companies
- `ecommerce.md`: E-commerce stores
- `ecommerce-creative.md`: E-commerce creative playbooks
- `local-service.md`: Local service businesses
- `b2b-enterprise.md`: B2B enterprise
- `info-products.md`: Info products and courses
- `mobile-app.md`: Mobile app companies
- `real-estate.md`: Real estate
- `healthcare.md`: Healthcare
- `finance.md`: Financial services
- `agency.md`: Marketing agencies
- `generic.md`: General business template

## Output

### Deliverables
- `META-STRATEGY.md`: Complete strategic Meta advertising plan
- `CAMPAIGN-ARCHITECTURE.md`: Campaign structure with naming conventions
- `BUDGET-PLAN.md`: Budget allocation with monthly pacing
- `CREATIVE-BRIEF.md`: Creative production plan with placement specs
- `TRACKING-SETUP.md`: Pixel + CAPI implementation checklist
- `IMPLEMENTATION-ROADMAP.md`: Phased rollout timeline

### KPI Targets
| Metric | Month 1 | Month 3 | Month 6 | Month 12 |
|--------|---------|---------|---------|----------|
| ROAS / CPA | Baseline (learning) | Toward target | Target | Target +20% / -10% |
| CVR | Baseline | +10% | +20% | +30% |
| CTR | Baseline | +15% | +25% | +30% |
| EMQ (Purchase) | Track | ≥7.0 | ≥8.0 | ≥8.0 |
| Creative diversity | ≥10 distinct | Sustained pipeline | Sustained | Sustained |
| Budget posture | Testing | Optimizing | Scaling | Maintaining |
