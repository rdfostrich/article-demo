## Demonstration Overview
{:#demonstration-overview}
TODO

<figure id="demo-query">
<img src="img/query.png" alt="[DM queries]">
<figcaption markdown="block">
Delta Materialization interface for querying the differences between
two versions by triple pattern with a certain offset and limit.
The page shows all matching triples annotated with either the addition (+) or deletion symbol (-).
Additionally, the total number of results and the query duration time is shown.
</figcaption>
</figure>

<figure id="demo-ingest">
<img src="img/ingest.png" alt="[Ingest]">
<figcaption markdown="block">
Ingesting a new version is done using a changeset form for additions and deletions.
The form accepts triples in turtle format, and will give user feedback in case invalid triples were provided.
</figcaption>
</figure>

<figure id="demo-stats">
<img src="img/stats.png" alt="[Stats]">
<figcaption markdown="block">
The stats page shows an overview of the number of triples in each version.
The user can hover over the version bars to see the exact number of triples in the top-left side of the graph.
</figcaption>
</figure>
