package File::Find::Upwards;

use strict;
use warnings;
use Cwd;
use File::Spec::Functions qw/curdir updir rootdir rel2abs/;
use Attribute::Memoize;


our $VERSION = '0.01';


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

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - FIXME

=head1 SYNOPSIS

    {% p.package %}->new;

=head1 DESCRIPTION

=head1 METHODS

=over 4

{% p.write_methods %}

=back

{% p.write_inheritance %}

{% PROCESS standard_pod %}

=cut

