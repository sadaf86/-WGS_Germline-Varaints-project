#!/bin/bash

module load ensembl-vep/107

cd /WGS/vcf
vep  --dir_cache /data/home/ \
 --dir_plugins  VEP_plugin  \
 -i  All_members_PASS_split_alleles.vcf    \
 --output_file All_members_PASS_split_alleles_vep.vcf \
 --vcf \
 --compress_output bgzip \
 --species homo_sapiens \
 --assembly GRCh38 \
 --offline \
 --cache \
 --cache_version 107 \
 --force \
 --fork 7 \
 --everything  --terms SO  \
 --fasta Homo_sapiens.GRCh38.dna.toplevel.fa.gz  \
 --plugin CADD,whole_genome_SNVs.tsv.gz \
 --custom ClinVar,vcf,exact,0,CLNDN,CLNDNINCL,CLNDISDB,CLNDISDBINCL,CLNHGVS,CLNREVSTAT,CLNSIG,CLNSIGCONF,CLNSIGINCL,CLNVC,CLNVCSO,CLNVI


