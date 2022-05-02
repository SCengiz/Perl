#!/usr/bin/perl

use strict;
use warnings;

my $dirPath = "/home/soray/Desktop/fiverJobs";
my $InputFileName = "InputTestFile.txt";
my $OutputFileName = "OutputTestFile.txt";

print("-------Reading from", $InputFileName, "-------\n");
open(DATA, "<${dirPath}/${InputFileName}") or die "Couldn't open file!";

my @lines = <DATA>;
my $arrRef = \@lines;
print("Reference of array: ", $arrRef, "\n");

foreach(@lines) {
  print("$_\n");
}

print("-------Reading to", $OutputFileName, "-------\n");
open(DATAO, ">" ,"${dirPath}/${OutputFileName}") or die "Couldn't open file!";

print("Enter the content to be added\n");
my $content = <>;
print("content is: ", $content);

print DATAO $content;

my @array = (1, 2, 3);
print DATAO "array is: ", @array;
print DATAO "\narray reference is: ", \@array;


close(DATA);
close(DATAO);
