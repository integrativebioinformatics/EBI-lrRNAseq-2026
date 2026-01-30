#!/usr/bin/env bash
mkdir -p /home/training/course_dir/data_dir/Barbara_Borges/rat_samples/
cd /home/training/course_dir/data_dir/Barbara_Borges/rat_samples/
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR848/007/SRR8487227/SRR8487227_1.fastq.gz -o H9C2_Rbfox2_KD_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR848/000/SRR8487230/SRR8487230_1.fastq.gz -o H9C2_Rbfox2_Control_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR848/006/SRR8487226/SRR8487226_1.fastq.gz -o H9C2_Rbfox2_KD_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR848/001/SRR8487231/SRR8487231_1.fastq.gz -o H9C2_Rbfox2_Control_1.fastq.gz
