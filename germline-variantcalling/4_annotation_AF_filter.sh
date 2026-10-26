#!/bin/bash
#choose missense varaints
bcftools +split-vep \
       All_members_PASS_split_alleles_vep.vcf  -d  -f '%CHROM\t%POS\t%REF\t%ALT\t[[%GT\t%TGT\t]%SYMBOL\t%Feature\t%Consequence\t%AF\t%gnomADe_AF\t%MAX_AF\t%Existing_variation\t%BIOTYPE\t%VARIANT_CLASS\t%EXON\t%CDS_position\t%Protein_position\t%Codons\t%Amino_acids\t%MANE_SELECT\t%MANE_PLUS_CLINICAL\t%GENE_PHENO\t%SIFT\t%PolyPhen\t%CLIN_SIG\t%SOMATIC\t%PHENO\t%PUBMED\n'  -s :missense  >      All_members_Family_Missense.tsv

#choose all varaints
bcftools +split-vep \
       All_members_PASS_split_alleles_vep.vcf    -d  -f '%CHROM\t%POS\t%REF\t%ALT\t[[%GT\t%TGT\t]%SYMBOL\t%Feature\t%Consequence\t%AF\t%gnomADe_AF\t%MAX_AF\t%Existing_variation\t%BIOTYPE\t%VARIANT_CLASS\t%EXON\t%CDS_position\t%Protein_position\t%Amino_acids\t%Codons\t%MANE_SELECT\t%MANE_PLUS_CLINICAL\t%GENE_PHENO\t%SIFT\t%PolyPhen\t%CLIN_SIG\t%SOMATIC\t%PHENO\t%PUBMED\n'   >     All_members_Family_Biallelic_Vep_All_annotations.tsv

##AF filter according to the vcf columns e.g:$20 column
awk '{ if ($20 <= 0.001) print $0; }'  All_members_Family_Biallelic_Vep_All_annotations.tsv  > All_members_Family_Biallelic_Vep_All_AF_filter.tsv

##GT filter
###GT homo ("1/1"), hetero(1/0) and refrence 0/0
awk '$15 == "1/1" {print $0;}'  All_members_Family_Vep_Missense_AF_filter.tsv  > All_members_Family_Vep_Missense_AF_filter_Genotype.tsv 
##Father $11
awk '$11 == "0/1";$11=="1/0" {print $0;}' All_members_Family_6_Vep_Missense_AF_filter_genotype.tsv  > All_members_Family_Vep_Missense_AF_filter_father_Genotype.tsv 



