#!/bin/bash

## HTSLib path needed
export C_INCLUDE_PATH=/htslib/gcc/8.2.0/1.10.2/include
export LD_LIBRARY_PATH=/htslib/gcc/8.2.0/1.10.2/lib

P=/Platypus/Platypus_0.8.1
in=/WGS/vcf/Trio_Denovo
module load htslib
cd /WGS/vcf/
python $P/bayesianDeNovoFilter.py   $in/Trio_Brother.vcf   all_member.ped


