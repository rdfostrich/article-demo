## Preliminary Evaluation
{:#preliminary_evaluation}

For our preliminary evaluation, we have used the BEAR-B-hourly dataset from the [BEAR benchmark](cite:cites bear).
This dataset contains around 48K triples over 1299 versions, and requires 8,314.86 MB when stored as N-Triples (466.35 gzipped).
[](#results-ostrich-ingestion-size-bearb-hourly) shows the growth of an OSTRICH store after the ingestion of each consecutive version of this dataset.
Using OSTRICH, this dataset requires only 450.59 MB to be stored, or 187.46 MB without the optimizing indexes.
Furthermore, a dataset with an average of 17M triples over 10 versions requires 4.48 GB of storage,
and 3.03 GB if only the essential querying indexes are enabled.
OSTRICH requires significantly less storage space than IC and TB strategies, but more than CB strategies.

<figure id="results-ostrich-ingestion-size-bearb-hourly">
<img src="img/results-ostrich-ingestion-size-bearb-hourly.svg" alt="[bear-b-hourly ostrich ingestion sizes]" height="150em">
<figcaption markdown="block">
Cumulative OSTRICH store sizes for each consecutive BEAR-B-hourly version in GB for an increasing number of versions.
</figcaption>
</figure>

Fig. 2, 3 and 4 show the average query evaluation times for VM, DM and VQ triple pattern queries on this BEAR-B-hourly dataset.
In these figures, the evaluation times of OSTRICH are compared with versioning systems implemented based on [HDT](cite:cites hdt) and [Jena](cite:cites jena),
as provided by the BEAR benchmark.
At the cost of ingestion times that are mostly higher than in alternative solutions,
OSTRICH is able to significantly reduce query times for VM, DM and VQ triple pattern queries.
Results have shown that the average query times range between 0.1 and 1 millisecond,
which is lower than most alternative solutions.
Only for VM queries on individual HDT copies, OSTRICH is slightly slower, while it requires less storage space.

<figure id="results-bearb-hourly-vm-sumary">
<img src="img/results_bearb-hourly-vm-summary.svg" alt="[bear-b-hourly vm]" height="200em">
<figcaption markdown="block">
Median BEAR-B-hourly VM query results for all triple patterns for all versions.
</figcaption>
</figure>

<figure id="results-bearb-hourly-dm-summary">
<img src="img/results_bearb-hourly-dm-summary.svg" alt="[bear-b-hourly dm]" height="200em">
<figcaption markdown="block">
Median BEAR-B-hourly DM query results for all triple patterns from version 0 to all other versions.
</figcaption>
</figure>

<figure id="results-bearb-hourly-vq-summary">
<img src="img/results_bearb-hourly-vq-summary.svg" alt="[bear-b-hourly vq]" height="200em">
<figcaption markdown="block">
Median BEAR-B-hourly VQ query results for all triple patterns.
</figcaption>
</figure>