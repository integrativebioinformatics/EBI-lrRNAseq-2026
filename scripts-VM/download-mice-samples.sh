#!/usr/bin/env bash
mkdir -p /home/training/course_dir/data_dir/Barbara_Borges/mice_samples/
cd /home/training/course_dir/data_dir/Barbara_Borges/mice_samples/
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/018/SRR24781618/SRR24781618_1.fastq.gz -o brain_6m_rep_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/017/SRR24781617/SRR24781617_1.fastq.gz -o brain_6m_rep_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/016/SRR24781616/SRR24781616_1.fastq.gz -o brain_6m_rep_3.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/015/SRR24781615/SRR24781615_1.fastq.gz -o brain_6m_rep_4.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/014/SRR24781614/SRR24781614_1.fastq.gz -o brain_24m_rep_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/013/SRR24781613/SRR24781613_1.fastq.gz -o brain_24m_rep_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/012/SRR24781612/SRR24781612_1.fastq.gz -o brain_24m_rep_3.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR247/011/SRR24781611/SRR24781611_1.fastq.gz -o brain_24m_rep_4.fastq.gz
