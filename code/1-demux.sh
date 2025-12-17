for FILE in ../seqdata/1-original/*.fastq.gz; do
  # extract the KS### numbers, 137/138 are DNAzyme- and 139/140 are DNAzyme+
  KS=`echo $FILE | grep -oP "KS[0-9]{3}"`
  
  # remove the adapters and demux all at once
  echo "cutadapt --minimum-length 19 -j 16 \
    -a file:barcodes.fa \
    -o ../seqdata/2-demux/{name}_$KS.fq.gz \
    $FILE \
    &>../reports/demux_reports/$KS\.txt"
done | parallel