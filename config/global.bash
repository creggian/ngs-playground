#!/bin/bash

module load Java/1.8.0_92

export BCFTOOLS_BIN="${HOME}/programmi/bcftools-1.9/local/bin/bcftools"
export BWA_BIN="${HOME}/programmi/bwa-0.7.9a/bwa"
export GATK_BIN="java -Xmx4g -XX:+AggressiveOpts -jar ${HOME}/programmi/GATK-3.3/GenomeAnalysisTK.jar"

export REF_FASTA="${GENOMIC_PIPELINE}/extra/gatk-bundle/ucsc.hg19.fasta"

export DBSNP_138_HG19_VCF="${GENOMIC_PIPELINE}/extra/gatk-bundle/dbsnp_138.hg19.vcf"
export ROCHE_SEQCAP_EZ_EXOME_V3_CAPTURE="${GENOMIC_PIPELINE}/extra/roche/SeqCapEZ_Exome_v3.0_Design_Annotation_files/SeqCap_EZ_Exome_v3_hg19_capture_targets.bed"
export VCF_1000G_PHASE1_INDELS_HG19_SITES="${GENOMIC_PIPELINE}/extra/gatk-bundle/1000G_phase1.indels.hg19.sites.vcf"
export VCF_1000G_OMNI2_5_HG19_SITES="${GENOMIC_PIPELINE}/extra/gatk-bundle/1000G_omni2.5.hg19.sites.vcf"
export VCF_MILLS_AND_1000G_GOLD_STANDARD_INDELS_HG19_SITES="${GENOMIC_PIPELINE}/extra/gatk-bundle/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf"
