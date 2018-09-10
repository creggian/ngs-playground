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

function run_bcftools {
	local mode="$1"
	${BCFTOOLS_BIN} \
		isec \
		-c ${mode} \
		-O v \
		-n=2 \
		-w 1 \
		${INPUT_VCF_1}.gz \
		${INPUT_VCF_2}.gz \
		-o ${mode}_common.vcf

	${BCFTOOLS_BIN} \
		isec \
		-c ${mode} \
		-O v \
		-C \
		-w 1 \
		${INPUT_VCF_1}.gz \
		${INPUT_VCF_2}.gz \
		-o ${mode}_first_only.vcf

	${BCFTOOLS_BIN} \
		isec \
		-c ${mode} \
		-O v \
		-C \
		-w 1 \
		${INPUT_VCF_2}.gz \
		${INPUT_VCF_1}.gz \
		-o ${mode}_second_only.vcf
}

run_bcftools "none"
run_bcftools "some"
run_bcftools "all"
run_bcftools "snps"
run_bcftools "indels"


