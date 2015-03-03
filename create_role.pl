#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use Getopt::Long;

my $dirs = {
	'defaults' => 0,
	'files' => 0,
	'handlers' => 0,
	'meta' => 0,
	'tasks' => 1,
	'templates' => 0,
	'vars' => 0
};

my $role_name = undef;

GetOptions(
	'n|name=s' => sub { $role_name = lc($_[1]); }, 
	'defaults' => sub { $dirs->{defaults} = 1 },
	'files' => sub { $dirs->{files} = 1 },
	'handlers' => sub { $dirs->{handlers} = 1 },
	'tasks' => sub { $dirs->{tasks} = 1 },
	'templates' => sub { $dirs->{templates} = 1 },
	'vars' => sub { $dirs->{vars} = 1 },
	'h|help' => sub { my_usage(); }
);


unless(defined $role_name && -d './roles')
{
	my_usage();
}


my $base_dir = sprintf('./roles/%s', $role_name);
mkdir($base_dir) unless -d $base_dir;

while(my ($dir, $action) = each %{$dirs})
{
	print "[$dir] ";
	if($action == 0)
	{
		say "SKIP";	
		next;
	}
	say "OK";
	my $cdir = sprintf('%s/%s', $base_dir, $dir);
	mkdir($cdir) unless -d $cdir;

	my $cdirmain = sprintf('%s/%s/main.yml', $base_dir, $dir);

	next if(-f $cdirmain || $dir !~ /^(defaults|tasks|meta|vars|handlers)$/);

	open(MAIN, '>', $cdirmain) or die($cdirmain);
	print MAIN "---\n\n" if $dir =~ '/(tasks|handlers|meta)';
	close(MAIN);
}


my $readme_file = sprintf('%s/README.md', $base_dir);

unless(-f $readme_file)
{

	my $readme = sprintf <<EOF, ucfirst($role_name), '=' x length($role_name); 
%s role
%s=====

Actions
-------

- TODO

Variables
---------

- TODO

Notes
-----

- TODO
EOF

	open(README, '>', $readme_file) or die('readme');
	say README $readme;
	close(README);
}

sub my_usage
{
	say STDERR "Usage: $0 -n role_name [ --defaults  ] [ --files ] [ --handlers  ] [ --tasks ] [ --templates ] [ --vars ] [ -h | help ]  ";
	exit 1;
}

