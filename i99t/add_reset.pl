#!/usr/bin/perl -w

###############################################################################
# File: add_reset.pl
#
# Add global reset line to each ITC-99 ISCAS benchmarks.
# Input: A bench file (*.bench)
# Output: A corresponding bench file (*_r.bench) with global reset line added.
#
# Marong Phadoongsidhi
# University of Wisconsin-Madison, USA.
# June 14 2003
#
# Usage: ./add_reset.pl
###############################################################################

# first remove the old modified files
@rm_files = <*_r.bench>;
unlink @rm_files;

# array contains filename of each benchmark
@in_files = <*.bench>;

# For each input benchmark file
for ($i=0; $i <= $#in_files; $i++) {

  # open input file
  open(INPUT,"<$in_files[$i]") ||
    die "Can't input $in_files[$i] $!";

  # open modified bench file to write to
  $outfile = $in_files[$i];
  $outfile =~ s/.bench/_r.bench/;
  open(OUTPUT,">$outfile") ||
  die "Can't output $outfile $!";

  $begin_net = 0;
  $num_ff = 0;
  my @mod_gates;

  # for each line of the input file
  while ($line = <INPUT>) {
    chomp($line);
    next if ($line =~ /^\s*$/);  # skip blank line

    # do nothing: comment line
    if ($line =~/\#/) {}

    # once the original comment lines end, add my comment and reset lines
    elsif ($line =~/INPUT/) {
      if ($begin_net == 0) {
	$begin_net = 1;
	print OUTPUT "\n# Add global reset, ~reset lines\n";
	print OUTPUT "# Number of extra inverters = number of DFF with *AND gate fanin\n";
	print OUTPUT "\nINPUT(RESET_G)\n";
	print OUTPUT "INPUT(nRESET_G)\n";
      }
    }

    # do nothing: output line
    elsif ($line =~/OUTPUT/) {}

    # if the line is DFF, add its fanin to list of gates that will be modified
    elsif ($line =~/DFF/) {
      @tokens = split( /\(|\)/, $line );
      push (@mod_gates, $tokens[1]);
      $num_ff++;
    }

    # if the line is actually the gate we need to modify...
    elsif ($num_ff > 0) {
      @tokens = split(/ |=/, $line);
      foreach $mod_gate (@mod_gates) {
	if ($mod_gate eq $tokens[0]) {
	  # then if it's an NAND/AND gate, add active-low reset to input
	  if ($line =~/AND/) {
	    $line =~ s/AND\(/AND\(nRESET_G, /;
	  }
	  # if it's an OR/NOR, add active-high reset to input
	  elsif ($line =~/OR/) {
	    $line =~ s/OR\(/OR\(RESET_G, /;
	  }
	  # if it's an inverter, replace it with 2-input NOR
	  # and connect one fanin to active-high reset
	  elsif ($line =~/NOT/) {
	    $line =~ s/NOT\(/NOR\(RESET_G, /;
	  }
	  $num_ff--;
	}
      }
    }

    # write the line to output file
    print OUTPUT "$line\n";
  }

  #debug
  #print "@mod_gates\n";

  # done with the current bench file
  print ".... Done, write modified netlist to $outfile\n";
  close INPUT;
  close OUTPUT;
}
