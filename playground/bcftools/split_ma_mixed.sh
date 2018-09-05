#!/bin/bash -e

cd "${0%/*}"
WDIR=`pwd`

source "${WDIR}/../../config/global.bash"

INPUT_VCF="${WDIR}/../../data/variant_ma_mixed.vcf"

${BCFTOOLS_BIN} norm -m - ${INPUT_VCF} > temp.vcf
${BCFTOOLS_BIN} norm -f ${REF_FASTA} temp.vcf > output.vcf
