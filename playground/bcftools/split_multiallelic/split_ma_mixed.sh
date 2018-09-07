#!/bin/bash -e

cd "${0%/*}"
WDIR=`pwd`

source "${WDIR}/../../../config/global.bash"

INPUT_VCF="${WDIR}/../../../data/variant_ma_mixed.vcf"

# the sed is required to fix GATK header of AD
sed 's/ID=AD,Number=./ID=AD,Number=R/' ${INPUT_VCF} | \
	${BCFTOOLS_BIN} norm -m - | \
	${BCFTOOLS_BIN} norm -f ${REF_FASTA} | \
	sed 's/ID=AD,Number=R/ID=AD,Number=./' \
	> output.vcf	
