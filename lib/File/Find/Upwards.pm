package File::Find::Upwards;

use strict;
use warnings;
use Cwd;
use File::Spec::Functions qw/curdir updir rootdir rel2abs/;
use Attribute::Memoize;


our $VERSION = '0.02';


use base 'Exporter';


our %EXPORT_TAGS = (
    conf => [ qw/file_find_upwards/ ],
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} = [ map { @$_ } values %EXPORT_TAGS ] };


sub file_find_upwards :Memoize {
    my $wanted_file = shift;

    my $previous_cwd = getcwd;
    my $result;    # left undef as we'll return undef if we didn't find it
    while (rel2abs(curdir()) ne rootdir()) {
        if (-f $wanted_file) {
            $result = rel2abs(curdir());
            last;
        }
        chdir(updir());
    }
    chdir($previous_cwd);
    $result;
}


1;


__END__



=head1 NAME

File::Find::Upwards - FIXME

=head1 SYNOPSIS

    File::Find::Upwards->new;

=head1 DESCRIPTION

=head1 METHODS

=over 4



=back

File::Find::Upwards inherits from L<Exporter>.

The superclass L<Exporter> defines these methods and functions:

    as_heavy(), export(), export_fail(), export_ok_tags(), export_tags(),
    export_to_level(), import(), require_version()

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2008 by the authors.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

