#!/bin/bash
in=/WGS/example/FastQC
out=/WGS/example/
cd  .
#lane1 father
fastqc  -o results  L3_1.fq.gz
fastqc  -o results  L1_2.fq.gz

