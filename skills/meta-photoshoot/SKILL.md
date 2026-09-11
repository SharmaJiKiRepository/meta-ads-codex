---
name: meta-photoshoot
description: "Product photography enhancement for ad creatives using banana-claude image generation. Takes a product image and generates 5 professional photography styles for ad use: Studio, Floating, Ingredient, In Use, and Lifestyle. Requires banana-claude (v1.4.1+) with nanobanana-mcp. Triggers on: product photo, product photography, photoshoot, enhance product image, product shoot, product photos for ads, generate product photos, studio shot, lifestyle photo."
user-invokable: true
tested_date: 2026-05-17
tested_with: claude-code v2.x
---

# Ads Photoshoot: AI Product Photography

## Codex Provider Override

In Codex, load the installed `imagegen` skill and use native image generation for
all product-photo transformations. Banana-specific setup below is legacy fallback
guidance and must not block the workflow. Preserve product identity, requested
styles, output aspect ratios, organization, and visual QA.

Transforms a product image or description into professional ad-ready photography
in 5 distinct visual styles. Each style generates at two sizes: 1:1 (Meta Feed)
and 9:16 (Reels / Stories).

## Quick Reference

| Command | What it does |
|---------|-------------|
| `/meta-ads photoshoot` | Interactive: ask for product + styles |
| `/meta-ads photoshoot --styles studio floating` | Generate only selected styles |
| `/meta-ads photoshoot --product shoe.jpg` | Start with a product image file |
| `/meta-ads photoshoot --all-platforms` | Generate all 5 sizes per style |

## Environment Setup

Requires banana-claude (v1.4.1+) with nanobanana-mcp configured.
Run `/banana setup` to configure API key and MCP.

## Process

### Step 1: Collect Product Information

Ask (combine into one message):
1. **Product image**: Path to product image file (local) OR product URL OR text description
   > "Provide a product image path (e.g. ./product.jpg), a URL, or describe your product"
2. **Product description**: What is it? Key features to highlight? (helps prompt quality)
3. **Styles to generate**: Which of the 5 styles? (default: all 5)
   - Studio, Floating, Ingredient, In Use, Lifestyle
4. **Target placements**: Which Meta placements will these run on?
   - Determines output sizes (default: Feed + Reels → 1:1 / 4:5 + 9:16)

### Step 2: Load Brand Profile (Optional)

Check for `brand-profile.json` in the current directory.

If found, extract for style injection:
- `colors.primary` → inject into backgrounds and accent elements
- `aesthetic.mood_keywords` → inject as atmosphere descriptors
- `target_audience` → use for Lifestyle and In Use context
- `imagery.forbidden` → exclude from all prompts

If not found, proceed with standard style templates.

### Step 3: Verify banana-claude

Verify banana-claude is installed (run `/banana setup` to check). If not installed,
display setup instructions and exit.

### Step 4: Construct Prompts per Style

For each selected style, build the prompt using the template + product description + brand DNA.

#### Style 1: Studio
Clean, e-commerce style product shot.

**Base template:**
```
"[product description], professional product photography, clean white seamless
background, even studio lighting, soft drop shadow, high detail product focus,
ecommerce style, [brand.colors.primary] subtle accent reflections if applicable,
top-down or 3/4 angle, no distractions, catalog quality"
```

**Composition:** Centered, slight 3/4 angle or flat lay.
**Output sizes:** 1080×1080, 1080×1920

#### Style 2: Floating
Dramatic levitation effect.

**Base template:**
```
"[product description] floating in mid-air, dramatic floating product shot,
[brand.colors.primary or brand.aesthetic.mood_keywords[0]] gradient background,
atmospheric shadow below product, levitation effect, product defying gravity,
clean modern aesthetic, high contrast, striking visual"
```

**Composition:** Product centered vertically, ample space above and below.
**Output sizes:** 1080×1080, 1080×1920

#### Style 3: Ingredient
Flat lay with components.

**Base template:**
```
"[product description] centered flat lay, surrounded by its key ingredients
or materials artfully arranged, top-down overhead view, clean light background,
natural texture surface, product as hero element, ingredients scattered with
intentional negative space, editorial food photography style"
```

**Composition:** Top-down, product in center, ingredients fanning out.
**Output sizes:** 1080×1080 (optimal for this style). Also generate 9:16 vertical for Reels/Stories placements.

#### Style 4: In Use
Authentic usage context.

**Base template:**
```
"person's hands using [product description] in natural context, lifestyle
photography, focus on product-hand interaction, shallow depth of field,
warm natural window light, authentic not staged, [brand.target_audience.profession]
implied context, [brand.aesthetic.mood_keywords] atmosphere"
```

**Composition:** Hands prominent, product clearly identifiable, background soft-focus.
**Note:** Hands only; no full face (avoids model release complications).
**Output sizes:** 1080×1080, 1080×1920

#### Style 5: Lifestyle
Aspirational full-context shot.

**Base template:**
```
"[product description] in aspirational lifestyle scene, [brand.target_audience.age_range]
demographic implied environment, [brand.target_audience.profession] context,
[brand.aesthetic.mood_keywords] atmosphere, golden hour or clean natural lighting,
editorial photography style, [brand.aesthetic.negative_space] composition,
product clearly visible and prominent"
```

**Composition:** Environmental context, product as hero element within the scene.
**Output sizes:** 1080×1080, 1080×1920

### Iterative Refinement

For iterative refinement: if initial generation doesn't match brand expectations, adjust the prompt by specifying: lighting direction, color temperature, background texture, or product angle before regenerating.

### Step 5: Generate Images

**Domain mode selection per style:**
- Use banana **Product** mode for Studio, Floating, and Ingredient styles
- Use banana **Editorial** mode for In Use and Lifestyle styles
- Set resolution to 2K (default) for all generations

**Aspect ratio setup:** Use banana MCP `set_aspect_ratio` before each generation:
- For 1080x1080: set ratio to 1:1
- For 1080x1920: set ratio to 9:16

For each style x size combination, use `/banana generate` with the constructed
prompt, selected domain mode, and correct aspect ratio. Save output to
`./product-photos/[style]/[product-slug]-[style]-[WxH].png`.

Track results. If a generation fails, retry once with a simplified prompt.

### Step 6: Organize and Report

**Output directory structure:**
```
./product-photos/
  studio/
    product-studio-1080x1080.png
    product-studio-1080x1920.png
  floating/
    product-floating-1080x1080.png
    product-floating-1080x1920.png
  ingredient/
    product-ingredient-1080x1080.png
    product-ingredient-1080x1920.png
  in-use/
    product-in-use-1080x1080.png
    product-in-use-1080x1920.png
  lifestyle/
    product-lifestyle-1080x1080.png
    product-lifestyle-1080x1920.png
```

**Summary:**
```
✓ Product photos generated: [N] images

  Studio:     ./product-photos/studio/ (2 sizes)
  Floating:   ./product-photos/floating/ (2 sizes)
  Ingredient: ./product-photos/ingredient/ (2 sizes)
  In Use:     ./product-photos/in-use/ (2 sizes)
  Lifestyle:  ./product-photos/lifestyle/ (2 sizes)

  Cost: see ~/.banana/costs.json for total spend

  Best for:
  • Facebook/Instagram Feed → Studio (4:5) or Lifestyle (4:5)
  • Reels/Stories → Floating (9:16) or In Use (9:16)
  • Carousel → Studio (1:1) per card
  • Right column → Studio (1:1); crop to 1.91:1 after

  Run `/meta-ads generate` to use these in a full campaign.
```

## Cost Estimate

Before generating, show:
- Number of styles selected x 2 sizes = total images
- Estimated cost based on banana pricing tiers
- If >$0.50, ask for confirmation

## Meta Placement Recommendations

| Style | Best Placements | Rationale |
|-------|-----------------|-----------|
| Studio | Facebook Feed, Instagram Feed | Universal, clean, catalog-safe |
| Floating | Reels, Stories | High visual impact on full-screen 9:16 |
| Ingredient | Feed (square/4:5) | Works best square; tells the product story |
| In Use | Reels, Stories | Authentic, native-feeling vertical content |
| Lifestyle | All placements | Aspirational, broad appeal; crop 4:5 for Feed, 9:16 for Reels |

## Reference Files

- `~/.codex/skills/meta-ads/references/image-providers.md`: API setup and pricing
- `~/.codex/skills/meta-ads/references/brand-dna-template.md`: Brand injection schema
- `~/.codex/skills/meta-ads/references/meta-creative-specs.md`: Safe zone for 9:16
