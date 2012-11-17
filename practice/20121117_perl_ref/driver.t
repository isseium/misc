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

subtest "コンポジションでのメソッド呼び出し; 間接呼び出し" => sub{
    my $test = HasObject->new;

    is($test->{'object'}->{'refCount'}, 0);
    my $res = $test->method;
    is($test->{'object'}->{'refCount'}, 1);
    ok($res eq "this is result");
    is($test->{'object'}->{'refCount'}, 1); # ここが 2 だと評価時に呼ばれているはず
    done_testing;
};

subtest "コンポジションでのメソッド呼び出し; 直呼び出し" => sub{
    my $test = HasObject->new;

    is($test->{'object'}->{'refCount'}, 0);
    my $res = $test->{'object'}->method;
    is($test->{'object'}->{'refCount'}, 1);
    ok($res eq "this is result");
    is($test->{'object'}->{'refCount'}, 1); # ここが 2 だと評価時に呼ばれているはず
    done_testing;
};

done_testing;
