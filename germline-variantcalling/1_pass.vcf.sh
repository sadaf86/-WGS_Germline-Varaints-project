#!/bin/bash

cd /WGS/vcf/

module load bcftools
bcftools merge --force-samples   Brother_filter_AF.vcf.gz  Father_filter_AF.vcf.gz.gz Mother_filter_AF.vcf.gz.gz sister_filter_AF.vcf.gz.gz  -Oz -o All_members_PASS.vcf 

##filter the pass variants
awk -F '\t' '{if($0 ~ /\#/) print; else if($7 == "PASS") print}'  All_members.vcf   >  All_members_PASS.vcf

/htslib-1.12/tabix -p vcf  All_members_PASS.vcf 

