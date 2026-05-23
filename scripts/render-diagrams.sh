#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob globstar

MERMAID_IMAGE="${MERMAID_IMAGE:-minlag/mermaid-cli@sha256:1d7f446732299cd13fe574943b48be123f62626800dcfcc68ad0808dc13f183d}"
PLANTUML_IMAGE="${PLANTUML_IMAGE:-plantuml/plantuml@sha256:e0f6fb9cb28defdbcd63320c61d0e98f6cf3302039f881278db8a9cb74c6fed2}"

docker pull -q "$MERMAID_IMAGE" >/dev/null
docker pull -q "$PLANTUML_IMAGE" >/dev/null

found=0

for src in **/*.mmd; do
  [[ "$src" == node_modules/* ]] && continue
  found=1
  out="${src%.mmd}.png"
  echo "Rendering (mermaid): $src -> $out"
  docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$PWD:/data" \
    "$MERMAID_IMAGE" \
    -i "/data/$src" \
    -o "/data/$out" \
    -b white \
    --width 2400 \
    --scale 4
done

for src in **/*.puml; do
  [[ "$src" == node_modules/* ]] && continue
  found=1
  out="${src%.puml}.png"
  echo "Rendering (plantuml): $src -> $out"
  docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$PWD:/data" \
    "$PLANTUML_IMAGE" \
    -tpng \
    -Sdpi=300 \
    "/data/$src"
done

if [[ "$found" -eq 0 ]]; then
  echo "No diagram files found"
fi
