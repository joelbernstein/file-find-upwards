#!/usr/bin/env perl

use warnings;
use strict;
use File::Find::Upwards ':all';
use Test::More tests => 2;

ok(file_find_upwards('Makefile.PL'), 'Makefile.PL exists above this');
ok(!file_find_upwards(
    'some_random_name_if_you_have_this_it_is_your_own_fault.txt'
    ), 'weirdly named file does not exist upwards');

