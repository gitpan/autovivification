#!perl -T

use strict;
use warnings;

use Test::More tests => 6 * 3 * 64;

use lib 't/lib';
use autovivification::TestCases;

while (<DATA>) {
 1 while chomp;
 next unless /#/;
 testcase_ok($_, '%');
}

__DATA__

--- keys ---

$x # keys %$x # '', 0, { }
$x # keys %$x # '', 0, undef #
$x # keys %$x # '', 0, undef # +fetch
$x # keys %$x # '', 0, { }   # +exists
$x # keys %$x # '', 0, { }   # +delete
$x # keys %$x # '', 0, { }   # +store

$x # keys %$x # qr/^Reference vivification forbidden/, undef, undef # +strict +fetch
$x # keys %$x # '', 0, { } # +strict +exists
$x # keys %$x # '', 0, { } # +strict +delete
$x # keys %$x # '', 0, { } # +strict +store

$x # [ keys %$x ] # '', [ ], { }
$x # [ keys %$x ] # '', [ ], undef #
$x # [ keys %$x ] # '', [ ], undef # +fetch
$x # [ keys %$x ] # '', [ ], { }   # +exists +delete +store

$x->{a} ='b' # [ keys %$x ] # '', [ 'a' ], { a => 'b' }
$x->{a} ='b' # [ keys %$x ] # '', [ 'a' ], { a => 'b' } #
$x->{a} ='b' # [ keys %$x ] # '', [ 'a' ], { a => 'b' } # +fetch
$x->{a} ='b' # [ keys %$x ] # '', [ 'a' ], { a => 'b' } # +exists +delete +store

$x # keys %{$x->{a}} # '', 0, { a => { } }
$x # keys %{$x->{a}} # '', 0, undef        #
$x # keys %{$x->{a}} # '', 0, undef        # +fetch
$x # keys %{$x->{a}} # '', 0, { a => { } } # +exists
$x # keys %{$x->{a}} # '', 0, { a => { } } # +delete
$x # keys %{$x->{a}} # '', 0, { a => { } } # +store

$x # keys %{$x->{a}} # qr/^Reference vivification forbidden/, undef, undef # +strict +fetch
$x # keys %{$x->{a}} # '', 0, { a => { } } # +strict +exists
$x # keys %{$x->{a}} # '', 0, { a => { } } # +strict +delete
$x # keys %{$x->{a}} # '', 0, { a => { } } # +strict +store

$x # [ keys %{$x->{a}} ] # '', [ ], { a => { } }
$x # [ keys %{$x->{a}} ] # '', [ ], undef        #
$x # [ keys %{$x->{a}} ] # '', [ ], undef        # +fetch
$x # [ keys %{$x->{a}} ] # '', [ ], { a => { } } # +exists +delete +store

--- values ---

$x # values %$x # '', 0, { }
$x # values %$x # '', 0, undef #
$x # values %$x # '', 0, undef # +fetch
$x # values %$x # '', 0, { }   # +exists
$x # values %$x # '', 0, { }   # +delete
$x # values %$x # '', 0, { }   # +store

$x # values %$x # qr/^Reference vivification forbidden/, undef, undef # +strict +fetch
$x # values %$x # '', 0, { } # +strict +exists
$x # values %$x # '', 0, { } # +strict +delete
$x # values %$x # '', 0, { } # +strict +store

$x # [ values %$x ] # '', [ ], { }
$x # [ values %$x ] # '', [ ], undef #
$x # [ values %$x ] # '', [ ], undef # +fetch
$x # [ values %$x ] # '', [ ], { }   # +exists +delete +store

$x->{a} ='b' # [ values %$x ] # '', [ 'b' ], { a=>'b' }
$x->{a} ='b' # [ values %$x ] # '', [ 'b' ], { a=>'b' } #
$x->{a} ='b' # [ values %$x ] # '', [ 'b' ], { a=>'b' } # +fetch
$x->{a} ='b' # [ values %$x ] # '', [ 'b' ], { a=>'b' } # +exists +delete +store

$x # values %{$x->{a}} # '', 0, { a => { } }
$x # values %{$x->{a}} # '', 0, undef        #
$x # values %{$x->{a}} # '', 0, undef        # +fetch
$x # values %{$x->{a}} # '', 0, { a => { } } # +exists
$x # values %{$x->{a}} # '', 0, { a => { } } # +delete
$x # values %{$x->{a}} # '', 0, { a => { } } # +store

$x # values %{$x->{a}} # qr/^Reference vivification forbidden/, undef, undef # +strict +fetch
$x # values %{$x->{a}} # '', 0, { a => { } } # +strict +exists
$x # values %{$x->{a}} # '', 0, { a => { } } # +strict +delete
$x # values %{$x->{a}} # '', 0, { a => { } } # +strict +store

$x # [ values %{$x->{a}} ] # '', [ ], { a => { } }
$x # [ values %{$x->{a}} ] # '', [ ], undef        #
$x # [ values %{$x->{a}} ] # '', [ ], undef        # +fetch
$x # [ values %{$x->{a}} ] # '', [ ], { a => { } } # +exists +delete +store