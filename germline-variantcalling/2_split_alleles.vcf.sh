#!/bin/bash

cd /WGS/vcf/
##splits multiallelic variant records into separate biallelic records
module load bcftools
bcftools norm -m -any  All_members_PASS.vcf   > All_members_PASS_split_alleles.vcf

