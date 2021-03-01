# Shebang line for this line use which perl code in promt.
#!/usr/bin/perl

# Import packages or module. Strict is used for 
# ... compiler and run time errors. Import this package every script.
use strict;
use warnings;

# Need "lib" use magic_pi is not enough !!!
use lib ("/home/soray/Desktop/Perl_Examples");
use magic_pi;

# This array takes input arguments.
my @in_args = {};
# Command will take the random points for estimating pi.
my $command;

# C type for loop !!!
for(my $kk = 0; $kk < $#ARGV + 1; $kk++){
  @in_args[ $kk ] = $ARGV[ $kk ];
}

# "==" will not work cause of "-o" is a str.
# If invalid forms will be entered gives an error message and exit.
if($in_args[0] eq '-o'){
  $command = $in_args[1];
}else{
  print(" Invalid input arguments !!! \n");
  magic_pi::usage();
  exit;
}

# Basic C type casting for command.
my $num_of_rand_point = int($command);
# Class instances with new function. A kind of constructor.
my $test_data = new magic_pi($num_of_rand_point);

# Number of iteration_num times pi will be estimated.
# Whole estimation will store an array location.
my $iteration_num = 100;
my @array_result = ();

# Carefull for for loop boundries.
foreach my $kk ( 0 .. $iteration_num - 1){
  push( @array_result, $test_data->estimate_pi() );
}

magic_pi::output(@array_result);
