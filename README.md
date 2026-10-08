# Fieldwork ontology viewer

A reading view of the [Fieldwork](https://github.com/digital-twin-ph/fieldwork)
vocabulary, published at
**https://digital-twin-ph.github.io/fieldwork-ontology/**.

Built with [OntoInk](https://github.com/ISE-FIZKarlsruhe/ontoink) (MIT), a MkDocs
plugin that renders Turtle as interactive diagrams, runs pySHACL and a reasoner at
build time, and executes competency questions as a build gate.

## The vocabulary is not maintained here

Every `.ttl` file is copied from `ontology/` in the Fieldwork repository when the
site builds, so this view cannot drift from the source. `docs/ontology/` is
git-ignored: it is build input, not content.

    ./scripts/sync-ontology.sh ../fieldwork     # local build: sync first
    pip install -r requirements.txt
    mkdocs serve

CI rebuilds on a push here, weekly to pick up vocabulary changes in Fieldwork, and
on demand. A stale render is worse than a missing one, because it looks current.

## What this site checks, and what it does not

**It checks** twelve schema-level competency questions — whether the vocabulary
can express an answer at all. `mkdocs build --strict` fails the build when one
fails, so the questions cannot quietly stop being true. Two are tripwires rather
than requirements: one asserts that no term implies a population count, and one
asserts that reprojection provenance is *still* untyped, so the build fails when
that gap closes and the inventory needs updating.

**It does not establish SHACL conformance.** Fieldwork's validator loads all
example files as one data graph and all shapes as one shape graph, and binds each
processing contract's input shape with `sh:targetNode` before validating. A viewer
pairing one file with one shape cannot reproduce that; attempting it reported
violations that only meant the companion files were missing. Conformance is
established by `npm run validate:ontology` in Fieldwork, and against a real
exported run receipt by the
[Validation Lab](https://github.com/digital-twin-ph/validation-lab).

**A clean report is not a good ontology.** The quality score is a heuristic, and
most properties here still declare no domain. Read green as "nothing checkable
failed".

## Why this and not Ontosphere

Ontosphere is a graph **editor**: it authors and reasons over instances, and
browsing a vocabulary's relationships and constraints through it was awkward. This
site is built for reading — class to parents to properties to shapes — which is
what reviewing a vocabulary needs. The reasoning Ontosphere was kept for already
runs headlessly in the Validation Lab.

Licensed under Apache License 2.0; OntoInk and MkDocs keep their own licences.
