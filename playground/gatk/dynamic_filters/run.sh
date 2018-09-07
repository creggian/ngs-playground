#!/bin/bash -e

cd "${0%/*}"
WDIR=`pwd`

source "${WDIR}/../../../config/global.bash"

INPUT_VCF="${WDIR}/../../../data/variant_ma_mixed.vcf"
SNP_FILTER="--filterExpression QD<2.0 --filterName lowQD"

${GATK_BIN} \
        -T VariantFiltration \
        -R ${REF_FASTA} \
        --variant ${INPUT_VCF}  \
	${SNP_FILTER} \
        -o output.vcf
