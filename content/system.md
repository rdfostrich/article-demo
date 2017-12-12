## System
{:#system}

In this section, we give a brief overview of OSTRICH, the system on which this demonstration is built.

OSTRICH is a versioned triple store format that allows VM, DM and VQ triple pattern queries to be resolved efficiently.
Furthermore, these queries return a triple stream, so that consumers can start using these triples as soon as the earliest one arrives.
These triple streams support random-access, using which consumers can easily and efficiently apply an offset.
As certain systems, such as SPARQL query engines, typically optimize triple pattern join orders using estimated triple counts,
OSTRICH provides efficient count esimation for VM, DM and VQ queries.

Internally, OSTRICH stores a versioned dataset in a hybrid IC-CB-TB way, using multiple indexes for supporting the different query types.
The initial version of a dataset is stored as a fully materialized and immutable snapshot.
This snapshot is stored as an [HDT](cite:cites hdt) file, due to its highly efficient support for triple pattern queries and count esimation.
All other versions are stored as changesets relative to the initial version,
but merged in a timestamp-based manner to reduce redundancies between each version.

OSTRICH is implemented in C++, and is available as open source on [GitHub](https://github.com/rdfostrich/ostrich){:.mandatory}.
Additionally, JavaScript bindings for Node.js have been implemented and are available on [NPM](https://www.npmjs.com/package/ostrich-bindings){:.mandatory}.
These JavaScript bindings however lead to slightly slower queries compared to the native C++ API.
The C++ and JavaScript APIs allow OSTRICH stores to be queried using VM, DM and VQ triple pattern queries with a certain limit and offset.
Additionally, their count estimates can be retrieved.
Finally, new dataset versions can be ingested as changesets, i.e.,
lists of triples that need to be removed and lists of triples that need to be added.
