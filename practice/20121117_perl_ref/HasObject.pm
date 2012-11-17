#!/usr/bin/perl

package HasObject;

use warnings;
use strict;
use CompositionRef;

sub new {
    my $thing = shift;
    my $class = ref $thing || $thing;
    my $self  = bless { @_ } => $class;
    $self->init() if $self->can('init');
    return $self;
}

sub init{
    my ($self) = @_;
    $self->{'object'} = CompositionRef->new;
}

sub method{
    my ($self) = @_;

    return $self->{'object'}->method;
}
1;
__END__
