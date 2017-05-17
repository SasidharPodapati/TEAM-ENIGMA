#!/usr/bin/perl
use List::MoreUtils qw(first_index);
use warnings;
use Data::Dumper qw(Dumper);
#use 5.12.2;
use experimental 'smartmatch'; 
#use List::AllUtils qw(sum);
open inPacket,"test_in.txt";
open outPacket,"test_out.txt";
my @inpacketraw = <inPacket>;
my @outpacket = <outPacket>;

my @rttMatch = ""; #Out packet data
my @rttValues = ""; # RTT Values 
my @inpacket = "";
my @sstMatch = "";
my @sttValues= "";



	foreach $a (@outpacket)
		{
		
			my @values = split(',', $a);
	

     
			if (!$values[0]~~@rttMatch)
				{
					push (@rttMatch , "$values[1]","$values[2]");
					push (@sstMatch , "$values[1]","$values[0]"); # Store Data length 
#					push (@dataRate , "$values[4]");
				
						};
};

	foreach $n (@inpacketraw)
		{
			

				
			my @value = split(',', $n);
			if (!$value[0]~~@inpacket)
				{
					push (@inpacket , "$value[0]","$value[2]");
				 
};
				
		};
my $count =scalar(@inpacket);
		
		for($l= ;  $l<$count ; $l=$l+2)
		{ 
			$y=$inpacket[$l];
			print $y."\n";
			 my $x=$y+957; #Data length to be added
				if ($x~~@rttMatch)	
					{						
						print ""."\n";
						my $elle=%i, first_index { $_ eq $x } @rrtMatch;
						print $elle."\n";
						 $t=%i+1;
						 $rt=$rttMatch[$t];
						 $rr=$inpacket[$l+1];
						 $rtt=$rt-$rr;
						print $rtt . "\n";
						print $rr."\n";
						print $rt ."\n";
						push (@rttValues , "$rtt");
							 };

						 $idy=%i , first_index { $_ eq "$x" } @sstMatch;
						 $s=$idy+1;
						 $o=$sstMatch[$s];
						$seq=$o+957;# Data Length
							
						if ($seq~~@rttMatch)
							{
								my $idp = firstidx { $_ eq "$s" } @rrtMatch;
								my $u=$idp+1;

								my $sst = $rttMatch[$u]-$inpacket[$l+1];
								print $sst . "\n";
								push (@sstValues , "$sst"); 
							print @sstValues."\n";			
							};
						};

					

#print $rtt."\n";

close (inPacket);
close (outPacket);

