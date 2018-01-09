## Overview of the OSTRICH system
{:#system}

In this section, we give a brief overview of OSTRICH, the system on which this demonstration is built.

OSTRICH uses a _versioned triple store_ format
that allows VM, DM and VQ triple pattern queries to be resolved efficiently.
Furthermore, these queries return a triple stream, so that consumers can start using these triples as soon as each one arrives.
These triple streams support random-access, using which consumers can easily and efficiently apply an offset.
As certain systems, such as SPARQL query engines, typically optimize triple pattern join orders using estimated triple counts,
OSTRICH provides efficient count estimation for VM, DM and VQ queries.
Triple pattern queries, together with count estimation, form the basis for more sophisticated RDF/SPARQL query engines,
such as the client-side [Triple Pattern Fragments engine](cite:cites ldf).

Internally, OSTRICH stores a versioned dataset in a _hybrid IC-CB-TB_ way, using multiple indexes for supporting the different query types.
The initial version of a dataset is stored as a fully materialized and immutable snapshot.
This snapshot is stored as an [HDT](cite:cites hdt) file.
HDT a binary RDF representation that is highly compressed and provides indexing structures
that enable efficient querying for triple pattern queries and count estimation.
All other versions are stored as _changesets_,
i.e., lists of triples that need to be removed and lists of triples that need to be added.
These changesets are relative to the initial version, but merged in a timestamp-based manner to reduce redundancies between each version.

OSTRICH is implemented in C++, and is available as open source on [GitHub](https://github.com/rdfostrich/ostrich){:.mandatory}.
Additionally, JavaScript bindings for Node.js have been implemented and are available on [NPM](https://www.npmjs.com/package/ostrich-bindings){:.mandatory}.
These JavaScript bindings however lead to slightly slower queries compared to the native C++ API.
The C++ and JavaScript APIs allow OSTRICH stores to be queried using VM, DM and VQ triple pattern queries with a certain limit and offset.
Additionally, their count estimates can be retrieved.
Finally, new dataset versions can be ingested as changesets.
