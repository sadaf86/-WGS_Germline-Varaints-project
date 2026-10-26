
#!/bin/bash

## HTSLib path needed
export C_INCLUDE_PATH=/htslib/gcc/8.2.0/1.10.2/include
export LD_LIBRARY_PATH=/htslib/gcc/8.2.0/1.10.2/lib
ref=/mapping/reference/Hg38.fa
in=/WGS/father/father_merged.bam 
out=/WGS/vcf
P=/Platypus/Platypus_0.8.1
gvcf=/mapping/reference/Homo_sapiens_assembly38.dbsnp138.vcf.gz

## germline variant calling with Platypus
module load htslib
cd /data/Blizard-BochukovaLab/Sadaf/WGS/
python $P/Platypus.py callVariants \
 --bamFiles=$in \
 --output=$out/Father.vcf --refFile=$ref \
 --source=$gvcf   \
 --getVariantsFromBAMs=1 \
 --minPosterior=0 

