## Preliminary Evaluation
{:#preliminary_evaluation}

For our preliminary evaluation, we have used the highly volatile BEAR-B-hourly dataset from the [BEAR benchmark](cite:cites bear),
which consists of the 100 most volatile resources from [DBpedia Live](cite:cites dbpedialive).
This dataset contains 48.000 unique triples over 1.299 versions,
and requires 8,314.86 MB when stored as N-Triples in changesets (466.35 MB gzipped).
[](#results-ostrich-ingestion-size-bearb-hourly) shows the growth of an OSTRICH store after the ingestion of each consecutive version of this dataset.
Using OSTRICH, this dataset requires only 450.59 MB to be stored, or 187.46 MB without the optimizing indexes.
On average, this is only 5,2% of IC strategies, 4,8% of TB strategies, but 514% of CB stategies.
Furthermore, a less volatile dataset with an average of 17M triples over 10 versions requires 4.48 GB of storage with OSTRICH,
and 3.03 GB if only the essential querying indexes are enabled.
With OSTRICH, this dataset takes on average 35% of IC strategies, 10% of TB strategies, and 66% of CB stategies.
For the tested datasets, OSTRICH requires significantly less storage space than IC and TB strategies.
For datasets with a low volatility, OSTRICH requires less storage space than CB strategies.
For highly volatile datasets, it requires more storage space,
which is because OSTRICH enables more efficient version materialization than these CB strategies,
and this comes at the cost of more required storage.

<figure id="results-ostrich-ingestion-size-bearb-hourly">
<img src="img/results-ostrich-ingestion-size-bearb-hourly.svg" alt="[bear-b-hourly ostrich ingestion sizes]" height="200em">
<figcaption markdown="block">
Cumulative OSTRICH store sizes for each consecutive BEAR-B-hourly version in GB for an increasing number of versions.
</figcaption>
</figure>

Fig. 2, 3 and 4 show the average query evaluation times for VM, DM and VQ triple pattern queries on this BEAR-B-hourly dataset.
In these figures, the evaluation times of OSTRICH are compared with versioning systems implemented based on [HDT](cite:cites hdt) and [Jena](cite:cites jena),
as provided by the BEAR benchmark.
At the cost of ingestion times that are 1,38 to 125 times higher than in alternative solutions,
OSTRICH is able to significantly reduce query times for VM, DM and VQ triple pattern queries.
Results have shown that the average query times range between 0.1 and 1 milliseconds,
which is lower than most alternative solutions.
Only for VM queries on individual HDT copies, OSTRICH is slightly slower.
This is because these HDT file are optimized for querying within each specific version,
while OSTRICH chooses a different trade-off:
storage space is significantly reduced and this makes VM queries only slightly slower compared to individual HDT copies.
Additionally, this also makes DM and VQ queries within OSTRICH faster than with individual HDT copies,
which makes OSTRICH a general-purpose versioned querying solution.

<figure id="results-bearb-hourly-vm-sumary">
<img src="img/results_bearb-hourly-vm-summary.svg" alt="[bear-b-hourly vm]" height="300em">
<figcaption markdown="block">
Median BEAR-B-hourly VM query results for all triple patterns for all versions.
</figcaption>
</figure>

<figure id="results-bearb-hourly-dm-summary">
<img src="img/results_bearb-hourly-dm-summary.svg" alt="[bear-b-hourly dm]" height="300em">
<figcaption markdown="block">
Median BEAR-B-hourly DM query results for all triple patterns from version 0 to all other versions.
</figcaption>
</figure>

<figure id="results-bearb-hourly-vq-summary">
<img src="img/results_bearb-hourly-vq-summary.svg" alt="[bear-b-hourly vq]" height="300em">
<figcaption markdown="block">
Median BEAR-B-hourly VQ query results for all triple patterns.
</figcaption>
</figure>
