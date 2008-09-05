#
# Downloads sequence for M. musculus (mouse) from NCBI.  This script
# was used to build the Bowtie index for M. musculus on August 14,
# 2008.
#
# From README_CURRENT_BUILD:
#   Organism: Rattus norvegicus (rat)
#   NCBI Build Number: 4
#   Version: 1
#   Release date: 5 July 2006
#   Freeze date for component genomic sequences: November 2004
#   Freeze date for mRNAs/ESTs used for annotation: 22 March 2006#
#

GENOMES_MIRROR=ftp://ftp.ncbi.nih.gov/genomes

BOWTIE_BUILD_EXE=./bowtie-build
if [ ! -x "$BOWTIE_BUILD_EXE" ] ; then
	if ! which bowtie-build ; then
		echo "Could not find bowtie-build in current directory or in PATH"
		exit 1
	else
		BOWTIE_BUILD_EXE=`which bowtie-build`
	fi
fi

for c in 1 2 3 4 5 6 7 8 9 ; do
	if [ ! -f rn_ref_chr$c.mfa ] ; then
		if ! which wget > /dev/null ; then
			echo wget not found, looking for curl...
			if ! which curl > /dev/null ; then
				echo curl not found either, aborting...
			else
				# Use curl
				curl ${GENOMES_MIRROR}/R_norvegicus/CHR_0$c/rn_ref_chr$c.mfa.gz
			fi
		else
			# Use wget
			wget ${GENOMES_MIRROR}/R_norvegicus/CHR_0$c/rn_ref_chr$c.mfa.gz
		fi
		gunzip rn_ref_chr$c.mfa.gz
	fi
	
	if [ ! -f rn_ref_chr$c.mfa ] ; then
		echo "Could not find rn_ref_chr$c.mfa file!"
		exit 2
	fi
done

for c in 10 11 12 13 14 15 16 17 18 19 20 X Y MT ; do
	if [ ! -f rn_ref_chr$c.mfa ] ; then
		if ! which wget > /dev/null ; then
			echo wget not found, looking for curl...
			if ! which curl > /dev/null ; then
				echo curl not found either, aborting...
			else
				# Use curl
				curl ${GENOMES_MIRROR}/R_norvegicus/CHR_$c/rn_ref_chr$c.mfa.gz
			fi
		else
			# Use wget
			wget ${GENOMES_MIRROR}/R_norvegicus/CHR_$c/rn_ref_chr$c.mfa.gz
		fi
		gunzip rn_ref_chr$c.mfa.gz
	fi
	
	if [ ! -f rn_ref_chr$c.mfa ] ; then
		echo "Could not find rn_ref_chr$c.mfa file!"
		exit 2
	fi
done

echo Running ${BOWTIE_BUILD_EXE} rn_ref_chr1.mfa,rn_ref_chr2.mfa,rn_ref_chr3.mfa,rn_ref_chr4.mfa,rn_ref_chr5.mfa,rn_ref_chr6.mfa,rn_ref_chr7.mfa,rn_ref_chr8.mfa,rn_ref_chr9.mfa,rn_ref_chr10.mfa,rn_ref_chr11.mfa,rn_ref_chr12.mfa,rn_ref_chr13.mfa,rn_ref_chr14.mfa,rn_ref_chr15.mfa,rn_ref_chr16.mfa,rn_ref_chr17.mfa,rn_ref_chr18.mfa,rn_ref_chr19.mfa,rn_ref_chr20.mfa,rn_ref_chrMT.mfa,rn_ref_chrX.mfa,rn_ref_chrY.mfa r_norvegicus
${BOWTIE_BUILD_EXE} rn_ref_chr1.mfa,rn_ref_chr2.mfa,rn_ref_chr3.mfa,rn_ref_chr4.mfa,rn_ref_chr5.mfa,rn_ref_chr6.mfa,rn_ref_chr7.mfa,rn_ref_chr8.mfa,rn_ref_chr9.mfa,rn_ref_chr10.mfa,rn_ref_chr11.mfa,rn_ref_chr12.mfa,rn_ref_chr13.mfa,rn_ref_chr14.mfa,rn_ref_chr15.mfa,rn_ref_chr16.mfa,rn_ref_chr17.mfa,rn_ref_chr18.mfa,rn_ref_chr19.mfa,rn_ref_chr20.mfa,rn_ref_chrMT.mfa,rn_ref_chrX.mfa,rn_ref_chrY.mfa r_norvegicus
