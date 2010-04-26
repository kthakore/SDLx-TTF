# -*- perl -*-

use SDL;
use SDL::Image;

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'SDLx::TTF' ); }

can_ok( 'SDLx::TTF', ('print_text', 'PutString') );

