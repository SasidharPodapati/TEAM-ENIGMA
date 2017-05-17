#!/usr/bin/perl
use strict;
my $i=-1;
#my $endtime=time()+60;
my @cmd="sudo capdump --packets=20000 -i eth2 -tcp -o test.cap 01::72 01::71";
push (@cmd , "cap2pcap -o test.pcap test.cap"); 
push (@cmd , "tshark -r test.pcap 'tcp.flags==0x02' -o tcp.relative_sequence_numbers:FALSE -T fields -e tcp.seq -e tcp.ack -e frame.time_epoch -e tcp.len -e tcp.options.timestamp.tsval -E separator=',' > test_in.txt");
push (@cmd , "tshark -r test.pcap 'tcp.flags==0x12 or tcp.flags==0x10' -o tcp.relative_sequence_numbers:FALSE -T fields -e tcp.seq -e tcp.ack -e frame.time_epoch -e tcp.len -e tcp.options.timestamp.tsval -E separator=',' > test_out.txt");
#push (@cmd , "tshark -r test.pcap 'tcp.flags==0x02' -T fields -e frame.time > test_date.txt");
print @cmd . "\n";
foreach $a (@cmd) {

system("$a");
sleep 15;
};
 system ("perl elle.pl");
