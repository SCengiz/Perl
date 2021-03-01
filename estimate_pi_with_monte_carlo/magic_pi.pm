# Shebang line for this line use which perl code in promt.
#!/usr/bin/perl

# Import packages or module. Strict is used for 
# ... compiler and run time errors. Import this package every script.
use strict;
use warnings;
use Math::Trig;

package magic_pi;
sub new{
   my $class = shift;
   my $self = {
      num_of_total_point_ => shift,
  };
  
# Bless function is used to return a reference for become a object.
# An object to a class which is passed to it as an argument!!!
  bless $self, $class; 
  return $self;

} # new

# This func is a basic setter for our class member.
sub set_total_point{
  my ($self, $in_tot_point) = @_;
# If defined $in_tot_point then initialize this input to class member.
  $self->{num_of_total_point_} 
    = $in_tot_point if defined($in_tot_point);

} # set_total_point

sub estimate_pi{
# Take inputs to self.
  my ($self) = @_;
# Multiple variable initialization Here !
  my ( $num_of_points_in_circle, $coordinate_x, $coordinate_y , $distance_to_origin ) 
    = (0) x 4 ;
# Create Number_of_total_points times coordinates.
# ... coordinate items will be randomly between 0 to 1.
  for( 0 .. $self->{num_of_total_point_} ){
    $coordinate_x = rand();
    $coordinate_y = rand();
    $distance_to_origin = ($coordinate_x ** 2) + ($coordinate_y ** 2);
    $distance_to_origin **= (0.5);
# Calculate distance between random point to origin.  
# Compare this distance to 1. And make a decision.
    if($distance_to_origin <= 1){
      $num_of_points_in_circle += 1;
    }else{
      ;
    }
  }

# Our circle and rectange areas relationship.
  my $approximate_pi
    = 4 * ( $num_of_points_in_circle / $self->{num_of_total_point_} );
  return $approximate_pi;

} # estimate_pi

sub usage{
# Basic usage function for script.
  print("\n *** USAGE *** \n");
  print(" -o Number_of_Random_Point \n");

} # usage

sub average_of_array{
# Basic average calculating function for arrays.
# Copy input array to in_array.
  my @in_array = @_;
  my $sum = 0;
  foreach(@in_array){
    $sum += $_;
  }
# Don't forget HERE "+1" !
  return $sum/($#in_array+1);

} # average_of_array

sub check_less_or_bigger{
  my @in_array = @_;
# This parameters holds the number of less than pi and bigger than pi.
  my ( $big_count, $less_count ) = (0, 0);

# Basic algorithm for this, use Math package for pi.
# $_ is an next array value.
  foreach(@in_array){
    if( $_ > Math::Trig::pi() ){
      $big_count += 1;
    }else{
      $less_count += 1;
    }
  }
# Return multiple value for this func.
  return($big_count, $less_count);
  
} # check_less_or_bigger

sub output{
# Basic output function for script.
  my @in_array = @_;
  foreach my $kk (0 .. $#in_array){
    print($kk, " -> $in_array[$kk]\n");
  }
  
# check_less_or_bigger function returns 2 argument we take both to our variables.
  my ($big, $less) = check_less_or_bigger(@in_array);
  
  print( "\n *** OUTPUT ***\n" );
  print( "Remember PI              : ", Math::Trig::pi(), "\n" );
  print( "Number of total test     : ", $#in_array + 1, "\n" );
  print( "Average of Result        : ", average_of_array(@in_array), "\n" ) ;
  print( "Number of bigger than PI : ", $big, "\n" );
  print( "Number of less than PI   : ", $less, "\n" );
  
} # output
1;
