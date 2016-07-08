########### README retrieve_sequences_fasta ###################
##############################################################
# DESCRIPTION: 
# Sort fasta sequences based on geneID proposed in the infile
# INPUT:
# -infile
# -seq
# -geneIDtype
# -out
#
# OUTPUT:
#-output: path to the file to save the corresponding tab delimited file. The default output file is “queryfile.annot.txt”
#
# USAGE: perl retrieve_sequences_fasta.pl -infile=[geneID] -seq=[fasta_file] -geneIDtype=["simple" if no space in fasta file; "complex" if space present] -out=[output]
#
# REQUIREMENTS:
# Perl >5.0
# OUTPUT:
#-output: path to the file to save the corresponding tab delimited file. The default output file is “queryfile.annot.txt”
#
# USAGE: perl taxonomic_annotation.v1.pl -query=[] -blastkegg=[] -blastrefseq=[] -output=[] OPTIONS -similarity=[integer] -similarity_species=[integer] -similarity_genus=[integer] -length=[integer] -evalue=[string]
#
# REQUIREMENTS:
# Perl >5.0



