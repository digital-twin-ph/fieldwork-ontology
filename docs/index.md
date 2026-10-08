# Fieldwork ontology

A reading view of the vocabulary that [Fieldwork](https://github.com/digital-twin-ph/fieldwork)
emits: its classes and properties, the SHACL shapes that constrain its runtime
graphs, and the competency questions it is meant to answer.

The vocabulary is **not maintained here**. Every `.ttl` file on this site is
copied from `ontology/` in the Fieldwork repository when the site is built, so
this view cannot drift from the source. The commit it was built from is recorded
in the build log and in `ontoink-report.json`.

## What this site is for

Reviewing the vocabulary: following a class to its parents, children and
properties, seeing which shapes constrain it, and checking that it still answers
the questions it was built for. It renders and validates; it does not author.

## What a clean report does not mean

The build validates the shapes with pySHACL and can run a reasoner, and both
can pass over a vocabulary that says very little. As
[experiment 42](https://github.com/digital-twin-ph/fieldwork/blob/main/docs/experiments/42-ontology-structure-and-meaning.md)
records, this vocabulary asserted no disjointness at all until October 2026;
consistency was unfalsifiable rather than reassuring. Ten axioms now make the
distinctions in the audit procedure checkable, and the quality metrics on this
page still show real gaps — most properties declare no domain.

Read a green result as "nothing checkable failed", and read the competency
questions for whether anything useful can be asked.

## Where the other views live

| View | Purpose |
| --- | --- |
| [Fieldwork](https://digital-twin-ph.github.io/fieldwork/) | The application itself |
| [Validation Lab](https://digital-twin-ph.github.io/validation-lab/) | Independent recomputation in Python, and the reasoning and competency checks against real run receipts |
| This site | Reading the vocabulary and its schema-level competency questions |
