# Shapes and examples

The SHACL shapes and the synthetic example graphs they were written for.

!!! warning "Conformance is not established on this page"
    Fieldwork's own validator loads **all** example files as one data graph and
    **all** shape files as one shape graph, then binds each processing contract's
    input shape to that request with `sh:targetNode` before validating. A viewer
    that pairs one file with one shape cannot reproduce that, and attempting it
    reports violations that only mean the companion files were missing — which is
    how this page was first written, and what it reported.

    Conformance is established by `npm run validate:ontology` in the Fieldwork
    repository, and against a real exported run receipt by the Validation Lab.
    This page renders the graphs so they can be read.

## Shapes

```ontoink
source: ontology/shapes/runtime-receipts.ttl
height: 650px
title: Runtime receipt shapes
```

```ontoink
source: ontology/shapes/assets-jurisdictions.ttl
height: 600px
title: Asset and jurisdiction shapes
```

```ontoink
source: ontology/shapes/stac.ttl
height: 550px
title: STAC profile shapes
```

```ontoink
source: ontology/shapes/processing.ttl
height: 500px
title: Processing contract shapes
```

```ontoink
source: ontology/shapes/selection-result.ttl
height: 400px
title: Post-selection result shape
```

## Example graphs

Synthetic, and referencing each other: the STAC example reuses the boundary
files, which is why they are validated together rather than separately.

```ontoink
source: ontology/examples/gadm-study-area.ttl
height: 550px
title: A jurisdiction selection with its study area
```

```ontoink
source: ontology/examples/gadm-botswana-distribution.ttl
height: 550px
title: A provider distribution and its downloaded asset
```

```ontoink
source: ontology/examples/stac-processing.ttl
height: 550px
title: A STAC-discovered dataset routed to a shared reader
```
