package Locale::Iconv;

# Copyright (c) 1997, Michael Piotrowski

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA = qw(Exporter AutoLoader DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw(
	convert
);
$VERSION = '0.01';

bootstrap Locale::Iconv $VERSION;

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the documentation for the module.

=head1 NAME

Locale::Iconv - Perl interface to the XPG4 iconv() function

=head1 SYNOPSIS

  use Locale::Iconv;
  $converter = Locale::Iconv->new("fromcode", "tocode");
  $converted = $converter->convert("Text to convert");

=head1 DESCRIPTION

The I<Locale::Iconv> module provides a Perl interface to the iconv()
function as defined by the X/Open Single UNIX Specification (XPG4).
The convert() method converts the encoding of characters in the input
string from the I<fromcode> code set to the I<tocode> code set, and
returns the result.

Settings of I<fromcode> and I<tocode> and their permitted combinations
are implementation-dependent. Valid values are specified in the system
documentation

=head2 Interoperability

Locale::Iconv can be used with Gisle Aas' Unicode module (available from
CPAN) to convert between Unicode and other character sets, provided
that there are Unicode conversion tables on the system.

=head1 ERRORS

If the conversion can't be initialized an error is generated (using
croak()). If an error occurs in the conversion a warning describing
the problem is emitted (using warn()) and I<undef> is returned.

Consult L<iconv(3)> for details on errors that might occur.

=head1 NOTES

The quality of the conversion is system-dependent.

=head1 AUTHOR

Michael Piotrowski, mxp@linguistik.uni-erlangen.de

=head1 SEE ALSO

perl(1), iconv(3), Unicode::String(3).

=cut
