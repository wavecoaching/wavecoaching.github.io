# Infra & Deployment

This folder contains deployment configuration, scripts, and documentation for the Wave Coaching site.

---

## How Deployment Works

The site is deployed to **GitHub Pages** at `https://wavecoaching.github.io` using **GitHub Actions** (not a `gh-pages` branch).

### Pipeline Overview

```
Push to main
    └── .github/workflows/deploy.yml
            ├── build job: npm ci → npm run build → upload dist/ as artifact
            └── deploy job: actions/deploy-pages → live at wavecoaching.github.io
```

### Required One-Time Setup (GitHub Repo Settings)

1. Go to your repository on GitHub
2. Navigate to **Settings → Pages**
3. Under "Build and deployment" → set **Source** to **"GitHub Actions"**
4. Save. Future pushes to `main` will deploy automatically.

---

## Triggering a Deploy

### Automatic
Every push to the `main` branch triggers the deploy pipeline automatically.

### Manual (via GitHub UI)
1. Go to **Actions** tab in the GitHub repo
2. Select **"Deploy to GitHub Pages"** workflow
3. Click **"Run workflow"** → select `main` → click the green button

### Manual (via GitHub CLI)
```bash
./infra/scripts/deploy.sh
```
Requires the [GitHub CLI](https://cli.github.com/) (`gh`) to be installed and authenticated.

---

## Workflow File

The actual GitHub Actions workflow must live at `.github/workflows/deploy.yml` (GitHub requirement).
See: [`../.github/workflows/deploy.yml`](../.github/workflows/deploy.yml)

---

## Local Build Check

Before pushing, you can verify the build locally:
```bash
npm ci
npm run build
npm run preview   # preview the built site at localhost:4321
```
