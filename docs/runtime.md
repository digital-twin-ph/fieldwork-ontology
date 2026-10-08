# Runtime evidence

`ontology/runtime.ttl` — the widget definitions, node plans, workflow steps and
receipt structure that a run emits, constrained by the receipt shapes.

```ontoink
source: ontology/runtime.ttl
reasoner: auto
height: 650px
title: Runtime provenance vocabulary
```

A receipt records which widget version and digest produced a result, what it
consumed, and the operation's own parameters. For raster clipping it also records
`fw:rasterMaskConvention`, which identifies the exact inclusion rule applied, and
`fw:rasterMaskMarginPixels`. A method name alone would not distinguish clips made
under different rules.
