#!/bin/bash
/mapping/

module load  isaac-aligner/04.18.11.09 

Fastq=/data//raw_data/

cd /mapping/

echo "[`date`] alignment start" >> run.log
isaac-align -m 150 -r /mapping/reference/isaac/sorted-reference.xml  -n default \
 -b /WGS/Father    \
 --keep-unaligned back  \
 --base-calls-format fastq-gz   -o Aligned_Father

 echo "[`date`] alignment finished" >> run.log

