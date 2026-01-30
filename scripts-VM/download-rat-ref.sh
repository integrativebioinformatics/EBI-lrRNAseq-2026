#!/usr/bin/env bash

mkdir -p /home/training/course_dir/data_dir/Barbara_Borges/references
cd  /home/training/course_dir/data_dir/Barbara_Borges/references

# Set base URLs
BASE_URL="https://ftp.ensembl.org/pub/release-115/fasta/rattus_norvegicus/dna"
GTF_URL="https://ftp.ensembl.org/pub/release-115/gtf/rattus_norvegicus/Rattus_norvegicus.GRCr8.115.chr.gtf.gz"

# Chromosome names (1-20, X, Y, MT)
CHRS=({1..20} X Y MT)

# Download all chromosome fasta files
for chr in "${CHRS[@]}"; do
    fname="Rattus_norvegicus.GRCr8.dna.primary_assembly.${chr}.fa.gz"
    wget "${BASE_URL}/${fname}"
done

# Concatenate all fasta files into one (after decompressing)
for chr in "${CHRS[@]}"; do
    gunzip -c "Rattus_norvegicus.GRCr8.dna.primary_assembly.${chr}.fa.gz"
done > Rattus_norvegicus.GRCr8.dna.primary_assembly.fa

# Remove individual chromosome fasta files
rm Rattus_norvegicus.GRCr8.dna.primary_assembly.*.fa.gz

# Download the GTF file
wget "${GTF_URL}"

# Unzip the GTF files

gunzip Rattus_norvegicus.GRCr8.115.chr.gtf.gz

echo "Download, concatenation, and decompression complete."
