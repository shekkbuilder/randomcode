#!/usr/bin/perl
#simple perl script to get all cpanel usernames using cpanel api
#its using access hash auth and cpanel xml api
use strict;
use LWP::UserAgent;
use XML::Simple;
use Data::Dumper;

my $hash = `cat /root/.accesshash`;

$hash =~ s/\n//g;
my $auth = "WHM root:" . $hash;

my $ua = LWP::UserAgent->new;
my $request = HTTP::Request->new( GET => "http://127.0.0.1:2086/xml-api/listaccts" );
$request->header( Authorization => $auth );
my $response = $ua->request($request);
my $xml_string = $response->content;
my $xml_hashref = XMLin($xml_string);
for ( my $i = 0; $i < @{$xml_hashref->{'acct'}} ; $i++ )
{
print @{$xml_hashref->{'acct'}}[$i]->{'user'} . "\n";
}
