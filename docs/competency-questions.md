# Competency questions

A competency question is a question the ontology exists to answer. The full
inventory, with who asks each one and its status, is
[experiment 44](https://github.com/digital-twin-ph/fieldwork/blob/main/docs/experiments/44-ontology-competency-questions.md)
in the Fieldwork repository.

The questions below are the **schema-level** ones: can the vocabulary express the
answer at all? Each runs at build time, and `mkdocs build --strict` turns a
failure into a failed build, so prose cannot drift away from the vocabulary
without someone noticing.

!!! note "Two kinds of competency question"
    These ask whether the **vocabulary** can express an answer. The Validation
    Lab's check 04 asks whether a **real run receipt** actually contains one, by
    querying an exported graph. Both are needed: a term can exist and never be
    emitted, which is how the lab found that the Old Naledi reporting boundary
    is not typed `fw:StudyArea`.

## Core vocabulary

```ontoink-cq
source: ontology/fieldwork.ttl
questions:
  - question: Every class carries a human-readable label, so a reader never meets a bare IRI.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      ASK { ?c a owl:Class . FILTER NOT EXISTS { ?c rdfs:label ?l } }
    expect: false
  - question: Every class carries a comment stating what it is, and where it matters what it excludes.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      ASK { ?c a owl:Class . FILTER NOT EXISTS { ?c rdfs:comment ?d } }
    expect: false
  - question: A study area cannot also be a clipping boundary, an acquisition boundary or a catchment.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:StudyArea owl:disjointWith fw:ClippingBoundary, fw:AcquisitionBoundary, fw:Catchment }
    expect: true
  - question: A presentation cannot also be a spatial operation, so a view cannot claim to have computed anything.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:Presentation owl:disjointWith fw:SpatialOperation .
            fw:MapView rdfs:subClassOf fw:Presentation .
            fw:TableView rdfs:subClassOf fw:Presentation .
            fw:ChartView rdfs:subClassOf fw:Presentation }
    expect: true
  - question: Boundary features are PROV entities, so a reasoner can see that a boundary is not an execution.
    ask: |
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX prov: <http://www.w3.org/ns/prov#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:StudyArea rdfs:subClassOf prov:Entity . fw:Catchment rdfs:subClassOf prov:Entity }
    expect: true
  - question: Which inclusion rule and outer margin produced a clipped raster can be recorded.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:rasterMaskConvention a owl:DatatypeProperty . fw:rasterMaskMarginPixels a owl:DatatypeProperty }
    expect: true
  - question: "Refused by design: no term implies a population count, because counts are of records or memberships."
    ask: |
      ASK { ?term ?p ?o FILTER(CONTAINS(LCASE(STR(?term)), "population")) }
    expect: false
  - question: "Known gap: reprojection provenance is not yet typed RDF. When this question starts failing, the gap has closed and experiment 44 is stale."
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { { fw:sourceCRS a owl:DatatypeProperty } UNION { fw:datumShift a owl:DatatypeProperty } }
    expect: false
  - question: Every spatial operation and dataset class is reachable from a declared parent, not floating.
    query: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      SELECT ?c WHERE { ?c a owl:Class . ?c rdfs:subClassOf ?parent }
    min_rows: 40
```

## Runtime evidence

```ontoink-cq
source: ontology/runtime.ttl
questions:
  - question: Which widget, at which version and digest, produced a result can be recorded.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:widget a owl:ObjectProperty . fw:catalogVersion a owl:DatatypeProperty . fw:catalogDigest a owl:DatatypeProperty }
    expect: true
  - question: A draft canvas plan cannot be mistaken for an observed workflow plan.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:CanvasNodePlan owl:disjointWith fw:WorkflowNodePlan }
    expect: true
  - question: A workflow step links a plan to its result and its receipt activities.
    ask: |
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX fw: <urn:fieldwork:>
      ASK { fw:resultEntity a owl:ObjectProperty . fw:receiptActivity a owl:ObjectProperty }
    expect: true
```
