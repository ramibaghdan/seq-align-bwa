# Sequence Alignment with BWA: Reference Genome Comparison

Aligning short-read sequencing data from freshwater burbot (*Lota lota*) to two
different reference genomes to compare alignment rates. The question: how much does the
choice of reference genome affect how many reads successfully align?

Reads (100 bp, Illumina HiSeq 2500) from 76 individuals are aligned with **BWA** to:
- the **new burbot genome** (same species, conspecific reference), and
- the *Gadus morhua* (Atlantic cod) genome, a closely related but different species.

> Graduate genomics-methods project, run on a SLURM HPC cluster (Compute Canada).

## Workflow

```
burbot reads (FASTQ)
        |
        +--------------------------+
        |                          |
        v                          v
[ bwa mem -> burbot ]      [ bwa mem -> cod ]
        |                          |
        v                          v
[ samtools sort + index ]  [ samtools sort + index ]
        |                          |
        v                          v
[ count assembled reads ]  [ count assembled reads ]
        |                          |
        +----------- compare -------+
                     |
                     v
        alignment rate per reference
```

Each FASTQ is aligned with `bwa mem`, converted and sorted to BAM with `samtools`, and
the number of mapped ("assembled") reads is counted from `samtools stats`. Counts are
then compared across the two references in R.

## Results

The same 76 burbot individuals (~59M reads total) were aligned to both references.

| Reference genome | Overall alignment rate |
|---|---|
| *Gadus morhua* (cod) | 31.2% |
| New burbot genome | 86.5% |

Reads aligned far better to the same-species burbot reference (~86%) than to the
related cod genome (~31%), roughly a 2.8x improvement. This illustrates how strongly
reference choice affects alignment: even a closely related species' genome leaves most
reads unaligned compared to a conspecific reference.

## Files

| File | What it is |
|---|---|
| `Alignment_CountAssem` | Bash workflow used to align reads to the reference genomes and count assembled reads for each alignment |
| `run_bwa_queuesub.sh` | Script used to align FASTQ reads to a reference genome (modified per reference) |
| `count_assembled.sh` | Script used to count assembled reads for each alignment per individual |
| `assembled_per_indGM.txt` | Raw and assembled read counts using *Gadus morhua* as the reference |
| `assembled_per_indNBG.txt` | Raw and assembled read counts using the new burbot genome as the reference |
| `Count_assembled.Rmd` | R Markdown comparing assembled counts and percentages across the two alignments |
| `Count_assembled.pdf` / `.html` | Rendered output of the comparison |

## Tools

BWA (`bwa mem`), samtools, R (R Markdown for the comparison), run via environment
modules on an HPC cluster with SLURM job submission.

## Notes

- Data: burbot sequencing reads from a graduate genomics-methods course; cod reference
  *Gadus morhua* and the burbot reference genome (`GCA_900302385.1`, public, NCBI).
- This is an early graduate project kept as a record of hands-on alignment and
  read-counting work.
