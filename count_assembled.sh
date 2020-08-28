#!/bin/sh

## This script counts reads assembled to a reference. 
## Usage: ./count_assembled.sh file.bam
## Note: for more than a few files, should modify to use queue with sbatch
 
module load samtools/1.8
echo "ind raw assembled" > assembled_per_ind.txt

for file in *.sorted.bam
do
indname=`echo $file | sed 's/aln_//g' | sed 's/\.sorted\.bam//g'`
raw=`samtools stats $file | grep "raw total sequences:" | sed 's/SN\t.*:\t//g'`
assembled=`samtools stats $file | grep "reads mapped:" | sed 's/SN\t.*:\t//g'`
echo "$indname $raw $assembled" >> assembled_per_ind.txt
done
