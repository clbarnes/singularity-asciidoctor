build/adoc.sif: Singularity
	sudo singularity build build/adoc.sif Singularity

default: build/adoc.sif
