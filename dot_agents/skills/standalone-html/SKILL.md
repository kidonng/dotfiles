---
name: standalone-html
description: Use when creating standalone HTML pages - styling, interactivity, bundle
---

# Standalone HTML

## Template

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="color-scheme" content="light dark">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>
    </head>
    <body>
    </body>
</html>
```

## Styling

Use UnoCSS for Tailwind CSS utilities:

```html
<script type="module">
import unocss from 'https://cdn.jsdelivr.net/npm/@unocss/runtime@66.10.5/+esm'
import wind4 from 'https://cdn.jsdelivr.net/npm/@unocss/preset-wind4@66.10.5/+esm'

unocss({
    defaults: {
        presets: [wind4()],
        // Include if using daisyUI
        theme: {
            colors: Object.fromEntries([
                'base-100', 'base-200', 'base-300', 'base-content',
                'primary', 'primary-content', 'secondary', 'secondary-content',
                'accent', 'accent-content', 'neutral', 'neutral-content',
                'info', 'success', 'warning', 'error',
            ].map((n) => [n, `var(--color-${n})`])),
        },
        // Include if using daisyUI
        outputToCssLayers: true,
    },
})
</script>

<div class="flex items-center"></div>
```

References:

- [UnoCSS CDN Runtime](https://raw.githubusercontent.com/unocss/unocss/main/docs/integrations/runtime.md)
- [Wind4 preset](https://raw.githubusercontent.com/unocss/unocss/main/docs/presets/wind4.md)

> Use `un-cloak` attribute with CSS rules such as `[un-cloak] { display: none }` to hide the unstyled element until UnoCSS applies the styles for it.

### Components

Use daisyUI for prebuilt components:

```html
<!--
- Include/exclude as needed
- NEVER include `base/reset.css`, UnoCSS already handles it
- `theme/light.css` MUST be included before `theme/dark.css`
-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/daisyui@5/base/properties.css,npm/daisyui@5/base/rootscrollgutter.css,npm/daisyui@5/base/scrollbar.css,npm/daisyui@5/base/rootscrolllock.css,npm/daisyui@5/base/rootcolor.css,npm/daisyui@5/base/svg.css,npm/daisyui@5/components/input.css,npm/daisyui@5/components/select.css,npm/daisyui@5/components/toggle.css,npm/daisyui@5/components/button.css,npm/daisyui@5/components/checkbox.css,npm/daisyui@5/components/menu.css,npm/daisyui@5/theme/light.css,npm/daisyui@5/theme/dark.css">
<script>
function applyTheme(query) {
  const root = document.documentElement
  if (query.matches) {
    root.setAttribute('data-theme', 'dark')
  } else {
    root.removeAttribute('data-theme')
  }
}

const query = matchMedia('(prefers-color-scheme: dark)')
applyTheme(query)
query.addEventListener('change', applyTheme)
</script>

<!-- Utility classes on daisyUI components MUST use important modifier (!) -->
<button class="btn btn-primary text-2xl!"></button>
```

List all styles:

```sh
curl --silent 'https://data.jsdelivr.com/v1/packages/npm/daisyui@5.7.47?structure=flat' | jq --raw-output '.files[].name | select(endswith(".css"))'
```

References:

- [Use daisyUI from CDN](https://raw.githubusercontent.com/saadeghi/daisyui/refs/heads/master/packages/docs/src/routes/(routes)/docs/cdn/%2Bpage.md)
- [daisyUI skill](https://daisyui.com/SKILL.md)

## Interactivity

Use Preact for interactivity:

```html
<script type="module">
import { h, render } from 'https://cdn.jsdelivr.net/npm/preact@11.0.0/+esm'
import { useState } from 'https://cdn.jsdelivr.net/npm/preact@11.0.0/hooks/+esm'
import htm from 'https://cdn.jsdelivr.net/npm/htm@3.1.1/dist/htm.module.js'

const html = htm.bind(h)

function App() {
    return html``
}

render(html`<${App} />`, document.body)
</script>
```

References: [No-Build Workflows](https://raw.githubusercontent.com/preactjs/preact-www/master/content/en/guide/v11/no-build-workflows.md)

## Icons

Use Iconify API for icons:

```html
<link rel="stylesheet" href="https://api.iconify.design/{prefix}.css?icons={icon1,icon2}">
<!-- Both classes required -->
<span class="icon--{prefix} icon--{prefix}--{name}"></span>
```

Recommended prefixes:

- `lucide`: generic icons
- `simple-icons`: brand icons

References: [Generating CSS for icons](https://raw.githubusercontent.com/iconify/website/main/docs/api/css.md)

### Search

```sh
curl --silent 'https://api.iconify.design/search?query={name}' | jq --raw-output '.icons[]'
curl --silent 'https://api.iconify.design/search?query={name}&prefix={prefix}' | jq --raw-output '.icons[]'
```

References: [Searching icons](https://raw.githubusercontent.com/iconify/website/main/docs/api/search.md)

## Bundle

Use Bun to bundle existing apps into a single file:

```sh
bun build --compile --target=browser --minify ./index.html --outdir=dist
```

References: [Standalone HTML](https://bun.com/docs/bundler/standalone-html.md)

> Bun inlines every local asset it finds in your HTML: anything with a relative path, of any file type, is embedded into the output file.

> Bun leaves external URLs (like CDN links or absolute URLs) untouched.
