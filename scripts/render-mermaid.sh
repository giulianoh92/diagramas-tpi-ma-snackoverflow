#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob globstar

IMAGE="${MERMAID_IMAGE:-minlag/mermaid-cli@sha256:1d7f446732299cd13fe574943b48be123f62626800dcfcc68ad0808dc13f183d}"

docker pull -q "$IMAGE" >/dev/null

found=0
for src in **/*.mmd; do
  [[ "$src" == node_modules/* ]] && continue
  found=1
  out="${src%.mmd}.png"
  echo "Rendering: $src -> $out"
  docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$PWD:/data" \
    "$IMAGE" \
    -i "/data/$src" \
    -o "/data/$out" \
    -b white \
    --width 2400 \
    --scale 4
done

if [[ "$found" -eq 0 ]]; then
  echo "No .mmd files found"
fi
