## Introduction
{:#introduction}

Many of the [Linked Datasets](cite:cites linkeddata) that are available on the Web [change over time](cite:cites datasetdynamics).
Many of these dataset publishers host separate snapshots of each of these versions,
which can introduce storage overhead due to redundancies between them.
Furthermore, separate snapshots can make it harder to execute queries for performing historical analyses.

[RDF](cite:cites spec:rdf) provides a framework for representing Linked Data.
Over the last couple of years, [RDF archiving has been an active area of research](cite:cites rwbase, xrdf3x, semversion, selfindexingarchives, vtpf).
Fernández et al. define an [_RDF archive_](cite:cites bear) as a set of version-annotated triples,
where a _version-annotated triple_ is an RDF triple that is annotated with a label representing the version in which this triple holds.
Three [strategies](cite:cites archiving) were identified on how RDF archives can be stored:

1. The **Independent Copies (IC)** approach creates separate instantiations of datasets for
each change or set of changes.
2. The **Change-Based (CB)** approach instead only stores change sets between versions.
3. The **Timestamp-Based (TB)** approach stores the temporal validity of facts.

Additionally, [several query types were introduced](cite:cites bear) to cover the retrieval demands in RDF archives, which are referred to as _query atoms_.
In this work, we consider the following query atoms:

1. **Version materialization (VM)** retrieves data using queries targeted at a single version.
Example: _Which books were present in the library yesterday?_
2. **Delta materialization (DM)** retrieves query result change sets between two versions.
Example: _Which books were returned or taken from the library between yesterday and now?_
3. **Version query (VQ)** annotates query results with the versions in which they are valid.
Example: _At what times was book X present in the library?_

<span class="placeholder printonly">
<span style="display: block; height: 5em;"></span>
<!-- This is a dummy placeholder for the ACM first page footnote -->
</span>

Each of these storage strategies have their advantages and disadvantages in combination with certain query atoms.
For instance, IC works well in combination with VM queries because it stores each version separately, so it can query each version separately as well.
However, IC is less efficient for DM queries because it requires the differences between two dataset versions for the given query to be generated on-the-fly.
Hybrid storage strategies, such as applied by [TailR](cite:cites tailr), can however provide different trade-offs between these strategies.

In this work, we describe and demonstrate _OSTRICH_, which is a hybrid IC-CB-TB storage technique,
that offers efficient VM, DM and VQ triple pattern query support.
This system is further discussed in [](#system), together with a preliminary evaluation in [](#preliminary_evaluation).
After that, we give an overview of a demonstration of OSTRICH using a Web-based graphical user interface in [](#demonstration-overview).
Finally, we discuss our conclusions and opportunities for future work in [](#conclusions).
