# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'SDLx::TTF' ); }

my $object = SDLx::TTF->new ();
isa_ok ($object, 'SDLx::TTF');


