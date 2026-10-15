# Felix Azaglo · Portfolio

An interactive, animated portfolio built with **Flutter Web**, showcasing three
apps I built end to end — each with a **live, playable demo**.

- **Pulse · Fitness Tracker** — workouts, weekly-goal chart, friends feed.
- **Ledger · Expense Tracker** — spending dashboard, charts, budgets.
- **Shoply · E-commerce** — storefront, cart and checkout flow.

## Highlights

- Animated **aurora** background (drifting colour blobs).
- Frosted-glass nav and panels, gradient display type.
- Staggered `Reveal` entrance animations, hover-lifting project cards.
- Responsive single-page layout (hero → about → work → contact).
- **Live demos** served from `/demos/<app>/` on the same origin.

## Structure

```
lib/
  main.dart
  theme/            # PortfolioColors, PortfolioTheme (dark aurora)
  data/project.dart # The three showcased apps
  utils/links.dart  # url_launcher helpers (external + demos)
  widgets/          # aurora_background, glass_panel, top_nav,
                    # project_card, gradient_text, reveal
  screens/portfolio_page.dart
```

## Live demos

Each app is built with `--base-href "/portfolio/demos/<app>/"` and copied into
`web/demos/<app>/` before building the portfolio. These bundles are git-ignored
in source and published on the **`gh-pages`** branch.

## Develop

```bash
flutter pub get
flutter run -d chrome
```

## Build & deploy

```bash
# 1. (re)build each demo into web/demos/<app>/  (see each app repo)
# 2. build the site
flutter build web --release --base-href "/portfolio/"
# 3. publish build/web to the gh-pages branch
```
