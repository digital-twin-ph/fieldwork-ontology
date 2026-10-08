# Core vocabulary

`ontology/fieldwork.ttl` — study areas, spatial operations, datasets, the
presentation classes and the geoprivacy terms. Constrained here by the runtime
receipt shapes.

```ontoink
source: ontology/fieldwork.ttl
reasoner: auto
height: 700px
title: Fieldwork core vocabulary
```

## Reading the diagram

Disjointness is what makes the audit procedure's distinctions enforceable rather
than documentary: a study area cannot also be a clipping boundary, an
acquisition boundary or a catchment, a draft canvas plan cannot be an observed
workflow plan, and a presentation cannot be a spatial operation. The boundary
classes are declared PROV entities as well as GeoSPARQL features, which is what
lets a reasoner see that a boundary cannot be an execution.

Two classes here are **proposed, not emitted**: `fw:ClippingBoundary` and
`fw:AcquisitionBoundary`. Receipts keep the cutline under its own geometry
identity, so the distinction holds in practice, but nothing yet carries those
types.
