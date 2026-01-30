#!/usr/bin/env bash
mkdir -p /home/training/course_dir/data_dir/Barbara_Borges/references/
cd /home/training/course_dir/data_dir/Barbara_Borges/references/
wget https://ftp.ensembl.org/pub/release-115/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
wget  https://ftp.ensembl.org/pub/release-115/gtf/mus_musculus/Mus_musculus.GRCm39.115.chr.gtf.gz

gzip -d Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
gzip -d Mus_musculus.GRCm39.115.chr.gtf.gz
