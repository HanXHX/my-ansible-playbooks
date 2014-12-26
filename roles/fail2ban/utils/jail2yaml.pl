#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use Data::Dumper;


unless(defined $ARGV[0] && -f $ARGV[0])
{
	die("$0 filename");
}

my $raw_data = {};

my $section = undef;
my $last_key;
open(FILE, '<', $ARGV[0]) or die('!!!');
while(<FILE>)
{
	chomp;
	my $line = $_;
	next if /^#/ || /^\s*$/;

	my ($section_input) = ($_ =~ /^\[([\w\-]+)\]$/);

	if(defined $section_input)
	{
		next if($section_input eq 'DEFAULT');
		$section = $section_input;
		next;
	}

	next unless defined $section;

	# Remove inline comments
	$line =~ s/\s*;.*$//g;


	#my ($key, $value) = ($line =~ /^(\w+)\s*=\s*([\w\s=_,\/\.\-\[\]\*]+?)\s*$/);
	my ($key, $value) = ($line =~ /^([\w_\-]+?)\s*=\s*(.+)\s*$/);
	unless(defined $key && defined $value)
	{
		say $_;
		print Dumper ($key, $value);
		# prevent parse bug
		say STDERR "Parse problem -> $section. SKIPPING";
		delete $raw_data->{$section};
		$section = undef;
		next;
	}
	$raw_data->{$section}->{$key} = $value;
	$last_key = $key;
}
close(FILE);


say 'fail2ban_jails:';

foreach my $k (keys %{$raw_data})
{
	printf("  - section: '%s'\n", $k);
	foreach my $f(keys %{$raw_data->{$k}})
	{
		printf("    %s: '%s'\n", $f, $raw_data->{$k}->{$f});
	}
}

