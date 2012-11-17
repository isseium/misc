#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use CompositionRef;
use HasObject;

subtest "コンポジションなしでのメソッド呼び出し" => sub{
    my $test = CompositionRef->new;

    is($test->{'refCount'}, 0);
    my $res = $test->method;
    is($test->{'refCount'}, 1);
    is($res, "this is result");
    is($test->{'refCount'}, 1);
    done_testing;
};

subtest "コンポジションでのメソッド呼び出し" => sub{
    my $test = HasObject->new;

    is($test->{'object'}->{'refCount'}, 0);
    my $res = $test->method;
    is($test->{'object'}->{'refCount'}, 1);
    my $a = $res;
    ok($res eq "this is result");
    is($test->{'object'}->{'refCount'}, 1);
    done_testing;
};

done_testing;
