# -*- perl -*-

use SDL;
use SDL::App;
use SDL::Image;

unless ( $ENV{'SDL_RELEASE_TESTING'} )
{
	$ENV{'SDL_VIDEODRIVER'} = 'dummy';
	$ENV{'SDL_AUDIODRIVER'} = 'dummy';

}

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 3;

BEGIN { use_ok( 'SDLx::TTF' ); }

can_ok( 'SDLx::TTF', ('print_text', 'PutString') );

my $d = SDL::App->new( -title => 'app', -width => 200, -height => 200, -depth => 32 );
my $s =  SDLx::TTF->new('t/font.png');
isa_ok( $s, 'SDLx::TTF' );

SDLx::TTF->print_text( $d, 10, 10, 'Huh' );

$s->use();

