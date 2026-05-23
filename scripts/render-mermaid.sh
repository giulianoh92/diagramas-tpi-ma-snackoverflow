#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob globstar

PUPPETEER_CFG="$(mktemp)"
trap 'rm -f "$PUPPETEER_CFG"' EXIT
cat > "$PUPPETEER_CFG" <<'JSON'
{ "args": ["--no-sandbox"] }
JSON

found=0
for src in **/*.mmd; do
  [[ "$src" == node_modules/* ]] && continue
  found=1
  out="${src%.mmd}.png"
  echo "Rendering: $src -> $out"
  npx --yes -p @mermaid-js/mermaid-cli@10 mmdc \
    --input "$src" \
    --output "$out" \
    --backgroundColor white \
    --scale 2 \
    --puppeteerConfigFile "$PUPPETEER_CFG"
done

if [[ "$found" -eq 0 ]]; then
  echo "No .mmd files found"
fi
