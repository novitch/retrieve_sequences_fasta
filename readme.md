########### README retrieve_sequences_fasta ###################
##############################################################
# DESCRIPTION: 

 Sort fasta sequences based on geneID proposed in the infile
 
# INPUT:
 
 infile: gene ID in the first column
 seq: fasta file
 geneIDtype: simple (without any space in seq name) or complex (with space) in order to choose the regex to parse geneID in fasta file

# OUTPUT:

out path to the file to save the corresponding tab delimited file.

 USAGE: perl retrieve_sequences_fasta.pl -infile=[geneID] -seq=[fasta_file] -geneIDtype=["simple" if no space in fasta file; "complex" if space present] -out=[output]
 
# REQUIREMENTS:

Perl >5.0




