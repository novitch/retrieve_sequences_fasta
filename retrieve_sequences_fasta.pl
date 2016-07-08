#!/usr/bin/perl -w
use strict;
use Getopt::Long;
my $usage = "Erreur!!perl retrieve_sequences_fasta.pl -infile=[geneID] -seq=[fasta_file] -geneIDtype=[simple if no space in fasta file; complex if space present] -out=[output]\n";

my ($f, $f1, $out, $type);
my %hash;
my %fasta;
GetOptions ("infile=s"      => \$f,
            "seq=s"         => \$f1,
            "out=s"         => \$out,
            "geneIDtype=s"  => \$type,
            ) or die("Error in command line arguments\n");


###############################################################################
open (FILE1,  $f) or die "pbm file1 $usage";
while (<FILE1>) {
    chomp;
    my @tab = split ("\t", $_);
    if (($tab[0] !~ /^#/) && ($tab[0] !~ /geneID/)){
        $hash{$tab[0]} = 1;
    }
}

close FILE1;
##############################################################################
if (($type ne "simple") || ($type ne "complex")){
    die "Error!! geneIDtype must be simple or complex, it's simple:)\n$usage\n";
}
###############################################################################
### geneID to sequence ###
###############################################################################

open(W, ">$out");

local $/ = ">";  #changer de separateur#

open (FILE3, $f1) or die "$usage";
while (<FILE3>) {
    chomp;
    my ($gID, $se);
    if ($type eq "simple"){
        if (($gID, $se) = /(.*?)\n(.*)/s){     # POUR LE 4M
            if ($hash{$gID}) {
                $fasta{$gID} = $se;
            }
        }
        else {
            print "Probleme dans cette sequence : $_\n";
        }
    }
    elsif($type eq "complex"){
        if (($gID, $se) = /(\S+)\s.*?\n(.*)/s){  # POUR LE 10M (CAD LES SEQUENCES QUI ONT UN ESPACE DANS LEUR ID)
            if ($hash{$gID}) {
                $fasta{$gID} = $se;
            }           
        }
        else {
            print "Probleme dans cette sequence : $_\n";
        }
    }
}

local $/ = "\n";

foreach my $i (keys %hash){
    if ($fasta{$i}){
        print W "\>".$i."\n".$fasta{$i}."\n";
    }
    else{
        print "Not retrieved: ".$i."\n";
    }
}


close W;
close FILE3;
