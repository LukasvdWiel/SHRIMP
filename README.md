# SHRIMP
Scalable Highly Recursive Irrelugar Mesh Partitioner

The philosophy behind SHRIMP was to create a simple parallel partitioner that
was memory friendly, in order to partition extremely large meshes.
To accomplish this, there is no single global array,
but everything is kept locally.
Data is passed between partition by passing data around in a circular fashion,
between the threads.

A meshfile is read in parallel and each thread selects the data that belongs to it.
The partitioning is created by splitting the cloud of points in two
in such a way that the interface crosses the weighted midpoint of the cloud,
and having the smallest interface. These created point clouds can be split
again recursively. Once the partitioning of the points is completed,
the elements get the partition of its vertex with the smallest partition number.

This mechanism ensures that a good partitioning is made without the need
to allocate a large graph.

Depending on the output format selected the partitioning is written to file,
to be used by whatever needs it.

Available input formats:  simple, GTECTON

Available output formats: GTECTON, VTU
