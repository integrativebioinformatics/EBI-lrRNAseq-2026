#!/usr/bin/env bash

cd /home/training/course_dir/data_dir/Barbara_Borges/
mkdir rat-results

# QC raw-reads
# Run NanoComp once, passing all files as a list
# The wildcard * handles gathering all files automatically
NanoComp --fastq rat_samples/*.fastq.gz \
         --outdir rat-results/nanocomp/raw-reads/ \
         --threads 8 \
         --names $(ls rat_samples/*.fastq.gz | xargs -n 1 basename)

echo "NanoComp report generation complete for raw-reads."


# Run Chopper for each sample

mkdir rat-results/filt_samples

for file in rat_samples/*.fastq.gz; do
    # Extract the filename from the path (removes 'samples/')
    filename=$(basename "$file")

    echo "Processing $filename..."

    # Run chopper and pipe to gzip, saving with the filt_ prefix
    chopper -q 10 -l 300 -t 10 -i "$file" | gzip > rat-results/filt_samples/"filt_$filename"
done

echo "Chopper - quality and minimal length filtering of raw-reads complete."

# QC filtered-reads

# Run NanoComp once, passing all filtered files as a list
# The wildcard * handles gathering all files automatically
NanoComp --fastq rat-results/filt_samples/*.fastq.gz \
         --outdir rat-results/nanocomp/filt-reads/ \
         --threads 8 \
         --names $(ls rat-results/filt_samples/*.fastq.gz | xargs -n 1 basename)

echo "NanoComp report generation complete for filtered reads."

# Mapping to genome reference
# Run minimap2

mkdir rat-results/minimap2

GENOME="references/Rattus_norvegicus.GRCr8.dna.primary_assembly.fa"

for file in rat-results/filt_samples/filt_*.fastq.gz; do
    # 1. Get the filename
    filename=$(basename "$file" .fastq.gz)

    # 2. Remove the "filt_" prefix
    sample_name="${filename#filt_}"

    echo "Aligning $sample_name..."

    # 3. Run the alignment and sort bam files
    minimap2 -ax splice -t 8 "$GENOME" "$file" | \
    samtools sort -@ 4 -o rat-results/minimap2/"${sample_name}.bam"

done

echo "Mapping of filtered reads to reference genome finished."

# QC mapping

# Run NanoComp once, passing all files as a list
# The wildcard * handles gathering all files automatically
NanoComp --bam rat-results/minimap2/*.bam \
         --outdir rat-results/nanocomp/mapped-reads/ \
         --threads 10 \
         --names $(ls rat-results/minimap2/*.bam | xargs -n 1 basename)

echo "NanoComp report generation complete for mapped-reads."

# Overall QC results

# Run MultiQC

cd rat-results
multiqc .

echo "MultiQC aggregated all results. Overall QC report generated."
echo "Core bash workflow complete."
