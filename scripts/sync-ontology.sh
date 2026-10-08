#!/usr/bin/env bash
# Copies the vocabulary from a Fieldwork checkout into docs/. The site never edits these
# files; it renders them, so a local build must sync first or it renders a stale copy.
set -euo pipefail
src="${1:-../fieldwork}"
[ -d "$src/ontology" ] || { echo "No ontology/ under $src. Pass the path to a Fieldwork checkout." >&2; exit 1; }
mkdir -p docs/ontology/shapes docs/ontology/examples
cp "$src"/ontology/*.ttl docs/ontology/
cp "$src"/ontology/shapes/*.ttl docs/ontology/shapes/
cp "$src"/ontology/examples/*.ttl docs/ontology/examples/
echo "Synced from $src at $(git -C "$src" rev-parse --short HEAD 2>/dev/null || echo 'unknown commit')"
