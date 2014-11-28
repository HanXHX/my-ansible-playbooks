#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use Data::Dumper;
use Getopt::Long;

my $dirs = {
	'defaults' => 1,
	'files' => 0,
	'handlers' => 0,
	'tasks' => 1,
	'templates' => 0
};

my $role_name = undef;

GetOptions(
	'n|name=s' => sub { $role_name = lc($_[1]); }, 
	'defaults' => sub { $dirs->{defaults} = 1 },
	'files' => sub { $dirs->{files} = 1 },
	'handlers' => sub { $dirs->{handlers} = 1 },
	'tasks' => sub { $dirs->{tasks} = 1 },
	'templates' => sub { $dirs->{templates} = 1 }
);


unless(defined $role_name && -d './roles')
{
	say STDERR 'fail';
	exit 1;
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

	print Dumper $cdirmain;

	next if(-f $cdirmain || $dir !~ /^(defaults|tasks)$/);

	say "aaaaaaaaa";

	open(MAIN, '>', $cdirmain) or die($cdirmain);
	print MAIN "---\n\n" if $dir eq 'tasks';
	close(MAIN);

}


my $readme_file = sprintf('%s/README.md', $base_dir);

unless(-f $readme_file)
{

	my $readme = sprintf <<EOF, ucfirst($role_name), '=' x length($role_name); 
%s ROLE
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
