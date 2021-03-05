# Understanding relationship between array and its hashes
# Using array of hash form
# 03.03.2020 00:46
#   Soray Cengiz

#!usr/bin/perl

use strict;
use warnings;

# Pixel values of RGB colors.
my @blue  = (0,0,255);
my @green = (0,255,0);
my @red   = (255,0,0);

# The array takes hashes and hashes are with color and bit representation form
my @array_of_hashes = 
(
  {'Blue'  => \@blue}, 
  {'Green' => \@green },
  {'Red'   => \@red   }
);

my $len_of_array = $#array_of_hashes + 1;
print(" Length of array_of_hashes : ", $len_of_array , "\n");

# This two array will take the keys and values of our hashes.
my @keys_of_hashes   = ();
my @values_of_hashes = ();

# with "push" keyword we push the values to our arrays last index.
foreach my $kk (0 .. $len_of_array){
  push( @keys_of_hashes, keys %{$array_of_hashes[$kk]} );
  push( @values_of_hashes, values %{$array_of_hashes[$kk]} );
}

# "join" keyword is split the items in array.
print("\n ** Keys of hashes ** \n");
print( join("\n", @keys_of_hashes), "\n" );

# Here we dereference of our arrays.
# @$ operator is a kind of dereferencing op.
print("\n ** Values of hashes ** \n");
my $arr_item_ref;
foreach(@values_of_hashes){
  $arr_item_ref = $_;
  print("(");
  print( join(",", @$arr_item_ref), ")\n");
}

print("\n");

# Initialization of used items for reaching to values.
my ( $in_hash_ref, $key_of_hash_item, $value_of_hash_ref ) 
  = (0,0,0);
my ( %in_hash, @value_of_hash ) = () x 2;

# C type for loop.
for(my $kk = 0; $kk < $len_of_array; $kk+=1){

# ref of hash in array.
  $in_hash_ref = $array_of_hashes[$kk];
  
# hash in array. %$in_hash_ref also work.
  %in_hash     = %{$in_hash_ref};

# takes first item of @keys_of_hashes and update this array.
  $key_of_hash_item  = shift @keys_of_hashes;

# Take value of hash don't forget value is an array ref !!!
  $value_of_hash_ref = $in_hash{$key_of_hash_item};

# dereference of array.
  @value_of_hash     = @$value_of_hash_ref;
  
# Basic prints for output. "\" helps a lot.
  print( " \@array_of_hashes","[$kk]      : ", $in_hash_ref, "\n" );
  print( " DEREFERENCING !!! \n");
  print( " \%(\@array_of_hashes","[$kk])   : ", %in_hash, "\n" );
  print( " DEREFERENCING !!! \n");
  print( " \%(\@array_of_hashes","[$kk]){", $key_of_hash_item, "}  : ",
    $value_of_hash_ref, "\n" );
  print( " DEREFERENCING !!! \n");
  print(" Value  : ");
  foreach(@value_of_hash){
    print(" $_,");
  }
  print("\n\n");  

}
