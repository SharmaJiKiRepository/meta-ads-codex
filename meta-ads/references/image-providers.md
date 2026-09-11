# Image Generation Providers

<!-- Updated: 2026-04-01 -->
<!-- Used by: meta-generate, meta-photoshoot, meta-visual-designer agent -->

## Default Provider: banana-claude

banana-claude (v1.4.1) is the default image generation provider. It acts as a Creative Director
layer on top of Google Gemini, providing 5-component prompt engineering, 9 domain modes,
brand presets, cost tracking, and post-processing.

### Prerequisites
- banana-claude installed (`/banana setup` to verify)
- nanobanana-mcp configured with GOOGLE_AI_API_KEY
- No additional pip packages needed (banana uses stdlib only)

### MCP Tools (Primary Method)

| Tool | Purpose | Key Parameters |
|------|---------|----------------|
| `set_aspect_ratio` | Configure ratio for next generation | ratio: "16:9", "1:1", "9:16", etc. |
| `set_model` | Switch Gemini model | model: "gemini-3.1-flash-image-preview" (default) |
| `gemini_generate_image` | Text-to-image generation | prompt: (string) |
| `gemini_edit_image` | Modify existing image | imagePath, prompt |
| `get_image_history` | Review session generations | (none) |

### Domain Modes for Ad Creative

| Mode | Use For | Meta Placement |
|------|---------|----------------|
| Product | E-commerce packshots, product ads | Feed, Advantage+ Shopping / catalog (DPA) |
| Editorial | Brand awareness, lifestyle campaigns | Feed, Reels |
| Cinema | Dramatic storytelling, video thumbnails | Reels, Stories |
| Portrait | People-centric ads, testimonials | Feed, Reels (UGC) |
| UI/Web | App install ads, SaaS screenshots | Advantage+ App, Feed |
| Logo | Brand identity assets | All placements |
| Landscape | Environment, travel, real estate | Feed, right column |
| Infographic | Data-driven ads, comparison charts | Feed, carousel |
| Abstract | Background textures, patterns | All (supporting assets) |

### 5-Component Prompt Formula

Banana constructs optimized prompts using:
1. [SUBJECT]: Physical details, appearance, material
2. [ACTION]: What it's doing, pose, state
3. [LOCATION/CONTEXT]: Where, when, atmosphere
4. [COMPOSITION]: Camera angle, framing, perspective
5. [STYLE]: Camera/lens specs, lighting, brand voice mapped attributes

Visual-designer agent builds these components from campaign brief + brand profile.

### Pricing (Gemini via banana)

| Resolution | Cost/Image | Use Case |
|------------|-----------|----------|
| 512px | $0.020 | Quick drafts, concepts |
| 1K | $0.039 | Standard web assets |
| 2K (recommended) | $0.078 | Quality ad creatives |
| 4K | $0.156 | Print, hero images |
| Batch API | 50% off | Bulk campaign generation |

### Aspect Ratios (14 supported)

| Ratio | Dimensions | Meta Placement |
|-------|-----------|----------------|
| 4:5 | 1080x1350 | Feed (preferred) |
| 1:1 | 1080x1080 | Feed, Carousel |
| 9:16 | 1080x1920 | Reels, Stories |
| 1.91:1 | 1200x628 | Right column / link preview |
| 16:9 | 1920x1080 | In-stream video |

Note: Gemini does not natively support 1.91:1. Generate 16:9 and crop to 1200x628 for the Meta right-column / link-preview placement.

### Brand Presets

banana supports brand presets stored at `~/.banana/presets/NAME.json`.
The meta-generate skill auto-creates a preset from brand-profile.json before generation.

Preset schema:
- colors: array of hex values from brand DNA
- style: visual style description from brand aesthetic
- mood: mood keywords from brand voice
- default_ratio: "16:9" (or platform-specific)
- default_resolution: "2K"

### Cost Tracking

banana logs all generations to `~/.banana/costs.json`.
meta-generate reads this after generation and includes cost summary in generation-manifest.json.

---

## Fallback Providers

If banana is not installed, these providers can be used directly via generate_image.py (deprecated).

### OpenAI (gpt-image-1)
- Env: `OPENAI_API_KEY`
- Price: ~$0.040/image (1024x1024), ~$0.060 (1024x1536)
- Package: `openai>=1.75.0`

### Stability AI (stable-diffusion-3.5-large)
- Env: `STABILITY_API_KEY`
- Price: ~$0.065/image flat
- Package: `stability-sdk>=0.8.4`

### Replicate (FLUX.1 Pro)
- Env: `REPLICATE_API_TOKEN`
- Price: ~$0.055/image
- Package: `replicate>=1.0.4`

---

## Error Reference

| Error | Cause | Fix |
|-------|-------|-----|
| banana MCP not found | nanobanana-mcp not configured | Run `/banana setup` |
| IMAGE_SAFETY | Safety filter triggered | Rephrase; use abstraction or artistic framing |
| 429 Too Many Requests | Rate limit | banana auto-retries with exponential backoff |
| FAILED_PRECONDITION | Billing not enabled | Enable billing in Google AI Studio |

### Rate Limits (Gemini via banana)

| Tier | RPM | Daily Images |
|------|-----|-------------|
| Free | 5-15 | 20-500 |
| Tier 1 (<$250 spend) | 150 | 1,500 |
| Tier 2 (>$250 spend) | 1,000+ | Unlimited |
