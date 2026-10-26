
#!/bin/bash
in=WGS
module load qualimap
cd /WGS/Qualimap
qualimap bamqc  -bam $in/Father.bam  -nt 1  --outdir /WGS/Qualimap  \
-outfile  Father.pdf  -outformat PDF  --java-mem-size=15G
