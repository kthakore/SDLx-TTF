# -*- perl -*-

use SDL;
use SDLx::App;
use SDL::Rect;
use SDL::Video;
use SDL::Image;
use SDL::Color;
use SDLx::TTF;

use Test::More;

# t/001_load.t - check module loading and most of the module cause I am lazy ok?

unless( $ENV{'SDL_RELEASE_TESTING'} )
{
   $ENV{'SDL_VIDEODRIVER'} = 'dummy';
   $ENV{'SDL_AUDIODRIVER'} = 'dummy';
	
}


my $d = SDLx::App->new( -title => 'app', -width => 200, -height => 200, -depth => 32 );
my $s =  SDLx::TTF->new('t/font.png');

isa_ok ($s, 'SDLx::TTF');
isa_ok ($s, 'SDL::Surface');

SDL::Video::fill_rect($d, SDL::Rect->new(0,0,$d->w,$d->h), SDL::Video::map_RGB( $d->format, 255, 255, 255 ) );
SDLx::TTF::print_text($d, 10, 10, 'KARTIK' );

$s->use();

SDL::Video::flip($d);

sleep 1 if $ENV{'SDL_RELEASE_TESTING'} ;

pass();

done_testing;
