#!/usr/bin/perl

package CompositionRef;

use warnings;
use strict;

sub new {
    my $thing = shift;
    my $class = ref $thing || $thing;
    my $self  = bless { @_ } => $class;
    $self->init() if $self->can('init');
    return $self;
}

sub init{
    my ($self) = @_;
    $self->{'refCount'} = 0;
}

sub method{
    my ($self) = @_;

    $self->{'refCount'}++;
    return ['this is result'];
}
1;
__END__
