#Sequence alignment using bwa.

In this analysis, sequence data (100 bp reads from the freshwater burbot fish) attained from Illumina HiSeq 2500 is aligned to different reference genomes using bwa to compare alignment rates. The two reference genomes used are the highly fragmented burbot genome in the NCBI database (with a low N50) and a well-developed cod genome (closely related to burbot). The sequence reads from freshwater burbot fish are aligned to both the Gadus morhua complete genome and the new burbot genome to observe variation in alignment rates between individuals and references.

The Alignment_CountAssem file contains the Bash code used to align reads to the reference genomes and count assembled reads for each alignment. 

run_bwa_queuesub.sh: script used to align fastq reads to reference genomes (modified for each reference).

count_assembled.sh: script used to count the number of assembled reads for each alignment per individual. 

assembled_per_indGM.txt: text file containing counts of raw reads and assembled reads when using Gadus morhua as a reference genome.

assembled_per_indNBG.txt: text file containing counts of raw reads and assembled reads when using the new burbot genome as a reference genome.

Count_assembled.Rmd: Rmarkdown script used to compare assembled counts and percentages for the two different alignments. 





