#!/usr/bin/perl

use strict;
use warnings;

use feature qw/switch say/;
use Getopt::Long;
use Mail::DeliveryStatus::BounceParser;
use Sys::Syslog;
use Data::Dumper;
use LWP::UserAgent;
use HTTP::Request;

my @cpy_ARGV = @ARGV;
my $debug = 0;
my $bounce_url = undef;

# --------------------------------------------------- #
# Check args
# --------------------------------------------------- #
GetOptions(
	'd|debug' => \$debug,
	'h|help' => sub { my_usage(); },
	'u|url=s' => \$bounce_url
);

my_usage() unless defined $bounce_url;


# --------------------------------------------------- #
#   Signals
# --------------------------------------------------- #
$SIG{INT}	= \&on_exit;
$SIG{TERM}	= \&on_exit;
$SIG{QUIT}	= \&on_exit;
$SIG{ALRM}	= sub { 
	mylog('critical', 'alarm!!!');
	closelog();
	exit 1;
};
alarm(60);

# --------------------------------------------------- #
#   Log
# --------------------------------------------------- #
$0 =~ s|.+/(.+)\.pl$|$1|;
openlog($0, "nofatal,pid", 'mail');
mylog('debug', sprintf('Calling script %s %s', $0, join(' ', @cpy_ARGV) ));


# --------------------------------------------------- #
#   STDIN
# --------------------------------------------------- #
my $stdin = '';
$stdin .= $_ while(<STDIN>);


# --------------------------------------------------- #
#   Check ARF
# --------------------------------------------------- #
my $report = '';
my $is_arf = 0;

eval
{
    $report = Email::ARF::Hotmail->create_report($stdin);
};

if($@ || $report eq '')
{
    eval
    {
        $report = Email::ARF::Report->new($stdin);
    };

    if($@ || $report eq '')
    {
        mylog('info', "Not ARF!");
    }
    else
    {
        $is_arf++;
    }
}
else
{
    $is_arf++;
}

if($is_arf)
{
    mylog('info', 'Complaint from: ' . $report->field('Original-Rcpt-To'));
    report_bounce(
		$report->field('Original-Rcpt-To'), 
		'spam',
		'spam'
	);
    on_exit();
}



# --------------------------------------------------- #
#   Preload message
# --------------------------------------------------- #
my $bounce = eval { Mail::DeliveryStatus::BounceParser->new($stdin); };

if ($@)
{
    mylog('warning', "Unable to parse: [$!] $@$/");
}

my @addresses = $bounce->addresses;       # email address strings
my @reports	= $bounce->reports;         # Mail::Header objects


# --------------------------------------------------- #
#   Is bounce?
# --------------------------------------------------- #

if (!$bounce->is_bounce() or scalar @reports == 0)
{
    mylog('info', 'Not bounce!');
    on_exit();
}



# --------------------------------------------------- #
#   Parse bounce :)
# --------------------------------------------------- #
my $bounce_type;
foreach my $a (@reports)
{
    my $bouncedmail = $a->get('email');
    my $bounce_type = 'unknow'; # all types: qw/hard soft unknow/

    # Nothing to do...
    if($a->get('std_reason') =~ /no_problemo|message_too_large|over_quota/ )
    {
        $bounce_type = 'soft';
        mylog('info', 'Nothing to do with this reason');
		goto END_FOREACH;
    }

    # Shitty reasons :)
    if ( $a->get('std_reason') eq qq/unknown/ )
    {
        mylog('debug', 'Not bounce!');
        on_exit();
    }
    elsif($a->get('std_reason') =~ /^(user_unknown|domain_error|user_disabled)$/ )
    {
        $bounce_type = 'hard';
    }
	else
    {
        mylog('warning', 'Unknow reason: ' . $a->get('std_reason') );
        on_exit();
    }

	END_FOREACH:
    report_bounce($bouncedmail, $bounce_type, $a->get('std_reason'));
}

on_exit();

sub report_bounce
{
	my ($email, $type, $reason) = @_;
	$email = lc $email;
	mylog('notice', "Bounce detected: $email [$type/$reason]");
	
	my $genurl =~ $bounce_url;
	$genurl =~ s/_email_/$email/g;
	$genurl =~ s/_type_/$type/g;
	$genurl =~ s/_reason_/$reason/g;

	get($genurl);
}


sub my_usage
{
	say STDERR sprintf(
		'Usage: %s -u URL [ -d | --debug ] [ -h | --help ]' . "\n URL format => http://www.mysite.com/?email=_email_&type=_type_&reason=_reason_",
		$0
	);
	exit 1;
}

sub mylog
{
    my ($level, $msg) = @_;
    syslog($level, $msg);
    say sprintf(
		'%-10s %s',
		'[' . $level . ']', $msg
	) if $debug;
}

sub on_exit
{
    mylog('debug', 'Exiting');
    closelog();
    exit;
}

