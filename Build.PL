use strict;
use warnings;
use Module::Build;
use Alien::SDL;
use SDL::Config;
# See perldoc Module::Build for details of how this works

die ' Need SDL_IMAGE installed' if !SDL::Config->has('SDL_image');

my $prefix = Alien::SDL->config('prefix');
my $cflags = Alien::SDL->config('cflags');
$cflags = '-I'
  . File::Spec->catfile( $prefix, 'include' )
    ;
$cflags .= ' -fnested-functions' if $^O =~ /darwin/;

my @linkers = ( Alien::SDL->config('libs', '-lSDL_image'));


my $builder = Module::Build->new( 
      module_name     => 'SDLx::TTF',
      dist_author     => 'Kartik Thakore <kthakore@cpan.org>',
      dist_version_from => 'lib/SDLx/TTF.pm',
      requires =>
      {
	'SDL' => '2.404',
	'Alien::SDL' => '1.3'
      },
      configure_requires => {
	'SDL' => '2.404',
	'Alien::SDL' => '1.3'
      },
       build_requires => {
	'SDL' => '2.404',
	'Alien::SDL' => '1.3'
      },
    extra_compiler_flags => [ $cflags ],
    extra_linker_flags   => \@linkers,
      c_source        => 'src',
      license         => 'perl'
    );

$builder->create_build_script();
