#!perl -T

use Test::More;
use lib 'local/lib/perl5';
eval "use Test::Pod 1.14";
plan skip_all => "Test::Pod 1.14 required for testing POD" if $@;
all_pod_files_ok();
