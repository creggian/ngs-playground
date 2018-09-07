#!/bin/bash -e

# doc http://www.htslib.org/doc/bcftools.html#common_options

cd "${0%/*}"
WDIR=`pwd`

source "${WDIR}/../../../config/global.bash"

INPUT_VCF_1="${WDIR}/../../../data/variant_ma_mixed.vcf"
INPUT_VCF_2="${WDIR}/../../../data/variant_ma_mixed_snponly.vcf"

${BGZIP_BIN} -c -f ${INPUT_VCF_1} > ${INPUT_VCF_1}.gz
${BGZIP_BIN} -c -f ${INPUT_VCF_2} > ${INPUT_VCF_2}.gz

${TABIX_BIN} -f -p vcf ${INPUT_VCF_1}.gz
${TABIX_BIN} -f -p vcf ${INPUT_VCF_2}.gz

${BCFTOOLS_BIN} \
        isec \
	-c both \
        -O v \
        -n=2 \
        -w 1 \
	${INPUT_VCF_1}.gz \
	${INPUT_VCF_2}.gz \
        -o both_common.vcf

${BCFTOOLS_BIN} \
        isec \
	-c both \
        -O v \
        -C \
        -w 1 \
        ${INPUT_VCF_1}.gz \
        ${INPUT_VCF_2}.gz \
        -o both_first_only.vcf

${BCFTOOLS_BIN} \
        isec \
        -c both \
        -O v \
        -C \
        -w 1 \
        ${INPUT_VCF_2}.gz \
        ${INPUT_VCF_1}.gz \
        -o both_second_only.vcf

${BCFTOOLS_BIN} \
        isec \
        -c all \
        -O v \
        -n=2 \
        -w 1 \
        ${INPUT_VCF_1}.gz \
        ${INPUT_VCF_2}.gz \
        -o all_common.vcf

${BCFTOOLS_BIN} \
        isec \
        -c all \
        -O v \
        -C \
        -w 1 \
        ${INPUT_VCF_1}.gz \
        ${INPUT_VCF_2}.gz \
        -o all_first_only.vcf

${BCFTOOLS_BIN} \
        isec \
        -c all \
        -O v \
        -C \
        -w 1 \
        ${INPUT_VCF_2}.gz \
        ${INPUT_VCF_1}.gz \
        -o all_second_only.vcf
