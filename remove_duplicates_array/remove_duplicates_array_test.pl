#!/usr/bin/perl

use strict;
use warnings;

# This function return an array that have removed duplicated items.
# Input parameter is an array.
sub remove_dup_in_array_using_hash{
  my @in_array = @_;
  my ( %fn_hash, @fn_array ) = () x 2;

# Here using hash property. Hashes can't take duplicated keys !!!
# Values is not important we don't even use them ignore it.
  foreach(@in_array){
    $fn_hash{ $_ } = "empty";
  }
  
# We map keys of hash with an empty array.  
  @fn_array = map { $_ } keys %fn_hash;
  
# Finally sort the array before return it.
  return sort @fn_array;

} #remove_dup_in_array_using_hash


# Basic one array print function.
sub o_out{
  my ($in_str, @in_array) = (@_);
  
  print(" $in_str  : ", join(" ", @in_array), "\n" );
} #o_out


# Print whole test arrays function.
sub all_out{
# Assign the input parameters to the local variables
  my ( $in_flag, @in_arrays_ref ) = (shift, @_);

  my ( @ep_arr, $ep_ref, $in_array ) = ( (), 0 x 2 );

# Iteratively do an print operations.
# If flag == 1 then do removing operations. 
# Else don't do anything just print the array.
  foreach (@in_arrays_ref){
    $in_array = $_;
    
    if( $in_flag == 1 ){
      @ep_arr = remove_dup_in_array_using_hash( @$in_array );
    }elsif( $in_flag == 0 ) {
      @ep_arr = @$in_array;      
    }else{
      print(" \nInvalid Input Argument !!!\n ");
      exit();
    }
    
    o_out( " -> ", @ep_arr );  
  }

} #all_out

# MAIN 

# Test arrays for script.
my @i_test_array = qw(1 2 2 3 1 2 3 4 6 1);
my @c_test_array = qw('m' 'm' 'c' 'a' 'c' 'e' 'f');
my @s_test_array = qw("red" "gray" "blue" "blue" "red");

# Whole test arrays in the an array. 
# Array of array reference !!!
my @arrays 
  = ( \@i_test_array, \@c_test_array, \@s_test_array );

# Choice is a kinf of flag. In PERL we don't have boolean data type.
my $choice = 0;
print("\n ** Original Arrays ** \n");
all_out($choice, @arrays);

$choice = 1;
print("\n ** Removed Arrays ** \n");
all_out($choice, @arrays);

