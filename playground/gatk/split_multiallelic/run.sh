#!/bin/bash -e

cd "${0%/*}"
WDIR=`pwd`

source "${WDIR}/../../../config/global.bash"

INPUT_VCF="${WDIR}/../../../data/variant_ma_mixed.vcf"

${GATK_BIN} \
    -T LeftAlignAndTrimVariants \
    -R ${REF_FASTA} \
    --variant ${INPUT_VCF} \
    -o output.vcf \
    --splitMultiallelics
