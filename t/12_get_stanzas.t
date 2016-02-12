#!/usr/bin/perl 
use strict;
use warnings;

use Data::Dumper;
use Test::More;

use lib qw { . };
use lib qw { lib local/lib/perl5 };
use Test::Deep;

BEGIN {
        use_ok( 'Config::Simple::Extended' );
}

my @methods = ('get_stanzas');
foreach my $method (@methods){
  can_ok('Config::Simple::Extended',$method);
}

my $ini = 't/multiple_stanzas.ini';
my $cfg = Config::Simple::Extended->new( filename => $ini );

my $stanzas = $cfg->get_stanzas();
my @stanzas = sort @{$stanzas};
my @expected = ( 'bar', 'default', 'foo' );
cmp_deeply( \@stanzas, \@expected, 'We found the expected stanzas in the $cfg object' ) 
  or diag Dumper $stanzas;

done_testing();

