# TriWave Coaching Site

A marketing/coaching site for TriWave Coaching, built with Astro and Tailwind CSS.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Astro 5 |
| Styling | Tailwind CSS 4 |
| Language | TypeScript |
| Deployment | GitHub Pages via GitHub Actions |

---

## Directory Structure

```
wavecoachingsite/
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD pipeline — auto-deploys to GitHub Pages on push to main
├── infra/
│   ├── README.md             # Deployment docs
│   └── scripts/
│       └── deploy.sh         # Manual deploy helper (uses GitHub CLI)
├── public/                   # Static assets (images, fonts, favicons)
├── src/
│   ├── components/           # Reusable Astro/UI components
│   ├── layouts/              # Page layout wrappers
│   └── pages/                # File-based routing — each .astro file = a URL
│       └── index.astro       # Homepage ( / )
├── astro.config.mjs          # Astro configuration
├── package.json
└── CLAUDE.md                 # This file
```

---

## Development Workflow

```bash
npm install         # install dependencies
npm run dev         # start local dev server at localhost:4321
npm run build       # production build → dist/
npm run preview     # preview the built site locally
```

---

## Deployment

- **Automatic:** push to `main` → GitHub Actions builds and deploys to `https://wavecoaching.github.io`
- **Manual trigger:** via GitHub Actions UI or `./infra/scripts/deploy.sh`
- **One-time repo setup required:** GitHub repo Settings → Pages → Source = "GitHub Actions"

See `infra/README.md` for full deployment details.

---

## Build Conventions

- Pages go in `src/pages/` — Astro uses file-based routing
- Shared UI goes in `src/components/`
- Page layouts (nav, footer, etc.) go in `src/layouts/`
- Static files (images, PDFs) go in `public/`
- Tailwind classes are used for all styling — no separate CSS files unless necessary

---

## Notes for Claude

- This is a static site — no server-side rendering, no database, no API routes
- Keep pages lean; prefer composing from small components
- The site URL is `https://wavecoaching.github.io/wavecoachingsite/` (configured in `astro.config.mjs`)
- The GitHub repo is `wavecoaching/wavecoachingsite` with base path `/wavecoachingsite` set for project deployment
- Do NOT modify the `base` path in Astro config
