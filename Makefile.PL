
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tools for integrating with the New Zealand igovt logon service (now \"RealMe\")",
  "AUTHOR" => "Grant McLean <grant\@catalyst.net.nz>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Authen-NZigovt",
  "EXE_FILES" => [
    "bin/nzigovt"
  ],
  "LICENSE" => "perl",
  "NAME" => "Authen::NZigovt",
  "PREREQ_PM" => {
    "Crypt::OpenSSL::RSA" => 0,
    "Crypt::OpenSSL::X509" => 0,
    "Date::Parse" => 0,
    "Digest::SHA1" => 0,
    "IO::Compress::RawDeflate" => 0,
    "LWP" => 0,
    "URI" => 0,
    "WWW::Curl" => 0,
    "XML::Generator" => 0,
    "XML::LibXML" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.88"
  },
  "VERSION" => "1.06",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



