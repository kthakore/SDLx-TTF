# -*- perl -*-

use SDL;
use SDL::App;
use SDL::Image;

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 3;

BEGIN { use_ok( 'SDLx::TTF' ); }

can_ok( 'SDLx::TTF', ('print_text', 'PutString') );

my $d = SDL::App->new( -title => 'app', -width => 200, -height => 200, -depth => 32 );

isa_ok( SDLx::TTF->new('t/font.png'), 'SDLx::TTF' );

SDLx::TTF->print_text( $d, 10, 10, 'Huh' );

